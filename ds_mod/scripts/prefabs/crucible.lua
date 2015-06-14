require "prefabutil" --dunno?
local cooking = require("cooking")

local assets =
{
	Asset("ANIM", "anim/crucible.zip"),
}
--[[
local prefabs = {}

for k,v in pairs(cooking.recipes.cookpot) do
	table.insert(prefabs, v.name)
end
]]--
local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	
	if inst.components.stewer.cooking then
		inst.AnimState:PushAnimation("loop")
	elseif inst.components.stewer.done then
		inst.AnimState:PushAnimation("idle_done")
	else
		inst.AnimState:PushAnimation("idle")
	end

end

local function onhammered(inst, worker) --todo drop loot
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end
------------------------ STEWER COMPONENT THINGIES -------------------------------------

local slotpos = {	Vector3(0,64+32+8+4,0), 
					Vector3(0,32+4,0),
					Vector3(0,-(32+4),0), 
					Vector3(0,-(64+32+8+4),0)}

local widgetbuttoninfo = {
	text = "derp",
	position = Vector3(0, -165, 0),
	fn = function(inst)
		inst.components.stewer:StartCooking()	
	end,
	
	validfn = function(inst)
		return inst.components.stewer:CanCook()
	end,
}

local function startcookfn(inst)
	inst.AnimState:PlayAnimation("loop", true)
	--inst.SoundEmitter:KillSound("snd")
	--inst.SoundEmitter:PlaySound("../../dontstarve/common/cookingpot_rattle", "snd")
	--inst.Light:Enable(true)
end

local function itemtest(inst, item, slot)
	if cooking.IsCookingIngredient(item.prefab) then
		return true
	end
end

local function donefn(inst)
	inst.AnimState:PlayAnimation("done")
	inst.AnimState:PushAnimation("idle_done")
	--inst.SoundEmitter:PlaySound("../../dontstarve/common/cookingpot_finish", "snd")
	--play a one-off sound
end

local function continuedonefn(inst)
	inst.AnimState:PlayAnimation("idle_done")
end

local function continuecookfn(inst)
	inst.AnimState:PlayAnimation("loop", true)
	--inst.SoundEmitter:PlaySound("../../dontstarve/common/cookingpot_rattle", "snd")
end

local function harvestfn(inst)
	inst.AnimState:PlayAnimation("idle")
end

local function getstatus(inst)
	if inst.components.stewer.cooking and inst.components.stewer:GetTimeToCook() > 15 then
		return "COOKING_LONG"
	elseif inst.components.stewer.cooking then
		return "COOKING_SHORT"
	elseif inst.components.stewer.done then
		return "DONE"
	else
		return "EMPTY"
	end
end

local function onfar(inst)
	inst.components.container:Close()
end

-----------------------------------------------------------------------------------------

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	
	local s = 1.2
	inst.Transform:SetScale(s,s,s)
    
    inst.AnimState:SetBank("crucible")
    inst.AnimState:SetBuild("crucible")
    inst.AnimState:PlayAnimation("idle")
	
	MakeObstaclePhysics(inst, .8)
   
    inst:AddComponent("inspectable")
	inst:AddTag("structure")
	
	inst:AddComponent("stewer")
    inst.components.stewer.onstartcooking = startcookfn
    inst.components.stewer.oncontinuecooking = continuecookfn
    inst.components.stewer.oncontinuedone = continuedonefn
    inst.components.stewer.ondonecooking = donefn
    inst.components.stewer.onharvest = harvestfn
	
	inst:AddComponent("container")
    inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(4)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_cookpot_1x4"
    inst.components.container.widgetanimbuild = "ui_cookpot_1x4"
    inst.components.container.widgetpos = Vector3(200,0,0)
    inst.components.container.side_align_tip = 100
    inst.components.container.widgetbuttoninfo = widgetbuttoninfo
    inst.components.container.acceptsstacks = false
    inst.components.container.type = "cooker"
	
	--inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerFar(onfar)
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	--inst.entity:AddMiniMapEntity()	
	--inst.MiniMapEntity:SetIcon( "TODO.tex" )		    
	MakeSnowCovered(inst, .01)    
	inst:ListenForEvent( "onbuilt", onbuilt)
    return inst
end


return Prefab( "common/crucible", fn, assets),
	MakePlacer( "common/crucible_placer", "crucible", "crucible", "idle" ) 