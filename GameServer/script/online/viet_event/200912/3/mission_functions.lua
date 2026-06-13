--=============================================
--create by baiyun 2009.11.25
--describe:越南版12月份圣诞节活动冰冷巫师mission函数
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission has started, MSUID:"..nMSUID);
end;
--Mission开始
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nShengDanShuIndex = GetGlbValue(1026);
	SetCurrentNpcSFX(nShengDanShuIndex, 909, 2, 1, 18*30*60)
end;
--Mission结束
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission has ended, MSUID:"..nMSUID);
end;
--离开Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nShengDanShuIndex = GetGlbValue(1026);
		local nMapId, nMapX, nMapY = GetNpcWorldPos(nShengDanShuIndex);
		for i = 1, 50 do
      local nNewNpcIndex = CreateNpc("Event gi竛g sinh VN", "Midsummer Gift Box", nMapId, nMapX + random(-10, 10), nMapY + random(-10, 10));
      SetNpcLifeTime(nNewNpcIndex, 30);
      SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
		end
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--登陆触发器函数
function OnLogin()

end;
--=====================================================================================
--转换Mission当前状态
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--设置开始状态的持续时间
		StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()

end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()

end;
