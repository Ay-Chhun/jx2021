--文件名：月亮兔卷轴任务
--功能描述：月亮兔的任务卷轴的相关奖励。
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=============================公共变量定义区=================================
goods_and_prize_list = {
	--id-----------------------名称---------------师门令牌数量--奖励1-4数量/概率----转换健康经验数量--健康经验倍率--声望--说明
	{601,"Advanced Scholar Certificate","","",5,15,25,50,10,1600000,1.5,40,"Collect for the Moonlight Rabbit: any 5 manuals, 1 Assassin Treasure Map, and 1 each of the Taixu Bagua Plate - Qian, Kun, Kan, Dui\n<color=yellow>Quest Fixed Reward<color>: gain [level x level x level x1.5] EXP.\n<color=yellow>Quest Random Reward 1<color>: gain [level x level x level x1.5] EXP, 50% chance\n<color=yellow>Quest Random Reward 2<color>: 10 Meteor Iron, 25% chance\n<color=yellow>Quest Random Reward 3<color>: 40 reputation points, 10% chance\n<color=yellow>Quest Random Reward 4<color>: 1 random sect manual, 10% chance\n<color=yellow>Quest Random Reward 5<color>: 1 Moonlight Rabbit Iron Treasure Chest, 5% chance"},
	{600,"Tribute Scholar Certificate","","",4,12,30,50,8,1200000,1.2,30,"Collect for the Moonlight Rabbit: 1 each of the seven great sects' Sect Tokens, and 10 each of Iron-Thread Fine Wood / Mountain Lion Fine Hide / Black Mink Fine Stone / Red Mink Spirit Charm.\n<color=yellow>Quest Fixed Reward<color>: gain [level x level x level x1.2] EXP.\n<color=yellow>Quest Random Reward 1<color>: gain [level x level x level x1.2] EXP		50% chance\n<color=yellow>Quest Random Reward 2<color>: 8 Meteor Iron					20% chance\n<color=yellow>Quest Random Reward 3<color>: 30 reputation points					18% chance\n<color=yellow>Quest Random Reward 4<color>: 1 random sect manual			8% chance\n<color=yellow>Quest Random Reward 5<color>: 1 Moonlight Rabbit Iron Treasure Chest			4% chance"},
	{599,"Recommended Scholar Certificate","","",3,8,30,50,5,1000000,1,20,"Collect for the Moonlight Rabbit: 222 each of Cold Silkworm Thread / Mountain Lion Hide / Musk / Roaming Dragon Marrow, or Black Mink Stone / Iron-Thread Wood / Musk / Roaming Dragon Marrow\n<color=yellow>Quest Fixed Reward<color>: gain [level x level x level] EXP.\n<color=yellow>Quest Random Reward 1<color>: gain [level x level x level] EXP		50% chance\n<color=yellow>Quest Random Reward 2<color>: 5 Meteor Iron					20% chance\n<color=yellow>Quest Random Reward 3<color>: 20 reputation points					22% chance\n<color=yellow>Quest Random Reward 4<color>: 1 random sect manual			5% chance\n<color=yellow>Quest Random Reward 5<color>: 1 Moonlight Rabbit Iron Treasure Chest			3% chance"},
	{598,"Cultivated Scholar Certificate","","",2,5,30,50,3,800000,0.8,10,"Collect for the Moonlight Rabbit: 222 each of Golden Silkworm Thread / Roc Feather Cloak / Mountain-Piercing Armor, or Iron Palm Wood / Pure Barley / Sky-Blue Stone\n<color=yellow>Quest Fixed Reward<color>: gain [level x level x level x0.8] EXP.\n<color=yellow>Quest Random Reward 1<color>: gain [level x level x level x0.8] EXP		50% chance\n<color=yellow>Quest Random Reward 2<color>: 3 Meteor Iron					20% chance\n<color=yellow>Quest Random Reward 3<color>: 10 reputation points					25% chance\n<color=yellow>Quest Random Reward 4<color>: 1 random sect manual			3% chance\n<color=yellow>Quest Random Reward 5<color>: 1 Moonlight Rabbit Iron Treasure Chest			2% chance"},
	{597,"Student Certificate","","",1,3,33,50,2,500000,0.5,5,"Collect for the Moonlight Rabbit: 222 each of Spirit Pearl Thread / Bear Hide / Tianqi, or Black Iron / Heavy Wood / Refined Barley\n<color=yellow>Quest Fixed Reward<color>: gain [level x level x level x0.5] EXP.\n<color=yellow>Quest Random Reward 1<color>: gain [level x level x level x0.5] EXP		50% chance\n<color=yellow>Quest Random Reward 2<color>: 2 Meteor Iron					17% chance\n<color=yellow>Quest Random Reward 3<color>: 5 reputation points					30% chance\n<color=yellow>Quest Random Reward 4<color>: 1 random sect manual			2% chance\n<color=yellow>Quest Random Reward 5<color>: 1 Moonlight Rabbit Iron Treasure Chest			1% chance"},
}
token_list ={205,206,207,208,209,350,390}	
--==============================脚本主逻辑区================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	local goods_types = {
		{},
		{},
		{"222 each of Cold Silkworm Thread, Mountain Lion Hide, Musk, Roaming Dragon Marrow","222 each of Black Mink Stone, Iron-Thread Wood, Musk, Roaming Dragon Marrow"},
		{"222 each of Golden Silkworm Thread, Roc Feather Cloak, Mountain-Piercing Armor","222 each of Sky-Blue Stone, Iron Palm Wood, Pure Barley"},
		{"222 each of Spirit Pearl Thread, Bear Hide, Tianqi","222 each of Black Iron, Heavy Wood, Refined Barley"}
	}
	for i = 1,getn(goods_and_prize_list) do
		if goods_id == goods_and_prize_list[i][1] then
			goods_diff = i
		end
	end
	if goods_diff == 1 then
		Say("\"<color=red>"..goods_and_prize_list[goods_diff][2].."<color>\":"..goods_and_prize_list[goods_diff][13],
		3,
		"The items you need have already been collected/#goods_need_chk("..goods_diff..",1)",
		"I want to see the list of manuals required/book_need_jue",
		"Let me go and prepare a bit more/end_dialog")		
	elseif goods_diff == 2 then  
		Say("\"<color=red>"..goods_and_prize_list[goods_diff][2].."<color>\":"..goods_and_prize_list[goods_diff][13],
		2,
		"The items you need have already been collected/#goods_need_chk("..goods_diff..",1)",
		"Let me go and prepare a bit more/end_dialog")
	else
		Say("\"<color=red>"..goods_and_prize_list[goods_diff][2].."<color>\":"..goods_and_prize_list[goods_diff][13],
		3,
		"I am already prepared"..goods_types[goods_diff][1].."/#goods_need_chk("..goods_diff..",1)",
		"I am already prepared"..goods_types[goods_diff][2].."/#goods_need_chk("..goods_diff..",2)",
		"Let me go and prepare a bit more/end_dialog")		
	end
