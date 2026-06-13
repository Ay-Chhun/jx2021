--File name:	specilize_xmas_box.lua
--Describe:		ÌØ±ðÀñºÐ½Å±¾
--Item ID:		2,1,30037
--Create Date:	2008-11-18
--Author:		chenbenqian


Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")

TYPE_NULL 	= 0;	--Ã»ÓÐ½±Àø
TYPE_ITEM 	= 1;	--ÆÕÍ¨ÎïÆ·
TYPE_EQUIP 	= 2;	--´øÊôÐÔ×°±¸ÀàÎïÆ·
TYPE_CMD 	= 3;	--ÃüÁî

--=========================================================================================
g_szLogTitle = "Giang Sinh 2008"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_nVietUseBoxEnd = 2009011200					--ÀñºÐµÄÊ¹ÓÃ½ØÖ¹ÈÕÆÚ
g_nNeedRoom = 1
g_nNeedWeight = 100
g_nDenominator = 100							--·ÖÄ¸£¬±íÊ¾¸ÅÂÊµÄµ¥Î»ÊÇx·ÖÖ®1

g_szFileName = "specilize_xmas_box.lua"			--ÎÄ¼þÃû

g_tbItem = 
{
	--		ÀàÐÍ	   ¸ÅÂÊ		ÊýÁ¿ Ãû×Ö		ID1,ID2,ID3
	[1]  = {TYPE_EQUIP,	6,		1,	"Ph¸ Yªn ®ao",	0,	3,	6001},
	[2]  = {TYPE_EQUIP,	6,		1,	"Ph¸ Yªn c«n",	0,	5,	6002},
	[3]  = {TYPE_EQUIP,	6,		1,	"Hµm Yªn thñ",	0,	0,	6004},
	[4]  = {TYPE_EQUIP,	6,		1,	"Phï Yªn tr­îng",	0,	8,	6003},
	[5]  = {TYPE_EQUIP,	6,		1,	"Phi Yªn kiÕm",	0,	2,	6006},
	[6]  = {TYPE_EQUIP,	7,		1,	"VËn Yªn cÇm",	0,	10,	6007},
	[7]  = {TYPE_EQUIP,	7,		1,	"V©n Yªn thñ",	0,	0,	6008},
	[8]  = {TYPE_EQUIP,	7,		1,	"L­u Yªn c«n",	0,	5,	6009},
	[9]  = {TYPE_EQUIP,	7,		1,	"HuyÒn Yªn kiÕm",	0,	2,	6010},
	[10] = {TYPE_EQUIP,	7,		1,	"Vò Yªn bót",	0,	9,	6011},
	[11] = {TYPE_EQUIP,	7,		1,	"He Tian Spear",	0,	6,	6012},
	[12] = {TYPE_EQUIP,	7,		1,	"Hµnh Yªn Cung",	0,	4,	6013},
	[13] = {TYPE_EQUIP,	7,		1,	"Träc Yªn nhÉn",	0,	7,	6014},
	[14] = {TYPE_EQUIP,	7,		1,	"Yªu Yªn tr¶o",	0,	11,	6015},
	[15] = {TYPE_EQUIP,	7,		1,	"Tµng Yªn ch©m",	0,	1,	6005},
}



--=========================================================================================
function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_nVietUseBoxEnd then
		return
	end
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--ÎïÆ·½±Àø²¿·Ö
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end
	local nType = g_tbItem[nRandIdx][1]
	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	if nType == TYPE_NULL then
		return
	elseif nType == TYPE_ITEM then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3])
	elseif nType == TYPE_EQUIP then
		nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)
	elseif nType == TYPE_CMD then
		szInfoDescribe = format(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][3])
		dostring(szInfoDescribe)
		nRetCode = 1	--Ä¬ÈÏÃüÁî³É¹¦Ö´ÐÐ
	end;

	if nRetCode == 1 then
		if type(szItemName) == "table" then
			szItemName = szItemName[1]
		else
			Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." "..szItemName)
		end

		for i=1, 3 do
			AddGlobalNews("Congratulations"..GetName().." Opening the Special Gift Box you receive"..szItemName)
		end
		WriteLogEx(g_szLogTitle, "Special Gift Box", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Special Gift Box", "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

--°´ÕÕ¸ÅÂÊ»ñµÃg_tbItemÀïÃæµÄÒ»ÏîÄÚÈÝ
function get_random_item(nTab)
	local nRandom = random(1,g_nDenominator)
	local nBase = 0
	if check_item_tab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][2]+nBase then
				return i
			else
				nBase = nBase + nTab[i][2]
			end
		end
	else
		return 0
	end
end

--¼ì²éÊäÈëµÄtableÊÇ·ñÕýÈ·
function check_item_tab(tTab)
	local nTotalProbability= 0
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][2]
	end
	if nTotalProbability == g_nDenominator then
		return 1
	else
		print("\n error item table in "..g_szFileName.." \n")
		return 0
	end
end

