Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 190, "Copper Medal", {0, 153, 1, 1}, 0},
		{1, 190, "∏o Choµng Tπo BË", {0, 152, 1, 1}, 0},
		{1, 190, "Coarse Cloth Shoes", {0, 154, 1, 1}, 0},
		{1, 100, "Iron Medal", {0, 153, 2, 1}, 0},	
		{1, 100, "∏o Choµng C»m ßoπn", {0, 152, 2, 1}, 0},
		{1, 100, "Refined Cloth Shoes", {0, 154, 2, 1}, 0},
		{1, 26, "Huy Ch≠¨ng Ng‰c Ch’", {0, 153, 3, 1}, 0},
		{1, 26, "∏o Choµng H·a V©n", {0, 152, 3, 1}, 0},
		{1, 30, "Gao Tong Wa Recipe", {0, 154, 3, 1}, 0},
		{1, 3, "Huy Ch≠¨ng Kim Ch’ ngÚ hµnh", {0, 153, 4, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch≠¨ng MÈc Ch’ ngÚ hµnh", {0, 153, 5, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch≠¨ng ThÒy Ch’ ngÚ hµnh", {0, 153, 6, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch≠¨ng H·a Ch’ ngÚ hµnh", {0, 153, 7, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch≠¨ng ThÊ Ch’ ngÚ hµnh", {0, 153, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng ¢m Ch’ ngÚ hµnh", {0, 153, 9, 1}, 0, 0, 0, 1},
		{1, 3, "∏o Choµng NgÚ Hµnh Kim Ch’", {0, 152, 4, 1}, 0, 0, 0, 1},
		{1, 3, "∏o Choµng NgÚ Hµnh MÈc Ch’", {0, 152, 5, 1}, 0, 0, 0, 1},
		{1, 3, "∏o Choµng NgÚ Hµnh ThÒy Ch’", {0, 152, 6, 1}, 0, 0, 0, 1},
		{1, 3, "∏o Choµng NgÚ Hµnh H·a Ch’", {0, 152, 7, 1}, 0, 0, 0, 1},
		{1, 3, "∏o Choµng NgÚ Hµnh ThÊ Ch’", {0, 152, 8, 1}, 0, 0, 0, 1},
		{1, 1, "∏o Choµng NgÚ Hµnh ¢m Ch’", {0, 152, 9, 1}, 0, 0, 0, 1},
		{1, 3, "Chi’n Hµi Kim Ch’ ngÚ hµnh", {0, 154, 4, 1}, 0, 0, 0, 1},
		{1, 3, "Chi’n Hµi MÈc Ch’ ngÚ hµnh", {0, 154, 5, 1}, 0, 0, 0, 1},
		{1, 3, "Chi’n Hµi ThÒy Ch’ ngÚ hµnh", {0, 154, 6, 1}, 0, 0, 0, 1},
		{1, 3, "Chi’n Hµi H·a Ch’ ngÚ hµnh", {0, 154, 7, 1}, 0, 0, 0, 1},
		{1, 3, "Chi’n Hµi ThÊ Ch’ ngÚ hµnh", {0, 154, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Chi’n Hµi ¢m Ch’ ngÚ hµnh", {0, 154, 9, 1}, 0, 0, 0, 1},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "TÛi Trang Bﬁ Kim Xµ CuÂng VÚ", "TÛi Trang Bﬁ Kim Xµ CuÂng VÚ");
	end
end