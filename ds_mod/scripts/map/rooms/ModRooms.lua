
local Layouts = GLOBAL.require("map/layouts").Layouts
local StaticLayout = GLOBAL.require("map/static_layout")

local GROUND = GLOBAL.GROUND
local additionalProps = 
{
	ground_types = 
	{						GROUND.IMPASSABLE, GROUND.ROAD, GROUND.ROCKY, GROUND.DIRT, 
							GROUND.SAVANNA, GROUND.GRASS, GROUND.FOREST, GROUND.MARSH, 
							GROUND.WOODFLOOR, GROUND.CARPET, GROUND.CHECKER,
							GROUND.CAVE, GROUND.FUNGUS, GROUND.SINKHOLE, 
							GROUND.WALL_ROCKY, GROUND.WALL_DIRT, GROUND.WALL_MARSH, 
							GROUND.WALL_CAVE, GROUND.WALL_FUNGUS, GROUND.WALL_SINKHOLE, 
							GROUND.UNDERROCK, GROUND.MUD, GROUND.WALL_MUD, GROUND.WALL_WOOD,
							GROUND.BRICK, GROUND.BRICK_GLOW, GROUND.TILES, GROUND.TILES_GLOW, 
							GROUND.TRIM, GROUND.TRIM_GLOW, GROUND.WALL_HUNESTONE, GROUND.WALL_HUNESTONE_GLOW,
							GROUND.WALL_STONEEYE, GROUND.WALL_STONEEYE_GLOW, GROUND.FUNGUSRED, GROUND.FUNGUSGREEN,
							GROUND.RED_DESERT, GROUND.SCRAPYARD
	}
}

Layouts["ScrapField1"] = StaticLayout.Get("map/static_layouts/ScrapField1", additionalProps)

AddRoom("ScrapPiles", {
	value = GROUND.RED_DESERT,
	contents =  {
		countstaticlayouts = 
		{
			["ScrapField1"] = 5,								
		},
		distributepercent = 0.05,
		distributeprefabs = 
		{
			sapling = 0.1,
			grass = 0.1
		 },
	}
})

AddRoom("ScrapYard", {
	--colour={r=0.2,g=0.0,b=0.2,a=0.3},
	value = GROUND.SCRAPYARD,
	--tags = {"ForceConnected",   "MazeEntrance"},--"Maze",
	contents =  {
		distributepercent = 1,
		distributeprefabs= 
		{
			scrapheap1 = 4,
			scrapheap2 = 4,
			scrapheap3 = 4,
			scrapheap4 = 2,
			scrapheap5 = 1,
			marsh_tree = 0.4,
			sapling = 0.4,
			grass = 0.3
		 },
	}
})

AddRoom("BGRedDesert", {
	--colour={r=0.2,g=0.0,b=0.2,a=0.3},
	value = GROUND.RED_DESERT,
	--tags = {"ForceConnected",   "MazeEntrance"},--"Maze",
	contents =  {
		distributepercent = 0.05,
		distributeprefabs = 
		{
			sapling = 0.1,
			grass = 0.1
		 },
	}
})


