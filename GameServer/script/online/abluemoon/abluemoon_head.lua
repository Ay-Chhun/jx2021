Include("\\script\\class\\ktabfile.lua");
Include("\\script\\task\\world\\task_head.lua")
QuestTab = new(KTabFile, "\\settings\\abluemoon_question.txt");
Include("\\script\\item\\yanhuo.lua")

--===========================================任务变量相关================================
ABLUEMOON_QUEST_DATE = 610; --参加一般考试的日期
ABLUEMOON_QUEST_COUNT = 611; --当天回答次数
ABLUEMOON_QUEST_RIGHT_COUNT_1st = 612;--当天第一关回答正确次数
ABLUEMOON_QUEST_COUNT_MAX = 613; --当天能回答问题的数量
ABLUEMOON_JIFEN = 614; --积分

ABLUEMOON_STATE = 615; --开始答题标记,用于计时 1:开始答题 2:结束答题 3:答题超时
ABLUEMOON_TIMER = 616; --答题计时器

ABLUEMOON_LUCK_DATE = 617 --算命的日期
ABLUEMOON_LUCK = 618; --每天的幸运值 1～7表示运势 
ABLUEMOON_LUCKY_COUNT = 619 --每天转运的计数

ABLUEMOON_ANSWER_STAGE = 620 --记录领奖的关数
ABLUEMOON_ANSWER_WIN   = 621 --记录领奖的输赢

ABLUEMOON_ITEM_TO_EXP = 622 --记录生活材料换经验的日期
ABLUEMOON_COMPENSATION = 623	--个位记录是否领取过补偿 十位记录是否领取过科考外装 
ABLUEMOON_QUEST_DATE_PAY  = 624 ----参加高级考试的日期 IB专用
ABLUEMOON_TIMES_DAILY = 625 --每天高级考试的次数
ABLUEMOON_QUEST_RIGHT_COUNT_2nd = 626;--当天第二关回答正确次数
ABLUEMOON_CAIQUAN_COUNT = 627;  --每天已经猜拳的次数
ABLUEMOON_AWARD_TYPE    = 628;  --记录奖励类型， 1是普通奖励 2是高级奖励
ABLUEMOON_QUEST_ROUND   = 629;  --当天闯到第几关了
--=======================================================================================
--===========================================全局变量相关=================================
ABLUEMOON_TIME = 60; --答题限制,1分钟
 
MISSION_ID = 33; --140 MISSION ID
TIMER_ID = 61; --140
TIMER_LOOP_TIME = 18*1; --1秒循环一次
MV_MISSION_STATE = 1; --MISSION状态，1为开启，0为关闭  现在没用到
MV_TIMER_TIME = 2; --计时器运行时间
MV_TIMER_IDEL = 3; --停止答题时间
MV_ABLUEMOON_NEED_ROUTE = 4; --领取奖励需要的组队门派，一共15个
tMS_NAME = { 1,2,3,4,5 }  --排名相关名字用到的MISSION S 的ID
tMV_JIFEN = { 5,6,7,8,9 } --排名相关积分用到的MISSION V 的ID
MV_NPC_INDEX = 10;  --兔小丫的索引
MV_COUNT_PAY = 11;  --每小时参加高经验考试的人数
MV_COUNT_LUOBO = 12;  --每小时消耗的萝卜总数
TIMER_TOTAL_TIME = 59*60*1 --MISSION存在时间59分钟
NEED_TEAM = 1; --领奖需不需要组队 0:不需要 1:需要
--========================================================================================
--===================================================答题公共部分开始============================================
-- 显示灯谜对话
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

--给予领奖资格
function GetHappyTimes(nStage,bWin)
	DelMSPlayer(MISSION_ID,1)  --把玩家从MISSION中删除
	SetTask(ABLUEMOON_ANSWER_STAGE,nStage)
	SetTask(ABLUEMOON_ANSWER_WIN,bWin)
	abluemoon_sort() --加入排名
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then
		Say("<color=green>Little Rabbit<color>: You have already earned the qualification to claim the reward, but you still need to pass one final test to receive the prize. Here is how it works: go find a <color=yellow>"..(level-10).."level to"..(level+10).."level"..tNeedRoute[route][2].."<color>friend and come find me together as a <color=yellow>party<color>, and I will give you the reward.",2,
			"I have brought one. Give me the reward/CheckHappyTimes","I will go look again/end_say")
	else
		Say("<color=green>Little Rabbit<color>: You have already earned the qualification to claim the reward. Come find me to collect it any time.",2,
			"Give me the reward/CheckHappyTimes","I will not claim it for now/end_say")		
	end
