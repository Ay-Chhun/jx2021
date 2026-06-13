--=============================================
--create by baiyun 2010.1.7
--describe:越南版完成师门任务给奖励 头文件
--related files: 把每个活动过师门任务、藏剑等得到奖励
--               的代码都包含在此处
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\happiness_bag\\happiness_bag.lua"); 
Include("\\script\\online_activites\\silingmount\\silingmount.lua")		--四灵坐骑
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")			--IpBonus
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")			--师门4套装备发放
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\2011_08\\activity_03\\lamp_head.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua") --财富宝箱
Include("\\script\\online_activites\\2011_11\\activity_02\\init.lua")--201112圣诞节活动
Include("\\script\\online_activites\\2011_12\\chunjie\\init.lua") --2012春节活动
Include("\\script\\online_activites\\201201\\qingrenjie\\init.lua") --2012年2月情人节活动
Include("\\script\\online_activites\\201202\\guojifunvjie\\init.lua")--2012年2月国际妇女节
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua") 
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")
Include("\\script\\online_activites\\2014_03\\task_camp.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")
--Include("\\script\\online_activites\\201510\\kill_npc_daily.lua")

--过师门任务给奖励
function Give_Faction_Award()

end
--过藏剑给奖励
function Give_CangJian_Award(nStage, GS_RECORD_CHANCE)                         
end
--太虚里面打死一个怪给奖励
function Give_TaiXu_KillMonster_Award(szMonsterName)                           

end
--通过太虚第8关给奖励
function Give_PassTaiXu_Award()                                                
	SetTask(VET_201009_00_TASK_TONGGUAN_TAIXU,1)
end

--完成个人日常任务给的奖励
function Give_Daily_Personal_Task_Award(bBonus)
	--四灵坐骑 长期
	VET_SilingMountDailyPersonalTaskAward(); 
	VET_IpBonusDailyPersonalTaskAward();
	VET_Tier4DailyPersonalTaskAward(bBonus);
	--财富宝箱
	get_award_woodenbox()
end

--完成团队日常任务给的奖励
function Give_Daily_Team_Task_Award(bBonus)
	--四灵坐骑 长期
	VET_SilingMountDailyTeamTaskAward(); 
	VET_IpBonusDailyTeamTaskAward();
	VET_Tier4DailyTeamTaskAward(bBonus);
	--财富宝箱
	get_award_woodenbox()
end
--种小般若树奖励
function Give_XiaoBanRuoShu_Award()                                           
	HBRewardInSmallWisdomTree();
	--VET_IpBonusSeedAward();
	--11年6月活动后统一处理
	vaf_award_api("tPlantSmallTreePrize")
	--挂花灯-小树
	vaf_20110803_small_tree()
end
--种大般若树奖励
function Give_DaBanRuoShu_Award()                                              
	HBRewardInBigWisdomTree();
	--VET_IpBonusSeedAward();
	--11年6月活动后统一处理
	vaf_award_api("tPlantBigTreePrize")
	--挂花灯-小树
	vaf_20110803_big_tree()													
end
--种种子30086
function Give_Zhongzi_Award()                                              
	HBRewardInPlantingTreeSeeds();
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--打开种子包给奖励（注意背包空间）
function Give_seedbag_Award()                              
	vaf_award_api("tOpenSeedBagPrize")
end

function give_tuoguan_activity_award()
end
--商会任务
function Give_Business_Award()                                              
	VET_IpBonusBusinessAward();
end
--种种子30075
function Give_Zhongzi2_Award()                                              
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--梁山关卡-杀boss
function vaf_liangshan_boss_down()
	--2011年8月挂灯活动
	vaf_liangshan_boss_down_20110803()
	--财富宝箱
	--get_award_woodenbox()
	--活动梁山杀boss获得道具
	vaf_award_api("tLiangShanKillBoss")
end
--梁山关卡-每日任务
function vaf_liangshan_daily_task()
	--2011年8月挂灯活动
	vaf_liangshan_daily_task_20110803()
	--财富宝箱
	get_award_woodenbox()
	--2011年12月圣诞节活动
	get_award_liangshan()
	--2012春节活动
	get_award_liangshan_chunjie()
	--2012年2月情人节活动
	get_award_liangshan_qingrenjie()
	--2012年3月国际妇女节活动
	get_award_liangshan_funvjie()
	--活动梁山每日任务获得道具
	vaf_award_api("tLiangShanDailyTask")
end
--梁山关卡-开启聚义宝箱
function vaf_liangshan_juyibox()
	--201112圣诞节活动
	get_award_juyibox()
	--2012春节活动
	get_award_juyibox_chunjie()
	--2012年2月情人节活动
	get_award_juyibox_qingrenjie()
	--2012年3月国际妇女节活动
	get_award_juyibox_funvjie()

end
--TODO add 天门阵-宋辽资源争夺战 function 接口
--参加一场天门阵
function extra_tianmenzhen_award(nType)
	--财富宝箱
	--get_award_woodenbox()
	--201112圣诞节活动
	get_award_tianmenzhen(nType)
	--2012春节活动
	get_award_tianmenzhen_chunjie(nType)
	--2012年2月情人节活动
	get_award_tianmenzhen_qingrenjie(nType)
	--2012年3月国际妇女节活动
	get_award_tianmenzhen_funvjie(nType)
	--天门阵获得活动道具
	vaf_TianMenZhen_Award_Api(nType)
end

--参加一场战场
function extra_zhanchang_award(nType)
	--战场获得活动道具
	vaf_ZhanChang_Award_Api(nType)
end
--TODO add 万剑冢过关奖励
function extra_wjz_award()
	vaf_award_api("tWanJianZhong")
end
--TODO add 通天幻境过关奖励
function extra_ttd_award()
	vaf_award_api("tTongTianHuanJing")
end

--地玄宫开启精英宝箱
function open_dxg_tyjyx_award()
	--vaf_dxg_open_jyx();
end

--地玄宫开启天阴圣物箱
function open_dxg_tyswx_award()
	--vaf_dxg_open_swx();
end

--杀野外怪物有概率掉落活动道具
function trigger_killnpc_drop()
	vaf_kill_npc_drop();
end

--2014春节副活动2杀野猪
function trigger_killnpc_wildpig(sName)
	Vet_201401_Kill_WildPig(sName);
end

--2014春节副活动3杀灰兔和野兔
function trigger_killnpc_tuzi(sName)
	Vet_201401_Valentine_Trigger(sName);
end

--2014春节副活动4杀野猪
function trigger_killnpc_wildpig2(sName)
	Vet_201401_sprint2_trigger(sName);
end

--活动杀怪通用接口
function trigger_killnpc_common(sName)
	--WN_201403_KillNpc(sName)
	--WN_201403_CampTask_Killer(sName)
	g_akct_KillTrigger(sName)
	--tbKillNpcDaily:TriggerKillNpc(sName)
end

--131获得莲子甜品
function vaf_get_prize_daily_reset()
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	tb:SetTask(10, 0);
end

function vaf_get_prize_item_30709(nRand, nNum)
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	if tb:GetTask(10) >= 30 then
		return 0;
	end
	if random(100) <= nRand then
		tb:SetTask(10, tb:GetTask(10) + nNum);
		gf_AddItemEx2({2,1,30709,nNum}, "Lotus Seed Tea", "Ho箃 ng th竛g 8", "Received Lotus Seed Tea", 0, 1)
	end
end