modimport("scripts/ModTuning.lua")
modimport("scripts/tile_adder.lua")

GLOBAL.require("constants")
GLOBAL.require("map/terrain")

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

AddTile("RED_DESERT", MOD_TUNING.RED_DESERT_ID, "red_desert", {noise_texture = "levels/textures/noise_red_desert.tex",    runsound="dontstarve/movement/run_dirt", walksound="dontstarve/movement/walk_dirt", snowsound="dontstarve/movement/run_snow", mudsound = "dontstarve/movement/run_mud"}, {noise_texture = "levels/textures/mini_noise_red_desert.tex"})
AddTile("SCRAPYARD", MOD_TUNING.SCRAP_ID, "scrap", {noise_texture = "levels/textures/noise_scrap.tex",    runsound="dontstarve/movement/run_marble", walksound="dontstarve/movement/walk_marble", snowsound="dontstarve/movement/run_ice", mudsound = "dontstarve/movement/run_mud"}, {noise_texture = "levels/textures/mini_noise_scrap.tex"})

--table.insert(GLOBAL.layout.ground_types, GROUND.SCRAPYARD)
		
GLOBAL.require("ModTuning")
GLOBAL.require("map/level")
GLOBAL.require("map/tasks")

MOD_TUNING.SCRAP_REAL_ID = GLOBAL.GetTileInfo(GLOBAL.GROUND.SCRAPYARD)
 for k, v in pairs(MOD_TUNING.SCRAP_REAL_ID) do
      print(k .. " --- " .. v)
  end

modimport("scripts/map/tasks/ModTasks.lua")
modimport("scripts/map/rooms/ModRooms.lua")

local function AddModTask(level)
	table.insert(level.tasks, "TankBiome")
end

AddLevelPreInit("SURVIVAL_DEFAULT", AddModTask)
AddLevelPreInit("SURVIVAL_DEFAULT_PLUS", AddModTask)
AddLevelPreInit("COMPLETE_DARKNESS", AddModTask)