end
--*****************************任务物品检测主函数*****************************
function goods_need_chk(goods_diff,goods_type)
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV < (getn(goods_and_prize_list)+2-goods_diff) then 
		Say("Your imperial exam title has not yet reached <color=yellow>"..tTitle[(getn(goods_and_prize_list)+2-goods_diff)][3].."<color>, so you cannot use this certificate!",0)
		return
	end
	if Zgc_pub_goods_add_chk(5,20) ~= 1 then		--空间/负重判断
		Talk(1,"","Please make sure your bag has enough carry weight and space!")
		return
	end

	if task_metiral_deal(goods_diff,1,goods_type) ~= 1 then		--物品数量检测
		return
	end
	if DelItem(2,0,goods_and_prize_list[goods_diff][1],1) ~= 1 then  --删掉证书
		Talk(1,"","Please make sure you have the corresponding certificate on you!")
		return
	end
	if task_metiral_deal(goods_diff,2,goods_type) ~= 1 then		--物品删除
		return
	end
	 
	local palyer_level = GetLevel()
	local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("Congratulations, you have obtained"..exp_num.."EXP points!")
	local ran_num = random(1,100)
	if ran_num <= goods_and_prize_list[goods_diff][5] then
		ran_prize(goods_diff,1)
	elseif ran_num <= goods_and_prize_list[goods_diff][6] then
		ran_prize(goods_diff,2)
	elseif ran_num <= goods_and_prize_list[goods_diff][7] then
		ran_prize(goods_diff,3)
	elseif ran_num <= goods_and_prize_list[goods_diff][8] then
		ran_prize(goods_diff,4)
	else
		ran_prize(goods_diff,5)
	end
