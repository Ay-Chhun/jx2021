Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\Central Plains Zone 2\\Chengdu\\npc\\Chef.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"

function main()
	Say("<color=green>Rabbit Xiao Ya<color>: Welcome to the first season of the first Swordsman Online 2 imperial exam. Do you have the courage to take on the challenge, hero?",7,
			"Come on, I challenge you! /abluemoon_go",
			"I want to see my current exam results /abluemoon_jifen",
			"Let me first check how my exam luck is today /abluemoon_luck",
			"I want to claim the reward from my last exam /CheckHappyTimes",
			"I want to see the current exam rankings /abluemoon_paihang",
			--"我要领取科考外装/abluemoon_cloth",
			"Explain the rules to me /abluemoon_rule",
			"Forget it, I'm not in good shape today /end_say"
			)
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say("<color=green>Rabbit Xiao Ya<color>: Players below level 50 cannot take part in the imperial exam for now. Go back and train a bit more first.",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say("<color=green>Rabbit Xiao Ya<color>: It seems you still haven't claimed the reward from your last exam. Claim the reward first, then come back to take the exam!",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --如果今天参加的是高经验考试
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --如果是答题数小于猜拳数
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --如果是第一关答题框就消失了
		Say("<color=green>Rabbit Xiao Ya<color>: It seems your last academy exam hasn't ended yet. Do you want to continue taking the academy exam?",2,
				"\nI want to continue taking the exam /#abluemoon_cuntinue(1)",
				"\nLet me think about it again /end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --如果是第二关答题数小于第一关正确题数
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --如果是第二关答题框就消失了
		Say("<color=green>Rabbit Xiao Ya<color>: It seems your last provincial exam hasn't ended yet. Do you want to continue taking the provincial exam?",2,
				"\nI want to continue taking the exam /#abluemoon_cuntinue(2)",
				"\nLet me think about it again /end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say("<color=green>Rabbit Xiao Ya<color>: There are still <color=yellow>"..rest.."<color> minutes until I change the exam venue. Registration is now closed!",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "Unknown, more fierce than the fierce one"  --如果没算 默认大凶
		local nDay = tonumber(date("%y%m%d"))
		if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --如果算过了 显示当前运势
			szluck = tluck[nluck]  
		end
		Say("<color=green>Rabbit Xiao Ya<color>: Guessing this thing is closely tied to your <color=yellow>luck<color>. You can first let me calculate your luck for today here, it may do you some good. Your current luck is: <color=yellow>"..szluck.."<color>",3,
				"\nAll right, let me calculate today's luck first /abluemoon_luck",
				"\nI want to take the imperial exam /abluemoon_gogo_select",
				"\nForget it, I'm not in good shape today /end_say"
		)
	end
end

function abluemoon_cuntinue(nRound)
	AddMSPlayer(MISSION_ID,1)  --把玩家加入MISSION
	if nRound == 1 then
		abluemoon_1st()
	else
		abluemoon_2nd_go(2)
	end
end

function abluemoon_gogo_select()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_QUEST_DATE) == -1 and GetTask(ABLUEMOON_QUEST_DATE_PAY) == -1 then  --如果是获得了免费答题机会
			Say("<color=green>Rabbit Xiao Ya<color>: This is your chance to take the exam for <color=yellow>free<color>. No matter which exam you choose it's free. Which exam do you want to take?",
					3,
					"I want to take the standard exam for free /#abluemoon_gogo(-1,1)",
					"I want to take the high-EXP exam for free /#abluemoon_gogo(-1,2)",
					"Let me think about it again/end_say"
			)		
	else
		Say("<color=green>Rabbit Xiao Ya<color>: The current exam has two types. One is the <color=yellow>standard exam<color>: no red carrots required, ordinary rewards, one chance per person per day. The other is the <color=yellow>high-EXP exam<color>: red carrots required, generous rewards. Which exam do you want to take?",
				3,
				"I want to take the standard exam /#abluemoon_gogo_check(1)",
				"I want to take the high-EXP exam /#abluemoon_gogo_check(2)",
				"Let me think about it again/end_say"
		)
	end
end

function abluemoon_gogo_check(nType)
	local nDay = tonumber(date("%y%m%d"))
	local nNeedItemAll = {1,2,3,5,5,10,10}  --需要的红萝卜数量
	local nNeedItemCount = 20;
	if nType == 1 then  --如果是一般考试
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay then  --如果是当天第一次参加一般考试
			Say("<color=green>Rabbit Xiao Ya<color>: This is your chance to take the <color=yellow>standard exam<color> today. Do you want to take the standard exam?",
					2,
					"I want to take the standard exam /#abluemoon_gogo(0,1)",
					"Let me think about it again/end_say"
			)	
		else
			Say("<color=green>Rabbit Xiao Ya<color>: You've already taken the standard exam today. Each person only gets one chance per day!",0)
		end
	else                --如果是高经验考试
		if GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay then  --如果是当天第一次参加高级考试
			SetTask(ABLUEMOON_TIMES_DAILY,1)
		end
		local nTimes = GetTask(ABLUEMOON_TIMES_DAILY) --当天答题次数
		if nTimes < 8 and nNeedItemCount ~= 0 then
			nNeedItemCount = nNeedItemAll[nTimes]
		end
		if GetItemCount(2,1,1090) >= nNeedItemCount then
			Say("<color=green>Rabbit Xiao Ya<color>: This is your <color=yellow>"..nTimes.."<color> time taking the high-EXP exam today. You need to pay <color=yellow>"..nNeedItemCount.."<color> <color=yellow>red carrots<color>. Do you want to take the exam?",
					2,
					"I want to take the exam /#abluemoon_gogo("..nNeedItemCount..",2)",
					"Let me think about it again/end_say"
			)
		else
			Say("<color=green>Rabbit Xiao Ya<color>: This is your <color=yellow>"..nTimes.."<color> time taking the high-EXP exam today. You need to pay <color=yellow>"..nNeedItemCount.."<color> <color=yellow>red carrots<color>. It seems you don't have that many red carrots on you. Go prepare some first!",0)
		end
	end
end

function abluemoon_gogo(nNeedItemCount,nType)
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then  --如果没算命,默认是大凶
		SetTask(ABLUEMOON_LUCK,0)
	end
	if nNeedItemCount == 0 or nNeedItemCount == -1 or DelItem(2,1,1090,nNeedItemCount) == 1 then
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay and GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay and nNeedItemCount ~= -1 and GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是今天第一次参加考试且上次考试没用萝卜
			local nJifen = floor(GetTask(ABLUEMOON_JIFEN)/6)  --衰减的积分
			if nJifen > 80 then nJifen = 80 end               --最多衰减80分
			SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)-nJifen))
			Talk(1,"","Because the last exam you took earlier today was not a high-EXP exam, your score has been reduced by <color=yellow>"..nJifen.."<color> points!")
			Msg2Player("Because the last exam you took earlier today was not a high-EXP exam, your score has been reduced by"..nJifen.."points!")
		end
		if nNeedItemCount > 0 then  --免费赠送的和一般考试不算次数
			SetTask(ABLUEMOON_TIMES_DAILY,GetTask(ABLUEMOON_TIMES_DAILY)+1)
		end
		if nType == 1 then  --如果是一般考试
			SetTask(ABLUEMOON_QUEST_DATE, nDay)
			SetTask(ABLUEMOON_AWARD_TYPE,1)  --设置奖励类型1
		else
			if nNeedItemCount > 0 then --免费赠送的不记
				SetTask(ABLUEMOON_QUEST_DATE_PAY, nDay)
			elseif nNeedItemCount == -1 then --免费赠送的
				SetTask(ABLUEMOON_QUEST_DATE_PAY, 0)
			end
			SetTask(ABLUEMOON_AWARD_TYPE,2)  --设置奖励类型2
			SetMissionV(MV_COUNT_PAY,GetMissionV(MV_COUNT_PAY)+1)  --统计这个小时参加高经验的人数
			SetMissionV(MV_COUNT_LUOBO,GetMissionV(MV_COUNT_LUOBO)+nNeedItemCount)
			--WriteLog("[科考统计]玩家 "..GetName().." 参加了高经验考试,花费萝卜"..nNeedItemCount.."个!")
		end
		SetTask(ABLUEMOON_QUEST_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, 0)
		SetTask(ABLUEMOON_CAIQUAN_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_COUNT_MAX, 0)
		AddMSPlayer(MISSION_ID,1)  --把玩家加入MISSION
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
	else
		Say("<color=green>Rabbit Xiao Ya<color>: It seems you don't have that many red carrots on you!",0)
	end
