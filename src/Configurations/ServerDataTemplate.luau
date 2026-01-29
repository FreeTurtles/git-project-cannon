--!strict

type topPointUsers = {
	name: string,
	UserId: number,
	Point: number
}

type topPlaytimeUsers = {
	name: string,
	UserId: number,
	totalPlayTime: number, -- 총 플레이 시간 (단위: 초 또는 분)
	firstconnect: string, -- 첫 접속 일시 (ISO 8601 형식 또는 YYYY-MM-DD HH:MM:SS)
	latestconnect: string, -- 최근 접속 일시 (ISO 8601 형식 또는 YYYY-MM-DD HH:MM:SS)
	longstconnectiontime: number, -- 최장 연속 접속 시간 (단위: 초 또는 분)
}

type topRobuxUsers = {
	name: string,
	UserId: number,
	totalUsedRobux: number,
	daytimeOfTheLatestRobuxSpend: string, -- 최근 Robux 사용 일시
	categoryOfTheMostRobuxSpend: string, -- 가장 많이 사용한 Robux 카테고리
	categoryOfMostRecentRobuxSpent: string, -- 가장 최근 사용한 Robux 카테고리
}

-- 최종 반환될 모듈 테이블 타입
export type LeaderboardDataType = {
	TopPointUsers: { topPointUsers }, -- topPointUsers 테이블들의 배열
	TopPlaytimeUsers: { topPlaytimeUsers }, -- topPlaytimeUsers 테이블들의 배열
	TopRobuxUsers: { topRobuxUsers }, -- topRobuxUsers 테이블들의 배열
}

return {
	LeaderboardData = {
		TopPointUsers = {},
		TopRobuxUsers = {},
		TopPlaytimeUsers = {}} :: LeaderboardDataType,
	
	-- AnotherServerData = {} :: AnotherDataType
}

--[[
local LeaderboardModule = {
	TopPointUsers = {},
	TopRobuxUsers = {},
	TopPlaytimeUsers = {},
} :: LeaderboardDataType

return {
LeaderboardData = {
	TopPointUsers = LeaderboardModule.TopPointUsers, -- 이 필드들은 실제 로직에 따라 값이 채워져야 합니다.
	TopPlaytimeUsers = LeaderboardModule.TopPlaytimeUsers,
	TopRobuxUsers = LeaderboardModule.TopRobuxUsers,
},
}

-- ModuleScript의 return 값 예시
function LeaderboardModule.GetLeaderboardData(): LeaderboardData
	-- 실제로 데이터를 가져오는 로직 (예: DataStore, 외부 API 등)
	local data: LeaderboardData = {
		TopPointUsers = {
			{name = "UserA", UserId = 12345, Point = 1000},
			{name = "UserB", UserId = 67890, Point = 950},
		},
		TopPlaytimeUsers = {
			{name = "UserC", UserId = 11223, totalPlayTime = 360000, firstconnect = "2023-01-01 10:00:00", latestconnect = "2024-12-05 15:30:00", longstconnectiontime = 7200},
		},
		TopRobuxUsers = {
			{name = "UserD", UserId = 44556, totalUsedRobux = 5000, daytimeOfTheLatestRobuxSpend = "2024-11-20 09:00:00", categoryOfTheMostRobuxSpend = "Cosmetics", categoryOfMostRecentRobuxSpent = "Boost"},
		},
	}
	return data
end
]]
