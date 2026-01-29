local Packet = require(game.ReplicatedStorage.Packages.packet)
return {
    -- string = Packet("ShortString", Packet.String):Response(Packet.Boolean8),
	-- stringLong = Packet("LongString", Packet.StringLong),
	-- numberValue = Packet("NumverValue", Packet.NumberS8),
	-- stringBoolen = Packet("StringBoolen", Packet.String, Packet.Boolean8),
	
	ProfileUpdate = Packet("ProfileUpdate", {	-- dictionary key를 Packet 생성시 고정하는 방법과 Any로 처리하는 방법이있다. 
		functionItem = {Packet.String}, -- table은 갯수에 상관없이{}과 type만 지정해주면된다.
		weapons = Packet.String,		-- key의 text길이는 server-client 양쪽 고정이라 Packet과 상관없다.
		point = Packet.NumberU8,
		Craft = Packet.Any
	}):Response(Packet.Boolean8),
	
	orderRequest = Packet("Order",{
		category = {Packet.String},
		ItemName = Packet.String,
		ItemId = Packet.Any,
	}):Response(Packet.Boolean8),
	
	--salesItems = Packet("SalesItems", {salesItems = Packet.Any})
	dataTable = Packet("DataTable", {
		Public = Packet.Any,
		Private = Packet.Any
	}):Response(Packet.Boolean8),
}	-- 용도별로 고정된 데이터타입,순서,갯수 등 정해서 Packet생성 후 양쪽에서 호출해 양식에 맞춰 송수신.