--File name:	lanhua_bag.lua
--Describe:		袋子脚本(兰花BOSS、英子BOSS掉落)
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua")

TYPE_NULL 	= 0;	--没有奖励
TYPE_ITEM 	= 1;	--普通物品
TYPE_EQUIP 	= 2;	--带属性装备类物品
TYPE_CMD 	= 3;	--命令

--=========================================================================================
g_szLogTitle = "Inventory Bag".."(2, 1, 30072)"
g_nNeedRoom = 1
g_nNeedWeight = 20
g_nDenominator = 100							--分母，表示概率的单位是x分之1

g_szFileName = "lanhua_bag.lua"					--文件名

g_tbItem = 
{
	--		类型	   概率	数量 名字	ID1,ID2,ID3
	[1] = {TYPE_EQUIP,	50,	1,	"Йng Phng Long Ch﹗",	0,	102,	24,	},
	[2] = {TYPE_EQUIP,	25,	1,	"As You Wish",		0,	102,	23,	},
	[3] = {TYPE_EQUIP,	25,	1,	"Auspicious",		0,	102,	22,	},
}



--=========================================================================================
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use_it()
	end
end

function use_it()
	--物品奖励部分
	local nRandIdx = get_random_item(g_tbItem)
	if nRandIdx == 0 then
		return
	end

	local szItemName = g_tbItem[nRandIdx][4]
	local nItemNum = g_tbItem[nRandIdx][3]
	local szInfoDescribe = format("(%d,%d,%d)", g_tbItem[nRandIdx][5], g_tbItem[nRandIdx][6], g_tbItem[nRandIdx][7])

	local nRetCode = 0
	nRetCode = AddItem(g_tbItem[nRandIdx][5],g_tbItem[nRandIdx][6],g_tbItem[nRandIdx][7],g_tbItem[nRandIdx][3],1,-1,-1,-1,-1,-1,-1)

	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		WriteLogEx("Hoat dong thang 6", "Received", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	else
		WriteLogEx("Hoat dong thang 6", "Received", nItemNum, szItemName, szInfoDescribe, GetTongName(), "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

--按照概率获得g_tbItem里面的一项内容
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

--检查输入的table是否正确
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

function nothing()

end


