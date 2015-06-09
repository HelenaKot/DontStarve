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




