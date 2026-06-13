Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

MAX_FRUITUSE_PER_DAY = 10
MAX_FRUITEXP_PER_DAY = 80000000
EXP_PER_FRUIT = 200000

tbFruitUseList =
{
	[1] = {"Longan", 30164, 1, TSK_USEFRUIT_FLAG_1},
	[2] = {"Rambutan", 30165, 100, TSK_USEFRUIT_FLAG_1},
	[3] = {"Cam", 30166, 10000, TSK_USEFRUIT_FLAG_1},
	[4] = {"Coconut", 30167, 1000000, TSK_USEFRUIT_FLAG_1},
	[5] = {"Mangosteen", 30168, 100000000, TSK_USEFRUIT_FLAG_1},
	[6] = {"Pomelo", 30169, 1, TSK_USEFRUIT_FLAG_2},
	[7] = {"Strawberry", 30170, 100, TSK_USEFRUIT_FLAG_2},
	[8] = {"Banana", 30171, 10000, TSK_USEFRUIT_FLAG_2},
	[9] = {"Mango", 30172, 1000000, TSK_USEFRUIT_FLAG_2},
	[10] = {"Peach", 30173, 100000000, TSK_USEFRUIT_FLAG_2},
	[11] = {"Plum", 30174, 1, TSK_USEFRUIT_FLAG_3},
	[12] = {"Lychee", 30175, 100, TSK_USEFRUIT_FLAG_3},
	[13] = {"Apple", 30176, 10000, TSK_USEFRUIT_FLAG_3},
	[14] = {"Avocado", 30177, 1000000, TSK_USEFRUIT_FLAG_3},
	[15] = {"Papaya", 30178, 100000000, TSK_USEFRUIT_FLAG_3},
	[16] = {"Soursop", 30179, 1, TSK_USEFRUIT_FLAG_4},
	[17] = {"Pineapple", 30180, 100, TSK_USEFRUIT_FLAG_4},
	[18] = {"Li", 30181, 10000, TSK_USEFRUIT_FLAG_4},
	[19] = {"Langsat", 30182, 1000000, TSK_USEFRUIT_FLAG_4},
	[20] = {"Star Fruit", 30183, 100000000, TSK_USEFRUIT_FLAG_4},
}

function OnUse(nItemIdx)
	if GetLevel() < 73 then
		Talk(1, "", "§¼ng cÊp 73 trë lªn míi cã thÓ sö dông tr¸i c©y!")
		return
	end
	local _nG, _nD, nP = GetItemInfoByIndex(nItemIdx)
	local nNum = GetFruitNum(nP)
	if nNum == 0 then
		Msg2Player("Ph¸t sinh lçi, kh«ng thÓ sö dông!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	if GetTask(TSK_USEFRUIT_DATE) ~= nDate then
		SetTask(TSK_USEFRUIT_DATE, nDate)
		SetTask(TSK_USEFRUIT_EXP, 0)
		SetTask(TSK_USEFRUIT_FLAG_1, 0)
		SetTask(TSK_USEFRUIT_FLAG_2, 0)
		SetTask(TSK_USEFRUIT_FLAG_3, 0)
		SetTask(TSK_USEFRUIT_FLAG_4, 0)
	end
	
	local nUsedExp = GetTask(TSK_USEFRUIT_EXP)
	if nUsedExp >= MAX_FRUITEXP_PER_DAY then
		Talk(1, "", "§¹i hiÖp ®· nhËn tèi ®a sè ®iÓm kinh nghiÖm sö dông tr¸i c©y trong ngµy h«m nay, kh«ng thÓ sö dông thªm!")
		return
	end
	
	local nUsed = mod(floor(GetTask(tbFruitUseList[nNum][4]) / tbFruitUseList[nNum][3]), 100)
	if nUsed >= MAX_FRUITUSE_PER_DAY then
		Talk(1, "", "§¹i hiÖp ®· sö dông tèi ®a sè "..tbFruitUseList[nNum][1].." trong ngµy h«m nay, kh«ng thÓ sö dông thªm!")
		return
	end

	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TSK_USEFRUIT_EXP, GetTask(TSK_USEFRUIT_EXP) + EXP_PER_FRUIT)
		SetTask(tbFruitUseList[nNum][4], GetTask(tbFruitUseList[nNum][4]) + tbFruitUseList[nNum][3])
		ModifyExp(EXP_PER_FRUIT)
		Msg2Player("B¹n nhËn ®­îc "..EXP_PER_FRUIT.." ®iÓm kinh nghiÖm!")
		--=============== Chuçi nhiÖm vô Phôc Sinh 2 =============
		if nUsed == (MAX_FRUITUSE_PER_DAY - 1) then
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 19 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
		end
		--====================================================
	end
end

function GetFruitNum(nP)
	for i = 1, getn(tbFruitUseList) do
		if nP == tbFruitUseList[i][2] then
			return i
		end
	end
	return 0
end
