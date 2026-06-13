-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 0, 101, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_tbb_002_003()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 107, 72)
	SetTask(122, 4)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Killed 30 Grey Rabbits, return to meet the hunter.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end