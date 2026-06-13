Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--ËùÓÐµÄÈÎÎñnpc»òitem¶Ô»°¶¼ÔÚÕâÀïÅäÖÃÁË

t_npc_or_item_talk = {
	--nTaskId,szTaskName,tRegPara,fn,tfnPara
	{433, "Mac Dai's urgent plea", {"Han Thiet Ore", 315}, fn_award_items, {1,100,{{"Han Thiet Tram Nam",{2,1,31099,1,4},1,100}, }}	},
	{436, "§o¹t l¹i Bóa", {200131101}, fn_use_at_pos,{ {"Liang Son Bac",208,1490,3114,16,1}, fn_call_npcs, {{"jz_ymdxt","The hidden thief",-1, 0, 0}} }  },--¶ÆÁË½ðµÄÌú¿é
	{445, "§­îc ph¸p khÝ (Mua ph¸p khÝ)", {"V©n Du §¹o Nh©n", 200}, fn_confirm, {{"Muèn tiªu 100 Vµng mua KÝnh ChiÕu Yªu?","Confirm","Sai"}, fn_vmoney_buy, {{"Vµng",1, 1000000, 100}, {1,100,{ {"Demon-Reflecting Mirror",{2,1,31105,1,4}} },} } } },
	--{446, "»÷°ÜÀ÷¹í", {200131105}, fn_use_at_pos, {{"½­½ò´å", 306,1453,2860,8,1}, fn_call_npcs,  {{"jz_lg", "À÷¹í",-1,0,0},}} },--ÕÙ»½À÷¹í
	{453, "Drink 3 cups", {200131110}, fn_use_at_pos, {{"T­¬ng D­¬ng",350,1519,3007,16,1},fn_award_items, {1,100,{{"Cup of Dragon Wine",{2,1,31125,1,4},3,100}, }}} },
	{460, "LËp tr­êng Minh gi¸o", {"HÇu §«n", 152}, fn_confirm, {{"Chµo tr­ëng l·o, t«i do gi¸o chñ ñy th¸c, muèn hái b¸c vÒ ý kiÕn gia nhËp Liªn Qu©n.", "Chóng t«i ñng hé lùa chän cña gi¸o chñ."}, fn_award_items, {1,100,{{"Th­ Cña Tr­ëng L·o",{2,1,31126,1,4},1,100}, }}} },
}











--never modify below
--talk events
-------------------------------------------
function handle_npc_talk(nIndex, nTalkIndex)
	local szKey = GetNpcName(nIndex)
	local t = tTalkEventMap[szKey]
	if t then
		if getn(t) == 1 then
			nTalkIndex = 1
		end
		if not nTalkIndex then
			local szTitle = format("<color=green>%s:<color>%s", szKey, "mêi chän nhiÖm vô")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Exit"))
			Say(szTitle, getn(tSay), tSay)
		else
			return fn_process_talk_event(t[nTalkIndex])
		end
	end
	return 0
end

function handle_item_talk(nIndex, nTalkIndex)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nKey = PackItemId(g, d, p)
	local t = tTalkEventMap[nKey]
	if t then
		if getn(t) == 1 then
			nTalkIndex = 1
		end
		if not nTalkIndex then
			local szName = GetItemName(g, d, p)
			local szTitle = format("<color=green>%s:<color>%s", szName, "mêi chän nhiÖm vô")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Exit"))
			Say(szTitle, getn(tSay), tSay)
		else
			return fn_process_talk_event(t[nTalkIndex])
		end
	end
	return 0
end

function fn_process_talk_event(tTalkCfg)
	local nTaskId, szTaskName, tPara, fn, fnPara = unpack(tTalkCfg)
	if _fn_task_dispatch(tTalkCfg) ~= 1 then
		Talk(1,"","§¹i hiÖp ch­a nhËn nhiÖm vô nµy.")
	end
	return 0
end

g_called_fn_reg_talk_events = nil
function fn_reg_talk_events()
	if g_called_fn_reg_talk_events then
		error("fn_reg_talk_events repeat call")
		return
	end
	tTalkEventMap = {}
	for i,t in t_npc_or_item_talk do
		local nTaskId, szTaskName, tPara, fn, fnPara = unpack(t)
		tinsert(tPara, szTaskName)
	
		local key = tPara[1]
		local szEventId,szFunc = "event_npc_talk", "handle_npc_talk"
		if type(key) == "number" then
			szEventId,szFunc = "event_item_talk", "handle_item_talk"
		end
		isolate_watch_event(szEventId,szFunc, unpack(tPara))
		
		local tCfg = tTalkEventMap[key] or {}
		tinsert(tCfg, t)
		tTalkEventMap[key] = tCfg
	end
	g_called_fn_reg_talk_events = 1
end