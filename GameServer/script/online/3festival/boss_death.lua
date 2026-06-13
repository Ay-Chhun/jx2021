--File name:boss_death.lua 
--Describe:Èý½ÚÁ¬¹ý£¬²ß»®BOSSËÀÍö½Å±¾
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,20);
	SetNpcDeathScript(nNpcIndex,"");
	local sNpcName = GetNpcName(nNpcIndex);
	local sCuteBossName = "";
	local nNpcPosID = GetNpcWorldPos(nNpcIndex);
	local nBossID = 0;
	local nPosIndex = get_pos_index(nNpcPosID);
	for i=1,getn(tBossInfo) do 
		if sNpcName == tBossInfo[i][3] then
			nBossID = i;
			break;
		end;
	end;
	Msg2SubWorld(tBossPos[nPosIndex][1].." villain of the martial world"..sNpcName.."®· bÞ mäi ng­êi hîp søc ®¸nh b¹i!")
	AddGlobalNews(tBossPos[nPosIndex][1].." villain of the martial world"..sNpcName.."®· bÞ mäi ng­êi hîp søc ®¸nh b¹i!");
	if nBossID == 0 then
		WriteLog("[Lçi Tam tiÕt liªn th«ng]: Sau khi Boss chÕt kh«ng t×m thÊy th«ng tin t­¬ng øng cña Boss");
		nBossID = 9;	--ÈÝ´í´¦Àí
	end;
	local nCuteBossIndex = 0;
	for i=1,CUTE_BOSS_COUNT do
		nCuteBossIndex = CreateNpc(tBossInfo[nBossID][2],tBossInfo[nBossID][4],tBossPos[nPosIndex][2],tBossPos[nPosIndex][3],tBossPos[nPosIndex][4],6,1,1,1500);	--µ®Éúµã×îºÃÎªµØÍ¼ÖÐÐÄ
		SetNpcScript(nCuteBossIndex,"\\script\\online\\3festival\\cute_boss_npc.lua");
		SetNpcLifeTime(nCuteBossIndex,60*60);	--60·ÖÖÓÉú´æÊ±¼ä
	end;
	if random(1,100) == 11 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))]);
	end;
end;

tRandString = {
			"Ouch! That hurt so much!",
			"You remember this well",
			"Next time we fight again.",
			"VLTK2 chóc b¹n n¨m míi vui vÎ!",
			"Happy National Day!",
			"Happy Mid-Autumn Festival!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			"Ouch! That hurt so much!",
			}
			
function get_pos_index(nMapID)
	for i=1,getn(tBossPos) do
		if nMapID == tBossPos[i][2] then
			return i
		end;
	end;
	return 0;
end;