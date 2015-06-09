local assets =
{
	Asset("ANIM", "anim/ironboulder.zip"),
	--Asset("IMAGE", "minimap/ironboulder.tex"),	
	--Asset("ATLAS", "minimap/ironboulder.xml"),
}

local prefabs =
{
    "rocks",
    "ironore",
    "flint",
    "goldnugget",
} 

SetSharedLootTable( 'rock_iron',
{
    {'rocks',  1.00},
    {'rocks',  1.00},
    {'ironore',  1.00},
    {'ironore',  1.00},
    {'flint',  1.00},
    {'ironore',  0.25},
    {'flint',  0.60},
})

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	
	MakeObstaclePhysics(inst, 1.)
    
    inst.AnimState:SetBank("ironboulder")
    inst.AnimState:SetBuild("ironboulder")
	inst.AnimState:PlayAnimation("full")

    inst:AddComponent("inspectable")
    
	inst.entity:AddMiniMapEntity()	
	inst.MiniMapEntity:SetIcon("ironboulder.tex")	
	inst.MiniMapEntity:SetPriority(1)

	inst:AddComponent("lootdropper") 
	inst.components.lootdropper:SetChanceLootTable('rock_iron')
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.ROCKS_MINE)
	
	inst.components.workable:SetOnWorkCallback(
		function(inst, worker, workleft)
			local pt = Point(inst.Transform:GetWorldPosition())
			if workleft <= 0 then
				inst.SoundEmitter:PlaySound("../../data/sound/wilson/rock_break")
				inst.components.lootdropper:DropLoot(pt)
				inst:Remove()
			else
				if workleft < TUNING.ROCKS_MINE*(1/3) then
					inst.AnimState:PlayAnimation("low")
				elseif workleft < TUNING.ROCKS_MINE*(2/3) then
					inst.AnimState:PlayAnimation("med")
				else
					inst.AnimState:PlayAnimation("full")
				end
			end
		end)    
		
	local color = 0.5 + math.random() * 0.5
    inst.AnimState:SetMultColour(color, color, color, 1)   

	MakeSnowCovered(inst, .01) 	
	
    return inst
end

return Prefab( "forest/objects/rocks/ironboulder", fn, assets, prefabs)