end

function abluemoon_gogogo(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	if nCount == 0 then  --第一次初始化人数
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --彩蛋～
		SetTask(ABLUEMOON_QUEST_DATE, -1)
		SetTask(ABLUEMOON_QUEST_DATE_PAY, -1)
		Msg2Player("Congratulations on earning the chance to challenge again today! Your next exam will be free!")
	end
	Say("<color=green>Rabbit Xiao Ya<color>: You are the <color=yellow>"..count.."<color> challenger today. First play finger-guessing with me, ten rounds in total. However many rounds you win, that's how many chances you get to answer questions. How about it? If you give up, you'll have no chance today!",2,
		"\nStart the challenge /WantCaiquan",                               --猜拳
		"\nI give up my chance for today /end_say"
	)	
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say("<color=green>Rabbit Xiao Ya<color>: Your current score is: <color=yellow>"..jifen.."<color> points.",0)
	for i = 1,getn(tTitle) do --删除原有的称号
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("You earned the title of \""..tTitle[nTitleLevel][3].."\"");
	end;
end

--====================================================资格赛猜拳开始=========================================================
partner_caimei  = {"吴越老祖","Nine Severances Sword Demon","月亮兔"}
function WantCaiquan()
	if GetTask(ABLUEMOON_CAIQUAN_COUNT) < 10 then 
		Say("<color=green>Rabbit Xiao Ya<color>: Come on, come on, let's start the finger-guessing. You still have <color=yellow>"..(10-GetTask(ABLUEMOON_CAIQUAN_COUNT)).."<color> chances to guess. What do you throw?",4,
				"\nWu-Yue Ancestor\n/Caiquan_shitou",
				"\nNine Severances Sword Demon\n/Caiquan_jianzi",
				"\nMoonlight Rabbit\n/Caiquan_bu",
				"\nLet me know the rules first\n/Caiquan_info"
		)
	else
		Say("<color=green>Rabbit Xiao Ya<color>: We've already guessed 10 times. You now have a total of <color=yellow>"..GetTask(ABLUEMOON_QUEST_COUNT_MAX).."<color> chances to answer questions. Let's begin!",1,
				"I'm ready /abluemoon_1st"
				)
	end
end

function Caiquan_shitou()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = 1;
	if random(100) > 50 then
		i = 3;
	end
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 2 end
	if i ~= 2 then	
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! I win, hehe!",1,
				"I don't believe it, again! /WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! You beat me. Your <color=yellow>luck<color> is pretty good today. I'll grant you one more chance to answer a question.",1,
				"Great, keep going, keep going /WantCaiquan")
	end
