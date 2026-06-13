--File name:	xmas_func.lua
--Describe:		圣诞节活动函数文件
--Create Date:	2008-11-17
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua")
Include("\\script\\lib\\writelog.lua")

--添加圣诞礼盒
function add_box_xmas_08_viet(nItemNum, szLog)
	local szLogTitle = "Giang Sinh 2008"
	local szItemName = "Christmas gift box"
	local G, D, P = 2, 1, 30032
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle,szLog, "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

