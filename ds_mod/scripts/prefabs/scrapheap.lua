local function createScrapHeap(num) 

	local assets =
	{
		Asset("ANIM", "anim/scrapHeap"..num..".zip"),
	}
	local prefabs = --todo
	{
		"lightbulb"
	}
	
	local function onpickedfn(inst)
		inst:Remove() 
		inst.components.lootdropper:SpawnLootPrefab("lightbulb") -- TODO 
	end
	
	local function fn(Sim)
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		
		if num < 5 then
			MakeObstaclePhysics(inst, 0.7)
		else
			MakeObstaclePhysics(inst, 1.4)
		end
		
		inst.AnimState:SetBank("scrapHeap"..num) 
		inst.AnimState:SetBuild("scrapHeap"..num)
		inst.AnimState:PlayAnimation("idle")

		inst:AddComponent("inspectable")
		inst.components.inspectable.nameoverride = "scrapheap"
		inst:AddComponent("named") -- much workarond, very not wow
		inst.components.named:SetName(STRINGS.NAMES.SCRAPHEAP)
		
		inst:AddComponent("pickable")
		inst.components.pickable:SetUp("",10) 
		inst.components.pickable.onpickedfn = onpickedfn
		
		inst.entity:AddMiniMapEntity()	
		inst.MiniMapEntity:SetIcon("scrapheap.tex")	

		inst:AddComponent("lootdropper")
		
		MakeSnowCovered(inst, .01) 	
		
		return inst
	end
	
	return Prefab( "common/scrapheap"..num, fn, assets, prefabs)
end

return  createScrapHeap(1), 
		createScrapHeap(2),
		createScrapHeap(3), 
		createScrapHeap(4), 
		createScrapHeap(5)