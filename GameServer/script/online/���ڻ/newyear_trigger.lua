--filename:newyear_trigger.lua
--create date:2006-01-06
--author:yanjun
--describe:春节活动触发器
Include("\\script\\online\\春节活动\\newyear_head.lua")

function material_killed()
	--20级至50级怪物掉落
	--概率衰减=当前概率*（1-(玩家等级-怪物等级)/70）
	local nHour = tonumber(date("%H"))
	local N	--衰减系数
	if nHour >= 0 and nHour <= 9 then --0点到10点不掉材料。
		N = 0
	elseif nHour >=12 and nHour <= 21 then
		N = 1
	else
		N = 0.25
	end 
	local npcIndex = GetTriggeringUnit()
	local npcLevel = GetUnitBaseStates(npcIndex,0)
	local Quotiety 
	if GetLevel() > npcLevel then
		Quotiety = 1 - (GetLevel() - npcLevel)/70
	else
		Quotiety = 1
	end
	if npcLevel >= 20 and npcLevel <= 50 then
	local nTemp = random(1,1000000)
		if nTemp <= 300000*Quotiety*N then
			AddItem(2,1,255,1)	--面粉
		elseif nTemp <= 580000*Quotiety*N then
			AddItem(2,1,256,1)	--十三香
		elseif nTemp <= 750000*Quotiety*N then
			AddItem(2,1,262,1)	--白菜
		elseif nTemp <= 810000*Quotiety*N then
			AddItem(2,1,260,1)	--萝卜
		elseif nTemp <= 850000*Quotiety*N then
			AddItem(2,1,263,1)	--芹菜
		elseif nTemp <= 870000*Quotiety*N then
			AddItem(2,1,264,1)	--韭菜
		elseif nTemp <= 880000*Quotiety*N then
			AddItem(2,1,257,1)	--猪肉
		elseif nTemp <= 885000*Quotiety*N then
			AddItem(2,1,258,1)	--虎肉
		elseif nTemp <= 887500*Quotiety*N then
			AddItem(2,1,259,1)	--虾仁
		end
	end
end

function KillFollower_OnTimer()
	RemoveTrigger(GetRunningTrigger())
	KillFollower()
	SetTask(TASK_PET_BORN,0)
	Msg2Player("Time is up, the pet leaves you.")
end

function LeaveSnowMap()
	SetDeathPunish(1)
	for SkillID=843,851 do
		RemoveSkill(SkillID)	--忘记打雪仗技能
	end
	SetFightState(0)
	SetDeathScript("")
	UseScrollEnable(1)
	SetTempRevPos(0,0,0)
	Msg2Player("Hoan ngh猲h l莕 sau c竎 b筺 v祇 b秐  tuy誸 畂箃 b秓.")
end
