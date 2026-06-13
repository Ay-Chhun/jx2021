--Œ‰¡÷»À ø
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\lib\\define.lua")
tInfo ={
{"Disciple of Wudang",	"Danh v‰ng V‚ ßang ßπo Gia ThÒ T‰a",},
{"Disciple of Shaolin",		"Giam C«m ßﬁa1",},
{"ß÷ tˆ Minh Gi∏o",		"Danh v‰ng Minh Gi∏o Th∏nh Chi’n ThÒ T‰a",},
}
sDeathScript = "\\script\\pop\\2012\\liaoguo_cike_npc.lua";

function main()
	if tGtTask:check_cur_task(940) ~= 1 then
			return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H∑y nghÿ ng¨i rÂi mÌi quay lπi t◊m ta! (ThÍi gian gi∑n c∏ch: 2 phÛt)");
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId,nX,nY,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*3);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	if GetFollower() ~= 0 then
--		KillFollower();
	end
	SummonNpc("Fainted Maiden","Fainted Maiden");
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

--Œﬁœ‡◊⁄—Ãª
function OnUse(nItemIdx)
	if tGtTask:check_cur_task(1011) ~= 1 then
			return 0;
	end
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nMapZXC = 5079; --‘·—©≥«
	if nMapId1 ~=  nMapZXC then
		Talk(1,"","V´ T≠¨ng T´ng Y™n H·a: H∑y Æ’n T∏ng Tuy’t Thµnh Æ” sˆ dÙng.")
		return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H∑y sˆ dÙng sau (Gi∑n c∏ch sˆ dÙng: 2 phÛt).")
		return 0;
	end
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= 2 or d ~= 96 or p ~= 136 then
		return 0;
	end 
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId1,nX1,nY1,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*5);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

	