end
--*******************************任务材料检测********************************
function task_metiral_deal(task_diff,deal_flag,goods_type)		--deal_flag:为1表示检测，为2表示删除
	local task_goods_need_list = {
		{  --进士证书需要的材料
			{{2,14,1,1,"Assassin Treasure Map"},{2,1,469,1,"Taixu Bagua Plate - Qian"},{2,1,470,1,"Taixu Bagua Plate - Kun"},{2,1,471,1,"Taixu Bagua Plate - Kan"},{2,1,472,1,"Taixu Bagua Plate - Dui"}}
		},
		{  --贡士证书需要的材料
			{{2,0,205,1,"Shaolin Sect Token"},{2,0,206,1,"Wudang Sect Token"},{2,0,207,1,"Emei Sect Token"},{2,0,208,1,"Beggars' Gang Sect Token"},{2,0,209,1,"Tangmen Sect Token"},{2,0,350,1,"Yangmen Sect Token"},{2,0,390,1,"Five Poisons Sect Token"},{2,2,67,10,"Iron-Thread Fine Wood"},{2,2,68,10,"Mountain Lion Fine Hide"},{2,2,66,10,"Black Mink Fine Stone"},{2,2,69,10,"Red Mink Spirit Charm"}},
		},
		{  --举人证书需要的材料
--			{{2,9,4,200,"冷虫丝"},{2,2,47,200,"山狮之皮"},{2,2,37,200,"黑钨石"},{2,2,11,200,"铁线木"},{1,2,4,200,"麝香"},{1,3,16,200,"游龙粟"}},
			{{2,9,4,222,"Cold Insect Silk"},{2,2,47,222,"Mountain Lion Hide"},{1,2,4,222,"Kui Xiang"},{1,3,16,222,"Roaming Dragon Marrow"}},
			{{2,2,11,222,"Iron Thread Wood"},{2,2,37,222,"Black Onyx Stone"},{1,2,4,222,"Kui Xiang"},{1,3,16,222,"Roaming Dragon Marrow"}},
		},
		{  --秀才证书需要的材料
--			{{2,2,55,99,"金蚕丝"},{2,10,7,99,"鸾鸟羽披"},{2,2,36,99,"天青石"},{2,2,10,99,"铁樟木"},{1,2,11,99,"穿山甲"},{1,3,15,99,"淳和麦"}},
			{{2,2,55,222,"Golden Silkworm Thread"},{2,10,7,222,"Roc Feather Cloak"},{1,2,11,222,"Pangolin Scale"},},
			{{2,2,10,222,"Iron Camphor Wood"},{2,2,36,222,"Sky-Blue Stone"},{1,3,15,222,"Chun He Wheat"}},
		},
		{  --生员证书需要的材料
--			{{2,2,54,99,"灵蛛丝"},{2,2,20,99,"熊皮"},{2,2,6,99,"玄铁"},{2,2,9,99,"重木"},{1,2,10,99,"田七"},{1,3,14,99,"延精麦"}},
			{{2,2,54,222,"Spirit Pearl Thread"},{2,2,20,222,"Bear Hide"},{1,2,10,222,"田七"},},
			{{2,2,9,222,"Heavy Wood"},{2,2,6,222,"Black Iron"},{1,3,14,222,"Yan Jing Wheat"}},
		},
	}
	local cangbaotu_num = 0;
	if deal_flag == 1 then							--检测
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --如果是该死的藏宝图
				for i = 1,117 do
					if GetItemCount(2,14,i) > 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","The \"<color=red>Assassin Treasure Map<color>\" on you is fewer than <color=red>1<color>!")
					return 0
				end
			else
				if GetItemCount(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3]) < task_goods_need_list[task_diff][goods_type][i][4] then
					Talk(1,"","The \"<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>\" on you is fewer than <color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>!")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	else
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --如果是该死的藏宝图
				for i = 1,117 do
					if DelItem(2,14,i,1) ~= 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","The \"<color=red>Assassin Treasure Map<color>\" on you is fewer than <color=red>1<color>!")
					return 0
				end				
			else
				if DelItem(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3],task_goods_need_list[task_diff][goods_type][i][4]) ~= 1 then
					Talk(1,"","The \"<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>\" on you is fewer than <color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>!")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	end	
