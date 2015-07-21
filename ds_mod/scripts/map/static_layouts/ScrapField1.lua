--local variables = require ("ModTuning")

local scrapID = 38--MOD_TUNING.SCRAP_ID
assert( type(scrapID) == "number" )

return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 6,
  height = 6,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  tilesets = {
    {
      name = "ground",
      firstgid = 1,
      filename = "ground.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "tiles.png",
      imagewidth = 512,
      imageheight = 128,
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "BG_TILES",
      x = 0,
      y = 0,
      width = 6,
      height = 6,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, scrapID, 0, 0,
        0, 0, scrapID, 0, scrapID, scrapID,
        0, scrapID, scrapID, scrapID, scrapID, scrapID,
        0, scrapID, scrapID, scrapID, scrapID, 0,
        scrapID, 0, scrapID, scrapID, 0, scrapID,
        0, scrapID, 0, scrapID, scrapID, 0
      }
    },
    {
      type = "objectgroup",
      name = "FG_OBJECTS",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "scrapheap4",
          type = "scrapheap4",
          shape = "rectangle",
          x = 153,
          y = 173,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap5",
          type = "scrapheap5",
          shape = "rectangle",
          x = 246,
          y = 151,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap3",
          type = "scrapheap3",
          shape = "rectangle",
          x = 211,
          y = 236,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap1",
          type = "scrapheap1",
          shape = "rectangle",
          x = 275,
          y = 105,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap2",
          type = "scrapheap2",
          shape = "rectangle",
          x = 337,
          y = 143,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap2",
          type = "scrapheap2",
          shape = "rectangle",
          x = 220,
          y = 31,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap3",
          type = "scrapheap3",
          shape = "rectangle",
          x = 105,
          y = 279,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap1",
          type = "scrapheap1",
          shape = "rectangle",
          x = 226,
          y = 319,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap2",
          type = "scrapheap2",
          shape = "rectangle",
          x = 118,
          y = 218,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap3",
          type = "scrapheap3",
          shape = "rectangle",
          x = 308,
          y = 233,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap3",
          type = "scrapheap3",
          shape = "rectangle",
          x = 81,
          y = 149,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap1",
          type = "scrapheap1",
          shape = "rectangle",
          x = 184,
          y = 107,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        },
        {
          name = "scrapheap2",
          type = "scrapheap2",
          shape = "rectangle",
          x = 307,
          y = 303,
          width = 0,
          height = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
