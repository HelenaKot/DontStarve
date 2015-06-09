local assets =
{
	Asset("ANIM", "anim/ironingot.zip"),
	Asset("IMAGE", "images/inventoryimages/ironingot.tex"),	
	Asset("ATLAS", "images/inventoryimages/ironingot.xml"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("ironingot")
    inst.AnimState:SetBuild("ironingot")
    inst.AnimState:PlayAnimation("idle")
    
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "ironingot"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ironingot.xml"
	inst.entity:AddMiniMapEntity()	
	inst.MiniMapEntity:SetIcon( "ironingot.tex" )		    
	
    return inst
end

return Prefab( "common/inventory/ironingot", fn, assets)