end
--*******************************随机奖励给予*********************************
function ran_prize(goods_diff,ran_diff)
	if ran_diff == 1 then			--增加月亮兔宝箱
		local add_flag = AddItem(2,0,606,1)		
		if add_flag == 1 then
			Msg2Player("Congratulations, you have obtained a Moonlight Rabbit Iron Treasure Chest!")
			Msg2SubWorld(GetName().."You completed the imperial exam quest and obtained a \"Moonlight Rabbit Iron Treasure Chest\"!")		--test
			WriteLog(GetName().."Obtained one Moonlight Rabbit Iron Treasure Chest")
		else
			WriteLog(GetName().."Failed to add the Moonlight Rabbit treasure chest, failure code:"..add_flag)
		end
	elseif ran_diff == 2 then		--师门秘籍增加
		local book_name = {"金刚伏魔经","潜龙秘籍","无尘秘籍","Tianluo Secret Manual","Ruyi Secret Manual","Bihai Score","Chaos Secret Manual",
						"Yutian Secret Manual","Phantom Shadow Secret Manual","Gentleman Secret Manual","Garrison Secret Manual","Cloud-Piercing Secret Manual","Nether Ghost Record","Spirit Gu Secret Manual"}
		local book_seq = random(1,getn(book_name))
		local book_id = ((book_seq - 1) * 2) + 1
		local add_flag = AddItem(0,107,book_id,1)
		if add_flag == 1 then
			Msg2Player("Congratulations, you obtained \""..book_name[book_seq].."\"!")
			Msg2SubWorld("Player:"..GetName().."You completed the imperial exam quest and obtained one \""..book_name[book_seq].."\"!")	--test
		else		--test
			WriteLog("Imperial Exam Quest Activity: Player:"..GetName().."Add"..book_name[book_seq].."Failed, failure code:"..add_flag)
		end
	elseif ran_diff == 3 then		--陨铁增加
		local add_flag = AddItem(2,2,8,goods_and_prize_list[goods_diff][9])
		if add_flag == 1 then
			Msg2Player("Congratulations, you have obtained"..goods_and_prize_list[goods_diff][9].."Meteor Iron!")
		end
	elseif ran_diff == 4 then		--声望增加
		ModifyReputation(goods_and_prize_list[goods_diff][12],0)
	else							--给经验
		local palyer_level = GetLevel()
		local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("Congratulations, you have obtained"..exp_num.."EXP points!")
	end
end
--*************************************进士证书需要的诀要列表*******************************
function book_need_jue()
	Talk(1,"","<color=yellow>Aside from the rare manuals listed below, any other 5 manuals will do:<color>"..
			"<enter>    Shaolin rare manuals: Damo Sutra, Great Vajra Palm, Lion's Roar, Great Strength Vajra Finger"..
			"<enter>    Tangmen rare manuals: Sky-Filling Flower Rain, Storm Pear-Blossom Needle"..
			"<enter>    Emei rare manuals: Lotus Heart Sutra, Heart-Bewitching Fragrant Tune, Water-Covering Heart Technique"..
			"<enter>    Beggars' Gang rare manuals: Drunken Fist, Mud Eel Skill, Drunken Butterfly, Dog-Beating Staff Technique"..
			"<enter>    Wudang rare manuals: Zhiyang Sword Qi, Zhenwu Seven-Cut Sword, Sword-Controlling Art, Shaoyang Art, Shangqing Wuji Skill, Cloud-Ladder Stride"..
			"<enter>    Yangmen rare manuals: Yang Family Sea-Toppling Spear, Yang Family Horse-Taming Art, Yang Family Life-Extending Art, Yang Family Righteous-Qi Arrow"..
			"<enter>    Five Poisons rare manuals: Corpse-Gathering Evil Qi, Illusion Gu, Corpse-Reanimation Art, Demon Gu, Myriad Gu Devouring Heaven"
	)
end

function abluemoon_check_jue(deal_flag)
	local tNormalPage = {  --进士证书需要的诀要
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,32,
		33,34,35,36,37,38,39,40,41,42,44,45,47,48,49,50,51,53,54,55,56,57,58,59,60,
		61,62,63,64,65,66,68,69,71,72,73,74,75,76,77,80,81,82,84,85,86,87,89,
		90,91,92,93,94,95,96,97,98,100,102,103,104,105,106,107,109,110,111,
		113,115,116,117,118,120,121,122,123,124,125,126,127,130,131,132,133,134,
		135,136,138,139,141,142,143,144,145,146,149,150,151,152,153,154,155,156,
		157,158,159,160,161,162,163,165,168}
	local jue_count = 0;
	if deal_flag == 1 then      --检测
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				jue_count = jue_count + GetItemCount(2,6,tNormalPage[i])
			end
		end
		if jue_count ~= 5 then
			Talk(1,"","The number of manuals on you that <color=yellow>meet the requirements<color> <color=yellow>is not equal to 5<color>! Please make up the missing ones or move the extras to your warehouse first.")
			return 0
		end
		return 1
	else
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				DelItem(2,6,tNormalPage[i],GetItemCount(2,6,tNormalPage[i]))
			end
		end
		return 1
	end
end

