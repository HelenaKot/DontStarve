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
