--File name:	yuanliaobao.lua
--Describe:		原料包道具脚本
--Item ID:		2,1,30016
--Create Date:	2008-08-18
--Author:		chenbenqian

Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

g_VietMoonCake08End = 2008100600				--原料包的使用截止日期

g_YuanLiaoList = 
{
	--		"名称",		G1,G2,G3,数量,概率
	[1] = {"Flour",		2,1,30017,1,40},
	[2] = {"Sugar",	2,1,30018,1,20},
	[3] = {"Salted egg",		2,1,30019,1,20},
	[4] = {"Mixed ingredients",	2,1,30020,1,20},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_VietMoonCake08End then
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_yuanliao()
	end
end

function give_yuanliao()
	local nRandom = random(1,100)
	local nTableSize = getn(g_YuanLiaoList)
	local nBase = 0
	for i=1, nTableSize do
		nBase = nBase + g_YuanLiaoList[i][6]
		if nRandom <= nBase then
			add_item_ex(g_YuanLiaoList[i])
			return
		end
	end
end

function add_item_ex(tItem)
	local szLogTitle = "Ho箃 ng trung thu : ".."Bao nguy猲 li謚";		--此处分为2段只是为了不增加新的翻译
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..tItem[5].." c竔 "..tItem[1]);
		WriteLogEx(szLogTrungThuName,"nh薾",tItem[5],tItem[1])						
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." "..tItem[1].." Failed, return value = "..nRetCode);
	end
end