end

function Caiquan_jianzi()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(1,2)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 3 end
	if i ~= 3 then
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! I win, hehe!",1,
				"I don't believe it, again! /WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! You beat me. Your <color=yellow>luck<color> is pretty good today. I'll grant you one more chance to answer a question.",1,
				"Great, keep going, keep going /WantCaiquan")
	end
end

function Caiquan_bu()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(2,3)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 1 end
	if i ~= 1 then
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! I win, hehe!",1,
				"I don't believe it, again! /WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>Rabbit Xiao Ya<color>: I throw <color=yellow>"..partner_caimei[i].."<color>, aha! You beat me. Your <color=yellow>luck<color> is pretty good today. I'll grant you one more chance to answer a question.",1,
				"Great, keep going, keep going /WantCaiquan")
	end
end

function Caiquan_info()
	Say("<color=green>Rabbit Xiao Ya<color>: The rules are like this: Wu-Yue Ancestor, Nine Severances Sword Demon, and Moonlight Rabbit. The Wu-Yue Ancestor beats the Nine Severances Sword Demon, the Nine Severances Sword Demon beats the Moonlight Rabbit, and the Moonlight Rabbit beats the Wu-Yue Ancestor. Got it? If you beat me you pass; if you don't beat me or it's a tie, for example you throw Nine Severances Sword Demon and I also throw Nine Severances Sword Demon, that counts as my win too. Hehe.",1,"I want to go back to the previous menu /WantCaiquan")
end
--=====================================================资格赛猜拳结束===============================================================

