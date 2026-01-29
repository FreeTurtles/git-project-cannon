local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Packets = require(ReplicatedStorage.Shared.Packets)
local DataService = require(ReplicatedStorage.Packages.dataservice).client
DataService:init()

local player = Players.LocalPlayer
local profile

player.CharacterAdded:Connect(function(character)
	profile = DataService:get()
	--print("DataService client",profile)

end)

local tochangeData = {
	functionItem = {"TripleJump","Sliding"}, 
	weapons = "glock", 
	point = 150,
	Craft = {BaseballBat = {power = 1, range = 10, damage = 20}},
}

UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean) 
	if gameProcessedEvent then return end	

	if input.KeyCode == Enum.KeyCode.T then	--print("tochangeData",tochangeData)
		local reply = Packets.ProfileUpdate:Fire(tochangeData)
		warn("dictionary:Fire reply",reply)
	end
end)

local function salesItemsData(salesItems)
	print("OnClient salesItemsData",salesItems)
	-- salesItemsData.Public과 salesItemsData.Private 접근 가능
	--print(salesItems.Public.Credit)
	--print(salesItems.Public.Emote)
	return true
end

Packets.dataTable.OnClientInvoke = salesItemsData

--Packets.salesItems.OnClientEvent:Connect(function(salesItems)
--	print("salesItemsData",salesItems)
--	-- salesItemsData.Public과 salesItemsData.Private 접근 가능
--	print(salesItems.Public.Credit)
--	--print(salesItems.Public.Emote)
--end)