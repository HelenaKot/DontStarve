modimport("scripts/tile_adder.lua")

GLOBAL.require("constants")
GLOBAL.require("map/terrain")
GLOBAL.require("map/level")
GLOBAL.require("map/tasks")

GLOBAL.terrain.rooms.Rocky.contents.distributeprefabs.ironboulder = 2
GLOBAL.terrain.rooms.BGNoise.contents.distributeprefabs.ironboulder = 0.1
GLOBAL.terrain.rooms.BGBadlands.contents.distributeprefabs.ironboulder = 0.2
GLOBAL.terrain.rooms.BGDirt.contents.distributeprefabs.ironboulder = 1
GLOBAL.terrain.rooms.SpiderVillage.contents.distributeprefabs.ironboulder = 1

if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then 
	GLOBAL.terrain.rooms.TallbirdNests.contents.distributeprefabs.ironboulder = 0.6
	GLOBAL.terrain.rooms.BGChessRocky.contents.distributeprefabs.ironboulder = 0.6
	GLOBAL.terrain.rooms.BGRocky.contents.distributeprefabs.ironboulder = 0.6
	GLOBAL.terrain.rooms.RockyBuzzards.contents.distributeprefabs.ironboulder = 0.2
	GLOBAL.terrain.rooms.GenericRockyNoThreat.contents.distributeprefabs.ironboulder = 0.6
	GLOBAL.terrain.rooms.MolesvilleRocky.contents.distributeprefabs.ironboulder = 0.6
end

GLOBAL.terrain.filter.ironboulder = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}

-- function NewTile(globalName, id, name, runsound, walksound, snowsound)
-- NewTile("SCRAPYARD", 8, "scrap", "dontstarve/movement/run_marble", "dontstarve/movement/walk_marble", "dontstarve/movement/run_ice")
AddTile("SCRAPYARD", 84, "scrap", {noise_texture = "levels/textures/noise_scrap.tex",    runsound="dontstarve/movement/run_marble", walksound="dontstarve/movement/walk_marble", snowsound="dontstarve/movement/run_ice", 
		mudsound = "dontstarve/movement/run_mud"}, {noise_texture = "levels/textures/mini_noise_scrap.tex"})

--[[		
AddRoom("ScrapYard", {
	--colour={r=0.2,g=0.0,b=0.2,a=0.3},
	value = GLOBAL.GROUND.SCRAPYARD,
	--tags = {"ForceConnected",   "MazeEntrance"},--"Maze",
	contents =  {
		distributepercent = 0.6,
		distributeprefabs= 
		{
			scrapheap1 = 1,
			scrapheap2 = 1,
			scrapheap3 = 1,
			scrapheap4 = 1,
			scrapheap5 = .5
		 },
	}
})
]]--
--GLOBAL.require("map/level")

modimport("scripts/map/tasks/ModTasks.lua")
modimport("scripts/map/rooms/ModRooms.lua")


--local LEVELTYPE = GLOBAL.LEVELTYPE

local function AddModTask(level)
	table.insert(level.tasks, "ScrapYard")
end

AddLevelPreInit("SURVIVAL_DEFAULT", AddModTask)
AddLevelPreInit("SURVIVAL_DEFAULT_PLUS", AddModTask)
AddLevelPreInit("COMPLETE_DARKNESS", AddModTask)