--=====================================================第一关答题开始===============================================================
function abluemoon_1st()	
	local right_count_1st = GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st);
	SetTask(ABLUEMOON_QUEST_ROUND,1)
	if GetTask(ABLUEMOON_QUEST_COUNT_MAX) > GetTask(ABLUEMOON_QUEST_COUNT) then
		SetTask(ABLUEMOON_STATE,1) --开始答题
		SetTask(ABLUEMOON_TIMER,GetGameTime()) --设置计时器起始时间
		show_question(1, "Your <color=yellow>academy exam<color> question number <color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color> today is as follows, please listen: <enter>" )
	elseif GetTask(ABLUEMOON_QUEST_COUNT_MAX) == GetTask(ABLUEMOON_QUEST_COUNT) then  --如果已经回答完毕
--		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == GetTask(ABLUEMOON_QUEST_COUNT_MAX) then  --如果全对
		if right_count_1st >= 5  then  --如果答对5题以上
			Say("<color=green>Rabbit Xiao Ya<color>: Today's <color=yellow>academy exam<color> questions are all answered. You got a total of <color=yellow>"..right_count_1st.."<color> questions right, an accuracy rate of <color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>. Congratulations, you can <color=yellow>keep advancing<color>, or you can claim your reward now. You have a total of <color=yellow>"..right_count_1st.."<color> chances to answer questions in the <color=yellow>provincial exam<color>, keep it up!",2,
					"\nLet me claim my reward now /#GetHappyTimes(1,1)",
					"\nI want to keep advancing /abluemoon_2nd"
					)

		elseif right_count_1st == 0 then  --全错
			DelMSPlayer(MISSION_ID,1)  --把玩家从MISSION中删除
			Say("<color=green>Rabbit Xiao Ya<color>: What a pity, you didn't get a single question right. Come back and try again next time!",0)
		else
			Say("<color=green>Rabbit Xiao Ya<color>: Today's <color=yellow>academy exam<color> questions are all answered. You got a total of <color=yellow>"..right_count_1st.."<color> questions right, an accuracy rate of <color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>. Since you didn't get more than <color=yellow>5<color> questions right, you can't keep advancing. Work harder next time!",1,
						"\nLet me claim my reward now /#GetHappyTimes(1,1)")
		end
	end
end
--=====================================================第一关答题结束=====================================================

--=====================================================第二关答题开始=====================================================
function abluemoon_2nd()
	SetTask(ABLUEMOON_QUEST_COUNT, 0)
	SetTask(ABLUEMOON_QUEST_ROUND, 2)
--	Say("<color=green>兔小丫<color>：大侠真厉害，居然能闯入第二关！我这里有几类题目，你想选哪类呢？",4,
--			"\n自然科学/#abluemoon_2nd_go(2)",
--			"\n人文历史/#abluemoon_2nd_go(3)",
--			"\n剑侠情缘/#abluemoon_2nd_go(4)",
--			"\n乱七八糟/#abluemoon_2nd_go(5)"
--		)
	Say("<color=green>Rabbit Xiao Ya<color>: Impressive, hero, you actually made it into the <color=yellow>provincial exam<color>! I have a few categories of questions here. Which category do you want to choose?",4,
			"\nSword /#abluemoon_2nd_go(2)",
			"\nChivalry /#abluemoon_2nd_go(3)",
			"\nRomance /#abluemoon_2nd_go(4)",
			"\nFate /#abluemoon_2nd_go(5)"
		)
end

function abluemoon_2nd_go(choice)
	SetTask(ABLUEMOON_STATE,1) --开始答题
	SetTask(ABLUEMOON_TIMER,GetGameTime()) --设置计时器起始时间
	local num = choice;
	if num < 2 or num > 5 then --防止传进来一个非法值
		num = random(2,5)
	end
	show_question(num, "Your <color=yellow>provincial exam<color> question number <color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color> today is as follows, please listen: <enter>" )		
end
--==================================================第二关答题结束====================================================

