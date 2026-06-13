Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\gem\\imp_item_gem_box.lua")

ING_SZ_NPC_NAME = "Dia Sab Kdor"
function gem_OnServerStart()
	local npcIndex1 = CreateNpc("Gem_Npc", ING_SZ_NPC_NAME, 350,1381,3017)
    SetNpcScript(npcIndex1, "\\script\\gem\\npc_gem.lua")
end

function gemNpcTalkMain()
	if IsGemSystemOpen(2) ~= 1 then
		return
	end
	
	local szTitle = format("%s", "I can handle all operations related to precious items")
	local tbSay = {}

	tinsert(tbSay, format("%s/_open_gem_box_from_npc", "Open Precious Item Handbook"))
	tinsert(tbSay, format("%s/_getGemBox", "Receive Precious Item Handbook"))
	tinsert(tbSay, format("%s/_gemOp_OpenHole", "Punch Hole in Equipment"))
	tinsert(tbSay, format("%s/_gemOp_InsertGem", "Inlay Gem"))
	--tinsert(tbSay, format("%s/_gemOp_RemoveGem", "宝石拆解"))
	--tinsert(tbSay, format("%s/_open_gem_shop", "宝石商店"))
	tinsert(tbSay, format("%s/_open_gem_lucky_box", "Precious Item Lucky Chest"))
	tinsert(tbSay, format("%s/nothing", "Exit"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _open_gem_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3046, "Precious Item Shop"));
end

function _open_gem_lucky_box()
	SendScript2Client("Open[[luckybox]]");	
end

function _open_gem_box_from_npc()
	OnOpen_GemBox_FromNpc()
end

function _getGemBox()
	local nG,nD,nP = 2, 1, 30699
	if BigGetItemCount(nG,nD,nP) ~= 0 then
		Talk(1, "", format("You already have [%s]", g_szItemNameGemBox));
		return
	end
	local nRetCode, nItem = AddItem(nG,nD,nP, 1);
	if nRetCode == 1 then
		Msg2Player(format("You received 1 %s", g_szItemNameGemBox));
	end
end

function _gemOp_OpenHole()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 5));
end

function _gemOp_InsertGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 8));
end

function _gemOp_RemoveGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 11));
end

function nothing()
end