function OnUse(goods_index)
	local nPlace = GetItemPlace(goods_index)
	if nPlace == 1 then
		CastState("state_dispear",1,72,1,122601)
		Msg2Player("The invincible state lasts 4 seconds.")
		SetItemUseLapse(goods_index,5400)	--¿‰»¥ ±º‰£∫5∑÷÷”
		return 1
	end
	return 0
end

function OnEquip()
	return 0
end

function CanEquip()
	return 0
end

function OnUnEquip()
	return 0
end