--=================================================乱入特殊问题开始===================================================
function SpecialQues(choice)
	local nchoice = choice
	local options = {}
	--randomseed(GetTime())
	local num = random(1,8)  --以后增加题目的时候记得修改后面这个数
	if num == 1 and GetGlbValue(151) == 0 then num = random(2,8) end
	if num == 1 then  --1.猜辉煌之夜
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: what activity is the Night of Glory today?",6,
					"Battlefield /#SpecialAnswer(1,1,"..nchoice..")",
					"Merchant Fair /#SpecialAnswer(1,2,"..nchoice..")",
					"Sect Random Quest /#SpecialAnswer(1,3,"..nchoice..")",
					"Sect Repeatable Quest /#SpecialAnswer(1,4,"..nchoice..")",
					"Assassin Quest /#SpecialAnswer(1,5,"..nchoice..")",
					"Dragon Boat /#SpecialAnswer(1,6,"..nchoice..")"
				)
	elseif num == 2 then  --2.根据声望猜称号
		local nShengwang = random(-500,35000)	
		for i = 2,21 do  --表格的大小
			if nShengwang < tShengwang[i][1] then 
				options[1] = format("%s/#answer_ok(%d,%d)", tShengwang[i][2], nchoice, 6)
				options[2] = format("%s/#answer_fail(%d,%d)", tShengwang[i-1][2], nchoice, 6)
				options[3] = format("%s/#answer_fail(%d,%d)", tShengwang[i+1][2], nchoice, 6)
				options[4] = format("%s/#answer_fail(%d,%d)", tShengwang[i+2][2], nchoice, 6)
				break
			end
		end
		ReSort(options)
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: what is the title when your reputation is <color=yellow>"..nShengwang.."<color>?",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 3 then  --3.猜升级所需经验
		local level = random(50,97)
		local exp = tExp:getCell((level+2),2)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-10000,10000)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: <color=yellow>"..level.."leveling up to"..(level+1).."level<color> requires how much experience?",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 4 then  --4.猜当前等级交满收集品能获得多少钱
		local num_max = Zgc_conf_task_num_max()
		local sinup = random(10,num_max)
		local gold = task_money_prize(sinup)
		local tab_gold = {}
		for i = 1,3 do
			tab_gold[i] = random(-1000,1000)
			if tab_gold[i] == 0 then tab_gold[i] = tab_gold[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", gold, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: if you turn in <color=yellow>"..sinup.."<color> high-grade guild collection items<color> now, how much money can you get? In <color=yellow>copper<color> as the unit.",4,
				 options[1], options[2], options[3], options[4])		
	elseif num == 5 then  --5.猜某个等级采集技能升级经验
		local skillID = random(1,6)
		local level = random(9,78)
		local exp = gather_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: <color=yellow>"..tGatherSkill[skillID].."<color> from <color=yellow>"..level.."leveling up to"..(level+1).."level<color> requires how much experience?",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 6 then  --6.猜某个等级生产系技能升级经验
		local skillID = random(1,9)
		local level = random(9,78)
		local exp = compose_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>Rabbit Xiao Ya<color>: Ah! Always asking the same kind of question is too boring. I suddenly thought of a question: <color=yellow>"..tComposeSkill[skillID].."<color> from <color=yellow>"..level.."leveling up to"..(level+1).."level<color> requires how much experience?",4,
				 options[1], options[2], options[3], options[4])	
	elseif num == 7 then  --根据XX猜XX,调用吴炜脚本
		options = MoonRabbit_GetAQuestion(1)
		for i = 2,5 do 
			if i == options[6] then
				options[i] = options[i].."/#answer_ok("..nchoice..",6)"
			else
				options[i] = options[i].."/#answer_fail("..nchoice..",6)"
			end
		end
		Say(options[1],4,options[2], options[3], options[4], options[5])			
	elseif num == 8 then  --出一个简单的算数题-_-
		local A,B,C,D = random(100),random(10),random(100),random(10)
		local result = (A*B + C*D)*2*0.9  --瞎掰的题目，大概需要1分钟搞定
		local radnum = {-45,-36,-27,-18,-9,9,18,27,36,45}
		local radresult = {}
		local radtime = 0;
		for i = 1,3 do 
			radresult[i] = radnum[random(10)]
			for j = 1,i-1 do
				if radresult[j] == radresult[i] then
					radresult[i] = radnum[random(10)]
					radtime = radtime + 1;
					if radtime > 10 then
						break;
					end
					j = 1;
				end
			end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", result, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", result+radresult[1], nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", result+radresult[2], nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", result+radresult[3], nchoice, 6)
		ReSort(options)		
		Say("<color=green>Rabbit Xiao Ya<color>: Lately I've been studying the multiplication table and ran into a problem. I wonder if you can help me solve it, hero: Old Wang next door keeps <color=yellow>"..A.."<color> chickens, and each chicken lays <color=yellow>"..B.."<color> eggs every day. He also keeps <color=yellow>"..C.."<color> ducks, and each duck lays <color=yellow>"..D.."<color> eggs every day. Each egg can sell for <color=yellow>2<color> copper coins. The income from selling eggs must also pay the government <color=yellow>one tenth<color> in tax. So how many copper coins can he earn in a day?",4,
				 options[1], options[2], options[3], options[4])	
	end
