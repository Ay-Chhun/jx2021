Include("\\script\\lib\\globalfunctions.lua")

VET_TB_FENGSHOUDAI_AWARD =
{
	{1, "Seed bag", {2, 1, 30087, 2}, 30 * 24 * 3600,1},
	{1, "Small Prajna Tree", {2, 0, 504, 8}, 30 * 24 * 3600,1},
 	{1, "Prajna Tree", {2, 0, 398, 4}, 30 * 24 * 3600,1},
}
function OnUse(itemIndex)
	if (gf_JudgeRoomWeight(14,14,1) ~= 1) then
		return
	end
	if (DelItemByIndex(itemIndex, 1) == 1) then
		gf_EventGiveAllAward(VET_TB_FENGSHOUDAI_AWARD, 100, 1, "Farm Produce Bag", format("Sö dông %s","Farm Produce Bag"))
	end
end