end

--确认领奖资格
function CheckHappyTimes()
	local stage = GetTask(ABLUEMOON_ANSWER_STAGE)
	local win = GetTask(ABLUEMOON_ANSWER_WIN)
	if stage == 0 then
		Say("<color=green>Little Rabbit<color>: You have already claimed the reward from your last exam!",0)
		return
	end
	
	local canwin = 0; --是否能领取奖励
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then  --需要组队领奖
		local nOldPlayerIndex = PlayerIndex
		local count = GetTeamSize()
		if count >= 2 then
			for i = 1,count do
				PlayerIndex = GetTeamMember(i)
				if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
						canwin = 1;
				end
			end
			PlayerIndex = nOldPlayerIndex
		end 	
	else
		canwin = 1;
	end
	
	if canwin == 0 then 
		Say("<color=green>Little Rabbit<color>: You still have not found a <color=yellow>"..(level-10).."level to"..(level+10).."level"..tNeedRoute[route][2].."<color>friend to come find me together as a <color=yellow>party<color>, so I cannot give you the reward!",0)
	else
		--SetTask(ABLUEMOON_ANSWER_STAGE,0) --放到领取成功之后再清吧
		HappyTimes(stage,win)
	end
end

-- 发奖
function HappyTimes(nStage,bWin)
	local stage = nStage;
	local win = bWin;
	local bonus_1st = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st))
	local bonus_2nd = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd))
	local nLevel = GetLevel();
	local award_1st = nLevel^2*3;  --第一关每题奖励 [级别*级别*3]经验
	local award_2nd = nLevel^2*6;
	local nEarnExp_1st = 0;
	local nEarnExp_2nd = 0;
	local nTotalExp = 0;
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	
	if award_type == 1 then  --如果是一般考试
		award_1st = floor(award_1st/10)
		award_2nd = floor(award_2nd/10)
	end
	nEarnExp_1st = award_1st * bonus_1st  --第一关奖励
	if nStage == 2 then --第二关领取
			nEarnExp_2nd = award_2nd * bonus_2nd  --第二关奖励
	else  --以后扩展
		
	end

	nTotalExp = nEarnExp_1st + nEarnExp_2nd
	if win == 0 then
		nTotalExp = floor(nTotalExp / 2);  --答错了只有一半奖励
	end
	local tPrize = { 
			"<enter>Questions answered correctly in the Provincial Exam: <color=yellow>"..bonus_1st.."<color>questions",
			"<enter>Reward per question in the Provincial Exam: <color=yellow>"..award_1st.."<color>EXP points",
			"<enter>Questions answered correctly in the Local Exam: <color=yellow>"..bonus_2nd.."<color>questions",
			"<enter>Reward per question in the Local Exam: <color=yellow>"..award_2nd.."<color>EXP points",
		}		
	if win == 0 then
		tinsert(tPrize,"<enter>But you failed in the end, so you can only get half the reward, which is a total of: <color=yellow>"..nTotalExp.."<color>EXP points")
	else
		tinsert(tPrize,"<enter>Congratulations, the total reward you can receive today is: <color=yellow>"..nTotalExp.."<color>EXP points")
	end	
	if stage == 1 then
		for i=1,2 do tremove(tPrize,3) end
	end
	local szPrize = "";
	for i=1,getn(tPrize) do 
		szPrize = szPrize..tPrize[i]
	end
	Say("<color=green>Little Rabbit<color>: Based on the record of your last exam, let us settle the account. Your reward for today's questions is as follows:"..szPrize,1,"I will claim it now/#GetPrize("..nTotalExp..","..win..","..nStage..")")
end

--领奖
function GetPrize(nExp,bWin,nStage) 
	local win = bWin
	ModifyExp(nExp);
	Msg2Player("Lei Tai Arena"..nExp.."The lightning arena")