end

function SpecialAnswer(num,select,choice)  --一些特殊问题的特殊答案,没有配置表读的
	local nchoice = choice
	if num == 1 then 
		if select == GetGlbValue(151) then
				answer_ok(nchoice,6)
		else
				answer_fail(nchoice,6)
		end
	end
end

--===================================================乱入特殊问题结束============================================

--=======================================================给科考外装=========================================================
function abluemoon_cloth()
	if GetTask(ABLUEMOON_JIFEN) < 1000 then
		Say("<color=green>Rabbit Yaya<color>: Your exam score has not yet reached <color=yellow>Jinshi<color>, so you are not yet qualified to receive the Wenkui Flower Robe. But you can go to <color=yellow>Imperial Street<color> and take a look; it seems there are exam outfits of various colors for sale.",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --个位记录是否领取过补偿 十位记录是否领取过科考外装
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say("<color=green>Rabbit Yaya<color>: Your bag is already full and cannot hold any more. Tidy it up first and come back!",0)
			return
		end
		local player_sex = GetBody();
		SetTask(ABLUEMOON_COMPENSATION,GetTask(ABLUEMOON_COMPENSATION)+10)
		if player_sex == 1 then
			AddItem(0,109,260,1)  --文魁花锦袍(蓝) 标准男永久
		elseif player_sex == 2 then
			AddItem(0,109,262,1)  --文魁花锦袍(蓝) 魁梧男永久
		elseif player_sex == 3 then
			AddItem(0,109,268,1)  --文魁花锦裳(橙) 性感女永久
		else
			AddItem(0,109,275,1)  --文魁花锦裳(橙) 娇小女永久
		end
		Say("<color=green>Rabbit Yaya<color>: The Wenkui Flower Robe is ready, put it on and take a look. A great hero skilled in both literary and martial arts gives the nation hope!",0)
	else
		Say("<color=green>Rabbit Yaya<color>: You have already received an exam outfit! Each person can only receive one set. If you still want an outfit in another color, you can go to <color=yellow>Imperial Street<color> to pick one out.",0)
	end
end
--=====================================================规则介绍=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>Every day <color=yellow>except during the 23:00-8:00 period<color>, I will randomly appear in the major cities to accept everyone's challenge. Each person can challenge only once a day. Each time, you must first play rock-paper-scissors with me, and the number of wins decides",
		"the number of questions in the Court Exam. Answer more than 5 questions correctly in the Court Exam and you can advance to the Provincial Exam. The number of questions in the Provincial Exam is decided by how many you answered correctly in the Court Exam. Answer more than 5 correctly in the Provincial Exam and a certificate will be issued.",
		--继续在这里添加就行
	}
	local szSay = "";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say("<color=green>Rabbit Yaya<color>: The rules are as follows......"..szSay,0)
end

tShengwang = {  --根据声望猜称号
	{-500,"Notorious"},
	{-100,"Disreputable"},
	{0,"Common Folk"},
	{50,"Penniless Nobody"},
	{150,"Newcomer to the Martial World"},
	{300,"Nameless Junior"},
	{500,"Quiet and Unknown"},
	{700,"First Showing of Talent"},
	{1000,"A Little Reputation"},
	{1500,"Rising Fame"},
	{2250,"Talent Fully Revealed"},
	{3000,"Renowned Name"},
	{4500,"High Virtue and Esteem"},
	{6000,"Awe-Inspiring on All Sides"},
	{9000,"Famed Like Thunder"},
	{12000,"Commanding Respect Across the Land"},
	{15000,"Looking Down on All Heroes"},
	{18000,"Grandmaster of a Generation"},
	{22500,"Proud Lord of the Martial World"},
	{27000,"Unmatched in the World"},
	{31500,"Shaking the Past and Present"},
	{36500,"Unprecedented and Unmatched"},
	{45000,"Legend of the Martial World"},
}

tGatherSkill = { "伐木", "制皮", "Harvesting", "采药", "挖矿", "抽丝", }

tComposeSkill = { "Long Weapon Forging", "Short Weapon Forging", "Exotic Weapon Forging", "Armor Crafting", "Medicine Making", "Cooking", "Talisman Making", "Lower Armor Weaving", "Headgear Weaving",}
