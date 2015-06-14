PrefabFiles = {
"ironore",
"ironingot",
"ironboulder",
"crucible",
}

local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH

Assets = {
	Asset("ATLAS", "images/inventoryimages/ironore.xml"),
    Asset("IMAGE", "images/inventoryimages/ironore.tex"),
	
	Asset("ATLAS", "images/inventoryimages/ironingot.xml"),
    Asset("IMAGE", "images/inventoryimages/ironingot.tex"),
	
	Asset("IMAGE", "minimap/ironboulder.tex"),	
	Asset("ATLAS", "minimap/ironboulder.xml"),
}

AddMinimapAtlas("minimap/ironboulder.xml")

GLOBAL.STRINGS.NAMES.IRONORE = "Iron Ore"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.IRONORE = "todo"

GLOBAL.STRINGS.NAMES.IRONINGOT = "Iron Ingot"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.IRONINGOT = "todo"

GLOBAL.STRINGS.NAMES.IRONBOULDER = "Boulder"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.IRONBOULDER = "todo"

GLOBAL.STRINGS.NAMES.CRUCIBLE = "Crucible"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.CRUCIBLE = "todo"

local blabla = {
	name = "meatballs",
	test = function(cooker, names, tags) return tags.meat and not tags.inedible end,
		priority = -1,
		weight = 1,
		foodtype = "MEAT",
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_SMALL*5,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_TINY,
		cooktime = .75,
}

AddCookerRecipe("crucible", blabla)