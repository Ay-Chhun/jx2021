--File name:qingming_head.lua
--Describe:清明节活动脚本头文件
--Create Date:2006-3-15(315消费者的节日)
--Author:yanjun

--全局常量
FALSE = 0;	--相信定义这样的常量会使代码容易理解一点吧
TRUE = 1;
QINGMING_SWITCH = TRUE;	--活动开关。０为关，１为开
--全局变量号

--任务变量号
QINGMING_TASK = 1875;	--此任务变量为四部分来使用
						--1字节记录玩家目前叩拜了多少次
						--2字节记录当天有没有拜过
						--3字节记录玩家是不是连着１０天都去拜祭了
						--4字节
JIBAI_ITEM = 1876;	--此任务变量为四部分来使用
					--1字节记录玩家当天有没有使用过祭品馒头
					--2字节记录玩家当天有没有使用过祭品鸡肉
					--3字节记录玩家当天有没有使用过祭品老酒
					--4字节记录玩家使用祭拜物品后提高的概率

EnterPointTab = {	--记录三个地图的进入坐标。
			[1] = {818,1636,3181},	--泉州
			[2] = {820,1636,3181},	--汴京
			[3] = {819,1636,3181},	--成都
			};
LeavePointTab = {	--记录从陵墓出来时的坐标
			[1] = {100,1453,2812},	--泉州　黄侠冢
			[2] = {200,1170,2834},	--汴京　韩侠冢
			[3] = {300,1640,3531},	--成都　轩辕侠冢
			};
		
--=============================================================================================
--==================================相关函数===================================================
--判断节日是否开放
function Is_QingMing_Opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if QINGMING_SWITCH == TRUE and nDate >= 20060331 and nDate <=20060409 then
		return TRUE;
	else
		return FALSE;
	end;
end;

--自定义写日志函数。第一个参数为事件名，第二个参数为事件内容
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--得到玩家的性别字符串。从\script\task\world\task_head.lua里面copy过来的。
--Copyright◎2005peres
function GetPlayerSex()	
	local mySex -- 用以显示人物性别的字符
	if (GetSex() == 1) then
		mySex = "Thi誹 hi謕";
	elseif (GetSex() == 2) then
		mySex = "Young lady";
	end;
	return mySex;
end;

--设置某任务变量的某一字节的值
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--得到某任务变量某一字节的值
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;