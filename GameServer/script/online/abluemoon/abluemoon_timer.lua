Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
tNpcWords = {
	"Truly a hero emerges in youth, skilled in both literary and martial arts, heh heh heh......",
	"The weather is really nice today! It's a good omen.",
	"I'd really love to wander around. Always standing in the same spot hopping back and forth is too tiring.",
	"Want to become the top scholar? Come take the exam quickly!",
	"Did you take the exam today?",
	"Little white rabbit, white and white again, two ears standing up, hopping and bouncing, truly adorable~",
	"Everyone test honestly for me, no cheating allowed!",
	"Radishes taste great and are good for the complexion too, truly a good thing!",
	"If you're unlucky enough to have the dialog box disappear, you can still continue the exam!",
	"Every day I have to recite a huge pile of certificates to hand out, it's exhausting me......",
}

function OnTimer()
	SetMissionV(MV_TIMER_TIME,GetMissionV(MV_TIMER_TIME)+1) --计时器运行时间+1
	if mod(GetMissionV(MV_TIMER_TIME),30) == 0 then
		if random(2) > 1 then
			NpcChat(GetMissionV(10),tNpcWords[random(getn(tNpcWords))])
		end
	end
	if GetMissionV(MV_TIMER_TIME) == (TIMER_TOTAL_TIME - 15*60) then  --NPC消失15分钟前停止答题
		SetMissionV(MV_TIMER_IDEL,1)
		Msg2SubWorld("Rabbit Yaya will change the exam hall in 15 minutes. Registration for the exam has now stopped. Everyone, seize the next opportunity!")
	elseif GetMissionV(MV_TIMER_TIME) >= TIMER_TOTAL_TIME then
		WriteLog("[Exam Statistics] The number of people who took the high-EXP exam this hour is"..GetMissionV(MV_COUNT_PAY).."people, total radishes consumed is"..GetMissionV(MV_COUNT_LUOBO).."carrots!")
		CloseMission(MISSION_ID)
	else
		local idx = 0;
		for i = 1, 200 do
			idx, pidx = GetNextPlayer(MISSION_ID, idx, 1);
				if pidx > 0 then
					PlayerIndex = pidx;
					if GetTask(ABLUEMOON_STATE) == 1 then
						local RestTime = ABLUEMOON_TIME - (GetGameTime() - GetTask(ABLUEMOON_TIMER))
						if RestTime > 10 then
							if mod(RestTime,10) == 0 then
								Msg2Player("["..RestTime.."/60]--countdown")
							end
						elseif RestTime > 0 then
							Msg2Player("["..RestTime.."/60]--countdown")
						else
							Msg2Player("Time to answer is up!")
							SetTask(ABLUEMOON_STATE,3) --答题失败
						end
					end
				end;
			if idx == 0 then
				break;
			end;
		end
	end
end