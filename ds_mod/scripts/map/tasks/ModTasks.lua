modimport("scripts/map/rooms/ModRooms.lua")

--GLOBAL.require("map/terrain")
GLOBAL.require("map/lockandkey")
--GLOBAL.require("map/tasks")

AddTask("ScrapYard", {
		locks = GLOBAL.LOCKS.NONE,
		keys_given = GLOBAL.KEYS.MEAT,
		--entrance_room = "Entrance",
		room_choices = {
			["ScrapYard"] = 3,
			["PondyGrass"] = 1,
			["BuzzardyBadlands"] = 2,
		},  
		room_bg = GLOBAL.GROUND.SCRAPYARD,
		background_room = "BGDeepForest",
		colour={r=.05,g=.9,b=.9,a=1},
	})