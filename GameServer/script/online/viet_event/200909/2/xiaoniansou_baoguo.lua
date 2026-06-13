-- TSK_NIENTHU20101201_TIME = 2175
-- TSK_NIENTHU20101201_INFO = 2176

Include ("\\script\\lib\\globalfunctions.lua");
Include ("\\script\\online\\viet_event\\vng_task_control.lua ") 

function main()

	-- c p 80 trÎ l™n mÌi c„ th” nhÀn Æ≠Óc ph«n th≠Îng
	if GetLevel() < 80 then
		Talk(1, "", "ßºng c p 80 trÎ l™n mÌi c„ th” nhÀn th≠Îng!")
		return 0
	end
	
	-- gia nhÀp m´n ph∏i mÌi nhÀn ph«n thuÍng
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Chÿ c„ ng≠Íi Æ∑ gia nhÀp m´n ph∏i mÌi c„ th” nhÀn th≠Îng!")
		return 0
	end
	
	-- thoi gian gian cach hai l«n nhÀn thuÎng lµ 30 phÛt
	if GetTime() - GetTask(TSK_NIENTHU20101201_TIME) < 30 * 60 then
		Talk(1,"","Bπn cﬂn "..GetTask(TSK_NIENTHU20101201_TIME) + (30*60) - GetTime().." gi©y mÌi c„ th” ti’p tÙc nhÀn th≠Îng tı ti”u ni™n thÛ.")
		return 0
	end
	
	-- set thÍi gian gi∑n c∏ch nhÀn th≠Îng
	SetTask(TSK_NIENTHU20101201_TIME,GetTime())
	
	-- local nDate = tonumber(date("%d"));
	-- local nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	--if GetByte(nTaskVal,1) ~= nDate then
--		nTaskVal  = SetByte(nTaskVal,1,nDate)
		--nTaskVal  = SetByte(nTaskVal,2,0)
		--nTaskVal  = SetByte(nTaskVal,3,0)
		--SetTask(TSK_NIENTHU20101201_INFO, nTaskVal)
	--end	
	--nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	
	local nDate = tonumber( date( "%y%m%d" ) ) --101116
	
	-- hai sË cuËi cÒa task lµ sË l«n sˆ dÙng trong ngµy
	local nCurDate = floor ( GetTask( TSK_NIENTHU20101201_INFO ) / 100 ) -- l y 6 sË Æ«u ti™n
	
	-- Th˘c hi÷n reset sË l«n sˆ dÙng trong ngµy vµ thÍi gian gi∑n c∏ch sˆ dÙng . n’u kh´ng ph∂i lµ ngµy hi÷n tπi
	if nCurDate ~= nDate then
		SetTask ( TSK_NIENTHU20101201_INFO, nDate * 100 )
	end	
		
	-- VuÓt qu∏ sË l«n sˆ dÙng --> tho∏t 	
	local nCount = mod ( GetTask(TSK_NIENTHU20101201_INFO), 100 ) 
	if nCount >= 12 then
		Talk(1,"","MÁi ngµy chÿ c„ th” nhÀn th≠Îng tı 12 con Ti”u ni™n thÛ.")
		return 0
	end
	
	--if GetByte(nTaskVal,3) >= 12 then
	--	Talk(1,"","MÁi ngµy chÿ c„ th” nhÀn th≠Îng tı 12 con Ti”u ni™n thÛ.")
	--	return 0
	--end
			
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetNpcScript(nSelfIndex, "")

	-- SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,3,1))	
	SetTask(TSK_NIENTHU20101201_INFO, GetTask(TSK_NIENTHU20101201_INFO) + 1)
	
	ModifyExp(1000000)
	WriteLogEx("Hoat dong Thang 12","Little Year Beast",1000000,"Æi”m kinh nghi÷m")
	Msg2Player("Bπn nhÀn Æ≠Óc 1000000 Æi”m kinh nghi÷m!")
	
	-- doi 30*60 gi©y mÌi c„ th” ®n Æ≠Óc n˜a	
	StartTimeGuage("Little Year Beast", 30*60 ,0,1)	
end
-- ================================================
