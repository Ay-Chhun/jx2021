--File name:	red_box.lua
--Describe:		红宝箱脚本
--Item ID:		2,1,30059
--Create Date:	2008-12-24
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

--=========================================================================================
g_szLogTitle = "N╩ m韎 m鮪g xu﹏ : ".."H錸g B秓 Rng"			--此处分为2段只是为了不增加新的翻译
g_nNeedRoom = 1
g_nNeedWeight = 20

--=========================================================================================
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_item_ex( {"Collecting Glove",	2,	1,	30058,	10} )
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx(g_szLogTitle, "Received", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Received", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

