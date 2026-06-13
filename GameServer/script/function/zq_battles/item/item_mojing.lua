Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		"Cöa hµng Ma Tinh Giíi ChØ cÊp 3/#show_equip_shop(3027)",
		format("Cöa hµng Ma Tinh Trang BÞ S­ M«n/#mojing_shimen_shop(%d)", nItem),
		"Demon Essence General Goods Shop/#show_equip_shop(3026)",
		"\n Exit/nothing",
	}
	Say("Tham gia chiÕn tr­êng ch©n khÝ, khiªu chiÕn cöa ¶i nhá cã tû lÖ nhÊt ®Þnh nhËn ®­îc Ma Tinh, tÝch lòy l­îng ma tinh cã thÓ ®æi ®­îc ®¹o cô t­¬ng øng.",getn(tSay), tSay);
end

function mojing_shimen_shop(nItem)
	local tSay = {
		"Demon Essence sect set exchange 4/#show_equip_shop(3)",
		"Demon Essence sect set exchange 5/#show_equip_shop(6)",
		format("\n Feedback/#OnUse(%d)", nItem),
		"Ra khi/nothing",
	}
	Say("Tham gia chiÕn tr­êng ch©n khÝ, khiªu chiÕn cöa ¶i nhá cã tû lÖ nhÊt ®Þnh nhËn ®­îc Ma Tinh, tÝch lòy l­îng ma tinh cã thÓ ®æi ®­îc ®¹o cô t­¬ng øng.",getn(tSay), tSay);
end
