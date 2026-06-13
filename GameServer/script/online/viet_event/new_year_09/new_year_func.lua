--File name:	new_year_func.lua
--Describe:		春节活动函数文件
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")
Include("\\script\\lib\\writelog.lua")

--添加新年红包
function add_bag_new_year_09_viet(nItemNum, szLog)
	local szLogTitle = "Hoat dong Tet 2009"
	local szItemName = "Lucky Spring Pouch"
	local G, D, P = 2, 1, 30046
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle, szLog, "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

