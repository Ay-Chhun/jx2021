Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
g_tbItem = 
{
	[1] = {2,0,1166,"Purple Rose"},
	[2] = {2,0,1165,"Blue Rose"},
}

g_tbSentece = 
{
	[1] = {
			[1] = "If loving you is a mistake, I would rather it be the most beautiful mistake in the world, I would rather be mistaken for a lifetime",
			[2] = "I tell you: first, I love you; second, still I love you; third, again I love you... I love you...",
			[3] = "Seas may run dry and stones may crumble, but my love for you will never change",
		  },
	[2] = {
			[1] = "There is a little secret in my heart, do you want to know? Let the wind quietly tell you: I like you, I really do like you...",
			[2] = "If you are happy, I give you my blessing; if you are lonely, I give you happiness",
			[3] = "Baby, baby, I love you, just as the mouse loves rice; you are the phoenix flying in the sky, and I am the dirt dog on the ground chasing after you",
		  },
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));

	if GetLevel() < 50 then
		Talk(1,"","Sorry, those below level <color=yellow>50<color> cannot plant roses.");
		return 0;
	end;
	if GetSex() ~= 1 then
		Talk(1,"","Sorry, rose seeds can only be planted by the <color=yellow>man<color>.");
		return 0;
	end;
	local nType = get_seed_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","This seed of yours is not a rose seed.");
		return 0;
	end;
	local selTab = {};
	tinsert(selTab,"Yes/#select_sentece("..nItemIdx..","..nType..")");
	tinsert(selTab,"Let me think about it/nothing");
	Say("Plant a purple rose and you will be conferred the title of <color=yellow>Advanced Scholar<color>; plant a blue rose and you will be conferred the title of <color=yellow>Bachelor Scholar<color>. Are you sure you want to endure an unprecedented trial for the sake of your beloved's wish?",getn(selTab),selTab);
end;

function select_sentece(nItemIdx,nType)
	local selTab = {};
	for i=1,getn(g_tbSentece[nType]) do
		tinsert(selTab,g_tbSentece[nType][i].."/#plant("..nItemIdx..","..nType..","..i..")");
	end;
	tinsert(selTab,"Let me think about it/nothing");
	Say("Please choose your confession of love:",getn(selTab),selTab);
end;

function plant(nItemIdx,nType,nIdx)
	local flag,nTime = GetAntiEnthrallmentInfo()
	if nTime >= 10800 and flag ==1 then
		Talk(1,"","Please come plant roses again during healthy gaming hours!")
		return 0;
	end
	if check_team() == 0 then
		return 0;
	end;
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"","You do not have any Dew on you. Dew is sold at the <color=yellow>Pharmacy<color>.");
		return 0
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPoint = GetTask(ABLUEMOON_JIFEN);
		DelItem(2,0,351,1);
		local szFemaleName = get_partner_name();
		local szMaleName = GetName();
		local nNpcIdx = CreateNpc("玫瑰花小苗","For"..szFemaleName.."The planted rose seedling",GetWorldPos())
		SetNpcScript(nNpcIdx,"\\script\\online\\abluemoon\\rose_npc.lua");
		Msg2Global(szMaleName.."For the beloved"..szFemaleName.."Planted the world's rare"..g_tbItem[nType][4]..", and to"..szFemaleName.."said:"..g_tbSentece[nType][nIdx]);
		AddGlobalCountNews("<color=red>"..szMaleName.."<color>For the beloved<color=red>"..szFemaleName.."<color>planted the world's rare"..g_tbItem[nType][4]..", and to<color=red>"..szFemaleName.."<color>said:"..g_tbSentece[nType][nIdx],2);
		local nOldPoint = GetTask(ABLUEMOON_JIFEN);
		if nType == 1 then
			jifen_reduce(nOldPoint - 1000)
			--SetTask(ABLUEMOON_JIFEN,1000);
			Msg2Player("Your current imperial exam score is 1000 points");
		elseif nType == 2 and nPoint > 1500 then
			jifen_reduce(nOldPoint - 1500)
			--SetTask(ABLUEMOON_JIFEN,1500);
			Msg2Player("Your current imperial exam score is 1500 points");
		end;
		local nOldIdx = PlayerIndex;
		local nRand = random(1,10000);
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			SetTask(ABLUEMOON_ROSE_ID,UnsignedHash(szMaleName..szMaleName)..nRand);	--男女名字再加一个随机数作为ID
			SetTask(ABLUEMOON_GROW_TYPE,10+nType);
			SetTask(ABLUEMOON_ROSE_INDEX,nNpcIdx);
			SetTask(ABLUEMOON_PLANT_TIME,GetTime());
			Say("Please note: If the woman has not yet picked this rose and another player plants a different rose for her, then the woman will not be able to pick this rose. Likewise, if the man plants another rose for a different player midway, then this rose also cannot be picked.",0);
		end;
		PlayerIndex = nOldIdx;
		WriteLog("[Rabbit Little Girl Rose]:"..GetName().."For"..szFemaleName.."Planted a rose, nType:"..nType..", old point:"..nOldPoint);
	end;
end;

function get_seed_type(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;	
	end;
	return 0;
end;

function check_team()
	if check_partner_sex() == 0 then
		Talk(1,"","You must <color=yellow>form a team of a man and a woman<color> to plant a rose.");
		return 0;
	end;
	if check_partner_level() == 0 then
		Talk(1,"","Both the man and woman's levels must be <color=yellow>greater than or equal to 50<color> to plant a rose.");
		return 0;
	end;
	return 1;
end;

function get_partner_name()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 2 then
			local szName = GetName();
			PlayerIndex = nOldIdx;
			return szName;
		end;
	end;
	return 0;
end;

function check_partner_sex()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nSex1,nSex2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nSex1 = GetSex();
	PlayerIndex = GetTeamMember(2);
	nSex2 = GetSex();
	PlayerIndex = nOldIdx;
	if nSex1 ~= nSex2 then
		return 1;
	else
		return 0;
	end;
end;

function check_partner_level()
	local nLevel1,nLevel2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nLevel1 = GetLevel();
	PlayerIndex = GetTeamMember(2);
	nLevel2 = GetLevel();
	PlayerIndex = nOldIdx;
	if nLevel1 < 50 or nLevel2 < 50 then
		return 0;
	else
		return 1;
	end;
end;

function nothing()

end;