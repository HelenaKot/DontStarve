modimport("scripts/map/rooms/ModRooms.lua")

--GLOBAL.require("map/terrain")
GLOBAL.require("map/lockandkey")

--GLOBAL.require("map/tasks")

AddTask("TankBiome", {
		locks = GLOBAL.LOCKS.NONE,
		keys_given = GLOBAL.KEYS.MEAT,
		--entrance_room = "Entrance",
		room_choices = {
			["BGRedDesert"] = 1,
			["ScrapYard"] = 1,
			["ScrapPiles"] = 10,
		},  
		room_bg = GLOBAL.GROUND.SCRAPYARD,
		background_room = "BGRedDesert",
		colour={r=.9,g=.05,b=.05,a=1},
	})