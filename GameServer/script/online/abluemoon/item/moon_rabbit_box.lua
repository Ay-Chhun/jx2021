--脚本名称：“月亮兔铁宝箱”使用脚本
--脚本功能：使用“月亮兔铁宝箱”的奖励增加
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--============================公共变量定义区============================
	moon_rabbit_box_prize_list = {
	--奖励概率--奖励类型--奖励函数
	{353,2,"jue_bag_add()"},						--诀要包
	--{200,2,"2个试炼果子",2,0,392},				--个试炼果子 IB版没有！！！
	{250,2,"shimen_book()"},					--师门秘籍
	{100,1,"1 Five Elements Secret Manual",0,107,155},				--五行秘籍
	{60,2,"labor_head_add()"},					--五一头
	{60,2,"labor_trouers_add()"},				--五一裤子
	{60,2,"labor_weapon_add()"},					--五一武器
	{40,1,"1 General's Ring",0,102,21},					--将军戒
	{20,1,"1 Hulei Hammer",0,105,12},					--忽雷驳
	{20,1,"1 Moon Rabbit Medicine Pack",0,102,41},				--月亮兔药包				
	{15,1,"1 Quyuan Jade Pendant",0,102,27},				--屈原玉佩
	{5,1,"1 Bujing",0,105,13},					--布景
	{5,1,"1 Mighty Spirit Necklace",0,102,28},				--大力神
	{4,1,"1 Chang'e Moon Dance Sash",0,102,42},				--嫦娥舞带
	{4,1,"1 Eastern Dragon Pearl",0,102,24},				--东方龙珠
	{4,1,"1 Houyi Setting Sun Ring",0,102,43}				--后羿落日环
	}
--=============================脚本主逻辑区=============================


function OnUse(goods_index)
	Say("Are you sure you want to use the \"Moon Rabbit Iron Treasure Chest\"? Opening this treasure chest will give you one of the following rare treasures: Sect Secret Pack, Master's Secret Manual, Five Elements Secret Manual, 2006 May Day Labor Festival Hat/Pants/Weapon, General's Ring, Hulei Hammer, Moon Rabbit Medicine Pack, Quyuan Jade Pendant, Bujing, Mighty Spirit Necklace, Chang'e Moon Dance Sash, Eastern Dragon Pearl, Houyi Setting Sun Ring. Good luck!!",
	3,
	"I confirm I want to use it/moon_rabbit_box_use",
	"I want to see the appearance rate of each treasure/show_all",
	"Let me think it over again/end_dialog")
end