--	if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == 10 and GetTask(ABLUEMOON_QUEST_COUNT) == 5 and win == 1 then
--		AddItem(0,107,155,1)  --五行秘籍
--		Say("<color=green>兔小丫<color>：由于你表现优异，特奖励你一本五行秘籍，下次继续努力！",0)
--	end
	
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV >= 3 then 
		Msg2SubWorld("Congratulations to player"..GetName().." earned the title \""..tTitle[jifenLV][3].."\"!")
	end
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	local book_num = 1;
	if award_type == 2 then  --如果是高级考试
		book_num = 2;
	end
	local book = random(100)
	if nStage == 2 and GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then  --第二关答对5题以上才给证书
		if jifenLV == 2 then  --生员
			AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
			Msg2Player("You received the reward of the Imperial Examination - Student Certificate"..book_num.."volume!")
		elseif jifenLV == 3 then  --秀才
			if book < 50 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("You received the reward of the Imperial Examination - Student Certificate"..book_num.."volume!")
			else
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("You received the reward of the Imperial Examination - Scholar Certificate"..book_num.."volume!")
			end
		elseif jifenLV == 4 then --举人
			if book < 40 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("You received the reward of the Imperial Examination - Student Certificate"..book_num.."volume!")
			elseif book < 70 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("You received the reward of the Imperial Examination - Scholar Certificate"..book_num.."volume!")
			else
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("You received the reward of the Imperial Examination - Recommended Scholar Certificate"..book_num.."volume!")
			end
		elseif jifenLV == 5 then --贡士
			if book < 30 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("You received the Moon Rabbit's quest scroll - Student Certificate"..book_num.."volume!")
			elseif book < 60 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("You received the Moon Rabbit's quest scroll - Scholar Certificate"..book_num.."volume!")
			elseif book < 80 then
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("You received the Moon Rabbit's quest scroll - Recommended Scholar Certificate"..book_num.."volume!")
			else
				AddItem(2,0,600,book_num)  --月亮兔的任务卷轴－贡士
				Msg2Player("You received the Moon Rabbit's quest scroll - Tribute Scholar Certificate"..book_num.."volume!")				
			end			
		elseif jifenLV >= 6 then --进士以上
			if book < 30 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("You received the Moon Rabbit's quest scroll - Student Certificate"..book_num.."volume!")
			elseif book < 55 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("You received the Moon Rabbit's quest scroll - Scholar Certificate"..book_num.."volume!")
			elseif book < 75 then
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("You received the Moon Rabbit's quest scroll - Recommended Scholar Certificate"..book_num.."volume!")
			elseif book < 95 then
				AddItem(2,0,600,book_num)  --月亮兔的任务卷轴－贡士
				Msg2Player("You received the Moon Rabbit's quest scroll - Tribute Scholar Certificate"..book_num.."volume!")	
			else
				AddItem(2,0,601,book_num)  --月亮兔的任务卷轴－进士
				Msg2Player("You received the Moon Rabbit's quest scroll - Presented Scholar Certificate"..book_num.."volume!")							
			end			
		end
	end
	
	SetTask(ABLUEMOON_ANSWER_STAGE, 0) --领完奖励之后清空答题信息
	SetTask(ABLUEMOON_QUEST_ROUND, 0)  --清空用于继续答题的标志
	local level = GetLevel()
	local nOldPlayerIndex = PlayerIndex
	local count = GetTeamSize()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if count >= 2 then
		for i = 1,count do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
					local nOtherExp = GetLevel()^2*20
					ModifyExp(nOtherExp) --给队友加级别^2*20经验
					Msg2Player("Lei Tai Arena"..nOtherExp.."EXP points!")
			end
		end
		PlayerIndex = nOldPlayerIndex
	end 
end

