Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local tAward = {
		{1, 2900, "Spring Sprout", {2, 1, 30773, 20}, 0},
		{1, 2500, "Spring Sprout", {2, 1, 30773, 50}, 0},
		{1, 2280, "Spring Sprout", {2, 1, 30773, 100}, 0},
		{1, 2250, "Ti“n LŒ", {2, 1, 30778, 1}, 0},
		{1, 50, "Five-Fruit Tray", {2, 1, 30278, 1}, 0},
		{1, 20, "Lucky Money Bag", {2, 1, 30786, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "N®m mÌi mıng xu©n", "TÛi LÈc ß«u N®m")
end