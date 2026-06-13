Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 70, "Copper Medal", {0, 153, 1, 1}, 0},
		{1, 25, "Iron Medal", {0, 153, 2, 1}, 0},
		{1, 5, "Huy Ch≠¨ng Ng‰c Ch’", {0, 153, 3, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Brave Warrior Medal Bag", "Brave Warrior Medal Bag");
	end
end