-- 显示灯谜问题
function show_question(num, caption)
	local row_start = 0;
	local row_end = 0;
	local Qnum = num;
	local Onum = Qnum;
	if num ~= 1 then
		if random(100) < 50 then 
			Qnum = 6 ;               --乱入特殊问题 1/5概率
		end
	end
	if Qnum == 1 then  --第一关题库
		row_start = 2;
		row_end = 278
	elseif Qnum == 2 then  --第二关第1类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 3 then  --第二关第2类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 4 then  --第二关第3类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 5 then  --第二关第4类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 6 then  --乱入特殊问题
		SpecialQues(Onum)
	end
	if (row_end > 1) then
		local row = random(row_start, row_end)
		local answer = QuestTab:getCell(row, 2)
		local question = format("%s%s", caption, QuestTab:getCell(row, 3))
		local options = {}
		
		for i = 1, 4 do
			options[i] = QuestTab:getCell(row, 3 + i)
			if (tbl_answer_index[answer] == i) then
				options[i] = format("%s/#answer_ok(%d,%d)", options[i], Onum, Qnum)
			else
				options[i] = format("%s/#answer_fail(%d,%d)", options[i], Onum, Qnum)
			end
		end
		ReSort(options)
		Say(question, 4, options[1], options[2], options[3], options[4])
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- 回答正确
function answer_ok(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --获得积分等级
	local jifen = 1;
	if Qnum > 1 and Qnum < 7 then  --第二关 
		jifen = tJifen[1][jifenLV] --按积分等级给积分，只对第二关有效
		if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是一般考试
			jifen = floor(jifen/2)
		else
			jifen = jifen * 2
		end
	end
	if njifen >= 4999 then jifen = 0 end  --限制分数上限

	if GetTask(ABLUEMOON_STATE) == 3 then 
		Say("<color=green>Little Rabbit<color>: Your answer timed out, so it counts as wrong!",1,"Understood/#answer_fail("..num..","..Qnum..")")
		return
	else
		SetTask(ABLUEMOON_STATE,2) --停止答题
	end
	Msg2Player("Congratulations, you answered correctly!")
	use_yanhuo("Mystic Fireworks")  --放烟花庆祝,能不能做情绪动作？
	--DoFireworks(862,1)  --后羿效果
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)   --答题数+1
	if Qnum == 1 then  --第一关
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+jifen)	  --积分+1
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) + 1)  --第一关正确题数+1
		Say("<color=green>Little Rabbit<color>: Congratulations, you answered correctly! I will add another <color=yellow>"..jifen.."points<color>.",1,"Continue answering/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --第二关
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))	  --积分+2
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) + 1)  --第二关正确题数+1
		if GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) then  --第二关可以答题的数量＝第一关正确的数量
			Say("<color=green>Little Rabbit<color>: Congratulations, you answered correctly! I will add another <color=yellow>"..jifen.."points<color>. So far in the Local Exam you have answered <color=yellow>"..GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd).."<color>questions correctly. You can keep advancing, or you can claim your accumulated reward now.",2,"\nKeep advancing/#abluemoon_2nd_go("..num..")","\nI will claim the reward now/#GetHappyTimes(2,1)")
		elseif GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			local bonus = 10;
			if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是一般考试
				bonus = bonus/2
			else
				bonus = bonus*2
			end
			if njifen <= 4989 then 
				SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+bonus)	  --积分+1
			end
			Say("<color=green>Little Rabbit<color>: Congratulations, you answered more than <color=yellow>5 questions<color> correctly in the Local Exam! I will give you an extra reward of <color=yellow>"..bonus.."points<color>!",1,"I will claim the reward now/#GetHappyTimes(2,1)")
		else
			Say("<color=green>Little Rabbit<color>: Your performance in the Local Exam was poor; you did not answer more than <color=yellow>5 questions<color> correctly. There is no extra reward!",1,"I will claim the reward now/#GetHappyTimes(2,0)")
		end
	end
end

-- 回答错误
function answer_fail(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	SetTask(ABLUEMOON_STATE,2) --停止答题
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --获得积分等级
	local jifen = tJifen[2][jifenLV]  --按积分等级给积分，只对第二关有效
	Msg2Player("You answered wrong!")
	CastState("state_lost_life_per18",250,18*5)
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)  --答题数+1
	if Qnum == 1 then  --第一关
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)-1)  --积分-1
		Say("<color=green>Little Rabbit<color>: What a pity, you got it wrong! You were deducted <color=yellow>1 point<color>, hee hee!",1,"Continue answering/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --第二关
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))  --积分-2
		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			Say("<color=green>Little Rabbit<color>: What a pity, you got it wrong! You were deducted <color=yellow>"..-jifen.."points<color>, so you can no longer keep advancing. You can only claim half of your accumulated reward; do better next time! You answered more than <color=yellow>5 questions<color> correctly in the Local Exam, so you may receive a certificate reward!",1,"Claim the reward/#GetHappyTimes(2,0)")
		else
			Say("<color=green>Little Rabbit<color>: What a pity, you got it wrong! You were deducted <color=yellow>"..-jifen.."points<color>, so you can no longer keep advancing. You can only claim half of your accumulated reward; do better next time! Your performance in the Local Exam was poor; you did not answer more than <color=yellow>5 questions<color> correctly. There is no certificate reward!",1,"I will claim the reward now/#GetHappyTimes(2,0)")
		end
	end
