Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	return
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","The event has expired");
		return 0;
	end
	show_equip_shop(3022);
end