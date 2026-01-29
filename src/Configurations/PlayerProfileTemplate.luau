local DeepCopyTable = require(game.ReplicatedStorage.Shared.DeepCopyTable)

local DataTemplate = {
	achievements = {},
	level = {},
	badge = {},
	codes = {},
	events = {},
	inventory =   {
		functionItem = {},
		weapons = {},
	},
	notifications = {},
	totalPlayTime = 0,
	point = 0,
	progress =  {
		event = {},
		functionItem = {},
		quest = {},
		weapons = "",
	},
	settings = {},
	localDatas = {
		salesItems = {},
	},
	amountRobux = 0,
}

return DeepCopyTable(DataTemplate)