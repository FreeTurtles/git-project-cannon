return table.freeze({	-- instant sample template, id = AssetId
	Public = {
		Event = {},	
		GamePass = {},
		Credit = {
			R10_C100 = {id = "12345", imageId = "12345678", orderCode = "CR_R100_C10k"},
			R100_C10k = {id = "23456", imageId = "23456785", orderCode = "CR_R100_C10k"},
			R1000_C200k = {id = "34567", imageId = "4577678", orderCode = "CR_R1000_C200k"},
		},
		Emote = {
			CrazyDance = {id = "000000", Cash = 100, Robux = 10},
			SmoothMotion = {id = "000001", Cash = 100, Robux = 10},
		},
		Skin = {},
		Pet = { 
			PuppyLevel1 = {id="packageId.", Cash = 100, Robux = 10},
			CatLevel1 = {id="packageId..", Cash = 200, Robux = 20}
		},
		Weapon = {"Pistol", "ShotGun", "AK-47white"},
		Effect = {},
		Limited = {
			package1 = {list = {"Pistol","FlashLight"}, Cash = 100, Robux = 10},
			package2 = {"AK-47","FlashLight","DoubleJump", Cash = 500, Robux = 20}
		},
		accesory = {},
		Craft = {
			FlashLight = {id="11111111",Cash = 10, Robux = 1},
		},
	},
	Private = {
		testItem = {item1 = "Sec1", item2 = 098765}
	},
	--Friend = 
})
--[[
	Event = {},		-- event sales item of limited days
	GamePass = {},	-- package of item, credits, etc..
	Credit = {},	-- Coin/Point/Gem etc.. with Robux
	Emote = {},		-- animations
	Skin = {},		-- meterial texture
	Pet = {},		-- pet has abilities that increase of power/speed/etc.. 
	Weapon = {},
	Effect = {},	-- particle/beam/etc.. of weapon or character or function motion ~
	Limited = {},	-- event sales or level limit sales items
	accesory = {},	-- accessory of can equip in game, hat, mask, cloths, etc..
	Craft = {},		-- skill or functional item, ex) flash light, hammer, etc..
]]