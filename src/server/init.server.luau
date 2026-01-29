local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Packets = require(ReplicatedStorage.Shared.Packets)
local ClassPP = require(ReplicatedStorage.Packages.classpp)
local Promise = require(ReplicatedStorage.Packages.promise)
local DataService = require(ReplicatedStorage.Packages.dataservice).server
--local ProfileStoreTest = require(script.ProfileStoreTest)

-- util
local DeepCopyTable = require(ReplicatedStorage.Shared.DeepCopyTable)

local players = {}

-- server Data
--local ProfileStore = if game.RunService:IsServer() then require(ReplicatedStorage.Packages._Index["lm-loleris_profilestore@1.0.3"].profilestore) else nil :: any
local ProfileStore = require(ReplicatedStorage.Packages._Index["lm-loleris_profilestore@1.0.3"].profilestore)
local ServerDataTemplate = require(ServerScriptService.Configurations.ServerDataTemplate)
local LeaderboardData = ServerDataTemplate.LeaderboardData

-- profiles
local playerTemplate = require(ServerScriptService.Configurations.PlayerProfileTemplate)
local templateClass = ClassPP.class("PlayerPublicData")({Public = playerTemplate})

-- sales Item Template
local SalesItems = require(ServerScriptService.Configurations.SalesItems)

local SalesItemsCopy = DeepCopyTable(SalesItems)
local SalesItemsClassPP = ClassPP.class("SalesItems")(SalesItemsCopy)

 function SalesItemsClassPP.Public:getPrivate(title)
	 return self.testItem[title]
 end

-- DataService는 Player profile용. ServerData는 profilestore로 DataService 새로 만들것.

function init()
	playerTemplate.localDatas.salesItems = table.freeze(table.clone(SalesItems.Public))
	
	DataService:init({
		template = playerTemplate,
		profileStoreIndex = "PlayerData",
		useMock = true,
	})
	
end
init()

local function setLeaderboardStoreData(player, profile)
	local player = game:GetService("Players"):FindFirstChild(player.Name)
	local userId: number = if player then player.UserId else 0 -- 오프라인 플레이어의 UserId는 0 또는 별도 로직으로 처리 필요
	
	if userId > 0 then
		-- 1. Point 리더보드 항목 생성
		table.insert(LeaderboardData.TopPointUsers, {
			name = player.Name,
			UserId = userId,
			Point = profile.Point,
		})

		-- 2. Robux 리더보드 항목 생성 (amountRobux를 totalUsedRobux로 매핑)
		table.insert(LeaderboardData.TopRobuxUsers, {
			name = player.Name,
			UserId = userId,
			totalUsedRobux = profile.amountRobux,
			--daytimeOfTheLatestRobuxSpend = profile.latestconnect, -- 최근 접속 시간을 지출 시간으로 임시 매핑
			--categoryOfTheMostRobuxSpend = nil, -- 프로필 데이터에 없으므로 nil 처리
			--categoryOfMostRecentRobuxSpent = nil, -- 프로필 데이터에 없으므로 nil 처리
		})
		
		-- 3. Playtime 리더보드 항목 생성
		table.insert(LeaderboardData.TopPlaytimeUsers, {
			name = player.Name,
			UserId = userId,
			totalPlayTime = profile.totalPlayTime,
			--firstconnect = profile.firstconnect,
			--latestconnect = profile.latestconnect,
			--longstconnectiontime = nil, -- 프로필 데이터에 없으므로 nil 처리
		})

	end
	
	-- 내림차순 정렬
	table.sort(LeaderboardData.TopPointUsers, function(a, b) return a.Point > b.Point end)
	table.sort(LeaderboardData.TopRobuxUsers, function(a, b) return a.totalUsedRobux > b.totalUsedRobux end)
	table.sort(LeaderboardData.TopPlaytimeUsers, function(a, b) return a.totalPlayTime > b.totalPlayTime end)
	
	-- leaderboard 표시제한 개수 정리.
	if #LeaderboardData.TopPointUsers > 100 then
		table.remove(LeaderboardData.TopPointUsers, #LeaderboardData.TopPointUsers)
	end
	if #LeaderboardData.TopRobuxUsers > 100 then
		table.remove(LeaderboardData.TopRobuxUsers, #LeaderboardData.TopRobuxUsers)
	end
	if #LeaderboardData.TopPlaytimeUsers > 100 then
		table.remove(LeaderboardData.TopPlaytimeUsers, #LeaderboardData.TopPlaytimeUsers)
	end
end

Players.PlayerAdded:Connect(function(player)
	players["player"..player.UserId] = {
		name = player.Name,
		--classPP = templateClass.new(),
		-- SalesItemPP = SalesItemsClassPP.new(),
		profile = DataService:hasProfile(player) 
		and DataService:getProfile(player) 
		or DataService:waitForData(player)
	}

	-- local SItemPP = players["player"..player.UserId].SalesItemPP

	--Packets.salesItems:FireClient(player, {salesItems = SalesItems.Public})
	local salesItemsResponse = Packets.dataTable:FireClient(player, {
		Public = SalesItems.Public,
		--Private = SalesItems.Private
	}); print("salesItemsResponse",salesItemsResponse)

	-- can filtering SalesItems by some profile data and set refaired SalesItems
	--DataService:set(player, {"salesItems"}, SalesItems.Public) -- add SalesItems table, set to empty table
	
	player.CharacterAdded:Connect(function(character)
	end)
	
	warn("profile",players["player"..player.UserId].profile._data)
	setLeaderboardStoreData(player, players["player"..player.UserId].profile)
	print("LeaderboardData",LeaderboardData)
	
end)

local function clientAccess(player, dict)
	--print(player, "-->", dict)
	
	for key, value in pairs(dict) do
		if key == "point" then
			DataService:update(player, {key}, function(currentdata)
				return currentdata + value
			end)
			
		elseif key == "weapons" then
			DataService:set(player, {"progress", key}, value)	
			DataService:update(player, {"inventory", key}, function(currentdata)	
				return value
			end)
			
		elseif key == "functionItem" then 
			-- arrayInsert는 중복 비교없이 단순 insert.
			--for _, data in pairs(value) do
			--	DataService:arrayInsert(player, {"progress", key}, data) -- table, not dictionary
			--end
			
			-- inventory 추가 필요시 별도 update.
			DataService:update(player, {"progress", key}, function(currentdata)
				local tab = currentdata
				for datakey, data in pairs(value) do
					if table.find(tab, data) then
						continue
					else
						table.insert(tab, data)
					end
				end
				return tab
			end)
		end	
	end	
	
	print("ataService:get", DataService:get(player)) 
	
	return next(dict)
end


-- packets
Packets.ProfileUpdate.OnServerInvoke = clientAccess