end
--==================================================答题公共部分结束=================================================

--====================================================当天运势开始===================================================
function abluemoon_luck()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then
		SetTask(ABLUEMOON_LUCK_DATE,nDay) 
		SetTask(ABLUEMOON_LUCK,0)
		SetTask(ABLUEMOON_LUCKY_COUNT,1)
	end 
	local nluck = random(1,7)
	if GetTask(ABLUEMOON_LUCK) == 0 then
		SetTask(ABLUEMOON_LUCK,nluck)
		Say("<color=green>Little Rabbit<color>: Heaven spirits, earth spirits, none are as clever as my rabbit, (incantation) $%@##%@*...*(incantation), with a pinch of my fingers, this hero's fortune today is: <color=yellow>"..tluck[nluck].."<color>.",2,
				"I want a change of luck/want_lucky",
				"Many thanks, Rabbit Half-Immortal/end_say")
	else
		Say("<color=green>Little Rabbit<color>: I already cast a divination for you once, and no matter how I calculate it the result is the same. Your fortune today is: <color=yellow>"..tluck[GetTask(ABLUEMOON_LUCK)].."<color>. But since I am the Rabbit Half-Immortal, if you beg me I can still change your luck...",2,
				"I want a change of luck/want_lucky",
				"I give up/end_say"
				)
	end
end

function want_lucky()
	local nPay = 10 * GetTask(ABLUEMOON_LUCKY_COUNT) + 15
	Say("<color=green>Little Rabbit<color>: To change your luck, we must also see whether the gods are willing to help! Here is the deal: bring me a <color=yellow>Mystic Item<color>, I will offer it to the gods and see if they can change your luck. If you do not have one, that is fine too. Give me <color=yellow>"..nPay.."gold<color> in incense money and I will burn incense to try for you. Also, whether or not your luck can be changed depends on your own destiny! If you bring a <color=yellow>Golden Carrot<color>, I can change your luck to <color=yellow>Great Fortune<color> for free!",5,
			"I will pay the incense money to change my luck/give_lucky_money",
			"I will give a Mystic Item to change my luck/give_lucky_shenmi",
			"I want to go straight to Great Fortune/want_daji",
			"I want to see which Mystic Items can change luck/shenmi_info",
			"I will go take a look/end_say"
			)
end

function give_lucky_money()  --用钱转运 
	local nCount = GetTask(ABLUEMOON_LUCKY_COUNT)
	local nPay = nCount * 100000 + 150000
	local nluck = random(1,7)
	if GetCash() >= nPay then
			Pay(nPay)
			SetTask(ABLUEMOON_LUCK,nluck)
			SetTask(ABLUEMOON_LUCKY_COUNT,nCount+1)
			Say("<color=green>Little Rabbit<color>: Wonderful, I will accept your incense money! I have recalculated your fortune, and now it is: <color=yellow>"..tluck[nluck].."<color>.",0)
	else
		Say("<color=green>Little Rabbit<color>: Do not try to cheat me, or watch out, I will turn your luck into Great Misfortune!",0)
	end
end

function give_lucky_shenmi()  --看看玩家身上有什么可以用的物品
	local num = 0;
	local index = 0;
	for i = 1, getn(tShenmi) do
		if GetItemCount(2,1,tShenmi[i][2]) > 0 then
			index = i;
			num = tShenmi[i][2];
			break
		end
	end
	if num == 0 then
		Say("<color=green>Little Rabbit<color>: It seems you do not have any Mystic Item that can change luck!",0)
	else
		Say("<color=green>Little Rabbit<color>: The <color=yellow>"..tShenmi[index][1].."<color>on you can be used to change luck. Are you sure you want to use it to change your luck? If you do not want to use it, please first place it in the warehouse or stall.",2,
				"Yes, I want to use it to change my luck/#del_lucky_shenmi("..num..")",
				"I will not change/end_say")
	end
end

