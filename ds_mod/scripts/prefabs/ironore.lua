local assets =
{
	Asset("ANIM", "anim/ironore.zip"),
	Asset("IMAGE", "images/inventoryimages/ironore.tex"),	
	Asset("ATLAS", "images/inventoryimages/ironore.xml"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("ironore")
    inst.AnimState:SetBuild("ironore")
    inst.AnimState:PlayAnimation("idle")
    
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "ironore"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ironore.xml"
	inst.entity:AddMiniMapEntity()	
	inst.MiniMapEntity:SetIcon( "ironore.tex" )		    
	
    return inst
end


return Prefab( "common/inventory/ironore", fn, assets)