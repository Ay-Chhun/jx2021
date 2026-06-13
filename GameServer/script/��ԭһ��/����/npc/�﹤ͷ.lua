
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 少林门派任务伙工头脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==2) then
		task_005();
		return
	else
		Say("What's the matter?",0);
	end

end