function del_lucky_shenmi(num)  --用神秘物品转运
	local nluck = random(1,7)
	if DelItem(2,1,num,1) == 1 then
		SetTask(ABLUEMOON_LUCK,nluck)
		SetTask(ABLUEMOON_LUCKY_COUNT,GetTask(ABLUEMOON_LUCKY_COUNT)+1)
		Say("<color=green>Little Rabbit<color>: Wonderful, I will accept your Mystic Item! I have recalculated your fortune, and now it is: <color=yellow>"..tluck[nluck].."<color>.",0)	
	else
		Say("<color=green>Little Rabbit<color>: Do not try to cheat me, or watch out, I will turn your luck into Great Misfortune!",0)
	end
end

function shenmi_info()  --能转运的神秘物品
 local shenmi = ""
 for i = 1, getn(tShenmi) do
 	shenmi = shenmi..tShenmi[i][1].." "
 end
 Talk(1,"","<color=green>Little Rabbit<color>: The following items can change luck:"..shenmi)
end

function want_daji()
	if GetItemCount(2,1,1091) >= 1 then
		Say("<color=green>Little Rabbit<color>: You have a <color=yellow>Golden Carrot<color> on you. If you give it to me, I can change your luck to <color=yellow>Great Fortune<color>! Do you want to give it to me?",2,
				"I will give it to you/want_daji_go",
				"Let me think about it/end_say"
		)
	else
		Say("<color=green>Little Rabbit<color>: To turn a Great Fortune you need a <color=yellow>Golden Carrot<color>!",0)
	end
end

function want_daji_go()
	if DelItem(2,1,1091,1) == 1 then
		SetTask(ABLUEMOON_LUCK,7) 
		Say("<color=green>Little Rabbit<color>: Congratulations, your fortune today is <color=yellow>Great Fortune<color>!",0)
	else
		Say("<color=green>Little Rabbit<color>: To turn a Great Fortune you need a <color=yellow>Golden Carrot<color>!",0)
	end
end
--==================================================当天运势结束=========================================

--==================================================返回积分等级开始=========================================
function jifen2level(jifen)
	local nTitleLevel = 1;
	if jifen < 0 then
			nTitleLevel = 1
	elseif jifen < 100 then
			nTitleLevel = 2
	elseif jifen < 200 then
			nTitleLevel = 3
	elseif jifen < 500 then
			nTitleLevel = 4
	elseif jifen < 1000 then
			nTitleLevel = 5
	elseif jifen < 1500 then
			nTitleLevel = 6
	elseif jifen < 3000 then
			nTitleLevel = 7
	elseif jifen < 5000 then
			nTitleLevel = 8
	elseif jifen < 10000 then
			nTitleLevel = 9
	else
			nTitleLevel = 10
	end
	return nTitleLevel
end
--===================================================返回积分等级结束===================================================
--===================================================排行榜开始===========================================================
function abluemoon_paihang()  --显示排行榜
	local tab_jifen = {};
	local tab_name = {};
	local tab_level = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
		tab_level[i] = jifen2level(tab_jifen[i])
	end
	Say("<color=green>Little Rabbit<color>: According to the registry I recorded today, the top five candidates in this exam are:"..
			"<enter>1st place:"..tab_name[1]..", points:"..tab_jifen[1]..", title:"..tTitle[tab_level[1]][3]..
			"<enter>2nd place:"..tab_name[2]..", points:"..tab_jifen[2]..", title:"..tTitle[tab_level[2]][3]..
			"<enter>3rd place:"..tab_name[3]..", points:"..tab_jifen[3]..", title:"..tTitle[tab_level[3]][3]..
			"<enter>4th place:"..tab_name[4]..", points:"..tab_jifen[4]..", title:"..tTitle[tab_level[4]][3]..
			"<enter>5th place:"..tab_name[5]..", points:"..tab_jifen[5]..", title:"..tTitle[tab_level[5]][3],
			0)
end

function abluemoon_sort()  --每次答完一个就统计一次排名
	local jifen = GetTask(ABLUEMOON_JIFEN);
	local tab_jifen = {};
	local tab_name = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
	end
	for i = 1,5 do  --插入并排序
		if jifen > tab_jifen[i] then
			for j = 5,i+1,-1 do 
				tab_jifen[j] = tab_jifen[j-1]
				tab_name[j] = tab_name[j-1]
			end
			tab_jifen[i] = jifen
			tab_name[i] = GetName()
			break
		end
	end
	for i = 1,5 do  --重新设置排名信息
		SetMissionV(tMV_JIFEN[i],tab_jifen[i])
		SetMissionS(tMS_NAME[i],tab_name[i])
	end	
