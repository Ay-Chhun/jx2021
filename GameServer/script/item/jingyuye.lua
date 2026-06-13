Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("Skill Book Shop Level 1-2/#show_equip_shop(%d)", 3047),
		format("Skill Book Shop Level 3-4/#show_equip_shop(%d)", 3048),
		"Cancel/nothing",	
	}
	Say("H∑y ch‰n ti÷m c«n ÆÊi: ", getn(tSay), tSay);
end

function nothing()
	
end