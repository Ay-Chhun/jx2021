Include("\\script\\online\\item_buchang\\ibc_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	if GetLevel() < 90 and gf_GetPlayerRebornCount() == 0 then
		Say(format("§¼ng cÊp kh«ng ®ñ %d cÊp kh«ng thÓ nhËn th­ëng!", 90), 0)
		return 0;
	end
	if GetTime() - IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.SmallBoxTime) < 60 then
		Say("Ng­¬i ®· nhËn phÇn th­ëng b¶o r­¬ng, h·y quay l¹i sau!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.SmallBoxTime, GetTime());
	
	gf_ModifyExp(1000000);
	local tAward1 = {
		{1, 50, "L«i Viªm Th¹ch", {2, 1, 30683, 1}, 0},
		{31, 50, "nothing()", 1},
	}
	gf_EventGiveRandAward(tAward1, gf_SumRandBase(tAward1), 1, "Compensation hack item", "Small Compensation Chest");
	
	local tAward = {
		{1, 20, "Hero's Medal", {2, 1, 30499, 1, 4}, 0},
		{1, 20, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1, 4}, 0},
		{1, 20, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1, 4}, 0},
		{1, 20, "L«i Viªm Th¹ch", {2, 1, 30683, 1}, 0},
		{1, 15, "Bronze Tieu Y Token", {2, 1, 30493, 1, 4}, 0},
		{1, 5, "Silver Tieu Y Token", {2, 1, 30492, 1, 4}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Compensation hack item", "Small Compensation Chest");
	SetNpcLifeTime(npcIndex, 0);
end