end
--===================================================排行榜结束===========================================================
tluck = { "Great Curse", "Medium Curse", "Small Curse", "Neutral", "Small Fortune", "Medium Fortune", "Great Fortune"}
	
tShenmi = {  --转运用的神秘物品(2,1,...)
	{"黄金宝箱",108},
	{"Skill Relic",109},
	{"Mountains and Rivers Painting Fragment",110},
	{"Rose",111},
	{"Lucky Rabbit Foot",112},
	{"Grey Wolf Fang",113},
	{"Waterproof Oil Cloth",114},
	{"Sky-Breaking Bow",115},
	{"Dragon Bone",116},
	{"Drunken Immortal Chrysanthemum",117},
	{"Corpse King Rib",118},
	{"Corpse Gas Bottle",119},
	{"Tube",120},
	{"Flying Fish Pouch",121},
	{"Twin Star Pot",122},
	{"Beast King Heart",123},
	{"Skull",124},
	{"Soul-Gathering Cauldron",125},
	{"Wax Pellet",126},
	{"Toad Poison",127},
	{"Official Cap",128},
	{"Secret Assassination Order",129},
	{"Sky-Shaking Thunder",130},
	{"Treasure Map",131},
	{"Wind Kite",132},
	{"ELEMENT",133},
	{"Black Silver",134},
	{"Flower Stone Drill",135},
	{"Ink Oil",136},
	{"Growth Mirror",137},
	{"Bi Sheng Movable Type Edition",138},
	{"Human Head Prayer Beads",139},
	{"Stream and Mountain Travel Map",140},
	{"Demon King Battle Flag",141},
	{"Imperial Jade Seal",142},
	{"Heavenly Marsh Five Thunder Great Art",143},
	{"Gold Brick",144},
	{"Thunder-Flame Gold Sand",146},
	{"Seamless Heavenly Garment",147},
	{"Bodhi Seed",151},
	{"Secret Silver",152},
	{"Pigment",153},
}

tNeedItem = {  --领取奖励所需物品
	{"Spirit Pearl Thread", 2,2,54 },
	{"Golden Silkworm Thread", 2,2,55 },
	{"Bear Hide",   2,2,20 },
	{"Roc Feather Cloak",2,10,7 },
	{"Black Iron",   2,2,6 },
	{"Sky-Blue Stone", 2,2,36 },
	{"Heavy Wood",   2,2,9 },
	{"Iron Camphor Wood", 2,2,10 },
}

tNeedRoute = {  --领取奖励需要组队的流派
	{0,"No Sect No School"},
	{2,"Shaolin Lay Disciple"},
	{3,"Shaolin Meditation Lineage"}, 
	{4,"Shaolin Martial Lineage"}, 
	{6,"Tang Sect"},
	{8,"Emei Buddhist"},
	{9,"Emei Lay"},
	{11,"Beggar Sect Clean Robe"},
	{12,"Beggar Sect Dirty Robe"}, 
	{14,"Wudang Taoist"},
	{15,"Wudang Lay"},
	{17,"Yang Sect Spear Cavalry"},
	{18,"Yang Sect Bow Cavalry"},
	{20,"Five Poison Heretic"},
	{21,"Five Poison Sorcerer"},
}

tJifen = {  -- 相应称号等级答题的分数
	[1] = {  --加分，一共10级
		15,10,7,6,5,5,5,5,5,5
	},
	[2] = {  --扣分
	  -1,-1,-1,-3,-10,-20,-30,-40,-50,-100
	}
}

tTitle = {  --相应积分对应的称号
	{50,1,"Illiterate" },
	{50,2,"Student"},
	{50,3,"Scholar (Xiucai)"},
	{50,4,"Provincial Graduate (Juren)"},
	{50,5,"Tribute Scholar (Gongshi)"},
	{50,6,"Metropolitan Graduate (Jinshi)"},
	{50,7,"Academician"},
	{50,8,"Pavilion Academician"},
	{50,9,"Hanlin Academy Grand Academician"},
	{50,10,"Wenqu Star"},
}


function end_say()

end