--****************************箱子确认使用函数**************************
function moon_rabbit_box_use()
	if Zgc_pub_goods_add_chk(1,300) ~= 1 then		--空间/负重判断
		Talk(1,"","Please make sure your bag has enough carry weight and space!")
		return
	end
	if GetItemCount(2,0,606) == 0 then					--物品判断
		Talk(1,"","Please confirm your inventory has a <color=red>Moon Rabbit Iron Treasure Chest<color>!")
		return
	end
	if DelItem(2,0,606,1) ~= 1 then					--删除物品判断
		Talk(1,"","Please confirm your inventory has a <color=red>Moon Rabbit Iron Treasure Chest<color>!")
		return
	end
	local num_count = 0
	for i = 1,getn(moon_rabbit_box_prize_list) do
		num_count = num_count + moon_rabbit_box_prize_list[i][1]
	end
	local ran_num = random(1,num_count)
	for i = 1 ,getn(moon_rabbit_box_prize_list) do
		if ran_num <= moon_rabbit_box_prize_list[i][1] then
			if getn(moon_rabbit_box_prize_list[i]) > 3 then
				local add_flag = AddItem(moon_rabbit_box_prize_list[i][4],moon_rabbit_box_prize_list[i][5],moon_rabbit_box_prize_list[i][6],moon_rabbit_box_prize_list[i][2],1,-1,-1,-1,-1,-1,-1)
				if add_flag == 1 then
					Msg2Player("Congratulations, you have obtained"..moon_rabbit_box_prize_list[i][3].."!")
					Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained"..moon_rabbit_box_prize_list[i][3].."!")
					WriteLog("[abluemoon]"..GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained"..moon_rabbit_box_prize_list[i][3].."!")
				else
					WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest used: player["..GetName().."]used the Moon Rabbit Iron Treasure Chest and obtained"..moon_rabbit_box_prize_list[i][3].."Failed! Failure marker:"..add_flag)
				end	
				break
			else
				dostring(moon_rabbit_box_prize_list[i][3])
				break
			end
		else
			ran_num = ran_num - moon_rabbit_box_prize_list[i][1]
		end
	end
end
--*******************************诀要包增加********************************
function jue_bag_add()
	local jue_id = {{607,"Shaolin Secret Pack"},
					{608,"Tangmen Secret Pack"},
					{609,"Emei Secret Pack"},
					{610,"Gaibang Secret Pack"},
					{611,"Wudang Secret Pack"},
					{612,"Yangmen Secret Pack"},
					{613,"Wudu Secret Pack"}}
	local bag_diff = random(1,getn(jue_id))
	local add_flag = AddItem(2,0,jue_id[bag_diff][1],1)
	if add_flag == 1 then
		Msg2Player("Congratulations, you obtained a"..jue_id[bag_diff][2].."!")
		Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a"..jue_id[bag_diff][2].."!")
		WriteLog("[abluemoon]"..GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a"..jue_id[bag_diff][2].."!")		
	else
		WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest used: player["..GetName().."]used the Moon Rabbit Iron Treasure Chest and obtained"..jue_id[bag_diff][2].."Failed! Failure marker:"..add_flag)
	end	

end
--*****************************五一头增加*********************************
function labor_head_add()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72}
		}
	local nRandomNum = random(1,getn(HatTab))
	local add_flag = AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1)
	if add_flag  == 1 then
		Msg2Player("Congratulations, you obtained a May Day Hat!")
		Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a May Day Hat!")
		WriteLog("[abluemoon]"..GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained an item numbered 0,103,"..HatTab[nRandomNum][3].."May Day Hat!")
	else
		WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest used: player["..GetName().."]used the Moon Rabbit Iron Treasure Chest but failed to obtain the May Day Hat! Failure marker:"..add_flag)
	end
end
--****************************五一裤子增加*******************************
function labor_trouers_add()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		}
	local nRandomNum = random(1,getn(TrousersTab))
	local add_flag = AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1)
	if add_flag  == 1 then
		Msg2Player("Congratulations, you obtained a pair of May Day Pants!")
		Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a pair of May Day Pants!")	
		WriteLog("[abluemoon]"..GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained an item numbered 0,101,"..TrousersTab[nRandomNum][3].."May Day Pants!")
	else
		WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest used: player["..GetName().."]used the Moon Rabbit Iron Treasure Chest but failed to obtain the May Day Pants! Failure marker:"..add_flag)
	end
end
--****************************五一武器增加*******************************
function labor_weapon_add()
	local WeaponTab = {
		{0,0,13},	--1手
		{0,2,26},	--2剑
		{0,5,39},	--3棍
		{0,1,52},	--4暗器
		{0,3,63},	--5单刀
		{0,10,74},	--6琴
		{0,9,85},	--7笔
		{0,8,96},	--8杖
		{0,6,107},	--9枪
		{0,4,118},	--10弓
		{0,11,11},	--11爪
		{0,7,11},	--12双刀
		}
	local nRandomNum = random(1,getn(WeaponTab))
	
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131	--棍,暗器,单刀,笔,枪,弓,双刀
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--剑,琴,杖,爪
	else	--手
		nAttribute = random(131,132)
	end

	local add_flag = AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251)

	if add_flag  == 1 then
		Msg2Player("Congratulations, you obtained a weapon!")
		Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a May Day weapon!")	
		WriteLog("[abluemoon]"..GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained an item numbered"..WeaponTab[nRandomNum][1]..","..WeaponTab[nRandomNum][2]..","..WeaponTab[nRandomNum][3].."May Day Weapon!")
	else
		WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest used: player["..GetName().."]used the Moon Rabbit Iron Treasure Chest but failed to obtain the May Day Weapon! Failure marker:"..add_flag)
	end
end
--***************************师门秘籍增加*********************************
function shimen_book()
	local book_name = {"金刚伏魔经","潜龙秘籍","无尘秘籍","Tianluo Secret Manual","Ruyi Secret Manual","Bihai Score","Chaos Secret Manual",
					"Yutian Secret Manual","Phantom Shadow Secret Manual","Gentleman Secret Manual","Garrison Secret Manual","Cloud-Piercing Secret Manual","Nether Ghost Record","Spirit Gu Secret Manual"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Congratulations, you obtained \""..book_name[book_seq].."\"!")
		Msg2SubWorld(GetName().."Using the Moon Rabbit Iron Treasure Chest you obtained a \""..book_name[book_seq].."\"!")	
		WriteLog("[abluemoon]".."Using the Moon Rabbit Iron Treasure Chest you obtained a \""..book_name[book_seq].."\"!")
	else		--test
		WriteLog("[abluemoon]Moon Rabbit Iron Treasure Chest usage. Player:"..GetName().."Add"..book_name[book_seq].."Failed, failure code:"..add_flag)
	end
end

--***************************显示每个宝物的出现概率*************************
function show_all()
	Talk(1,"",
	"The treasure drop rates from the Moon Rabbit Iron Treasure Chest are as follows:"..
	"<enter>  Manual Pack            35.3%"..
	"<enter>  Sect Manual          25%"..
	"<enter>  Five Elements Manual          10%"..
	"<enter>  May Day Equipment          18%"..
	"<enter>  Rare Top-Grade Item          11.7%"
	)
end
