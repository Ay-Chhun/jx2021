--剑侠情缘盒
--authored by pengbo
--==========================================任务变量===========================================
ABLUEMOON_KEEP_XOYO = 638; --剑侠情缘盒是否存入了逍遥盒
ABLUEMOON_KEEP_MOON = 639; --剑侠情缘盒是否存入了月亮盒
EASTER_EGG = 819  --彩蛋记录，
CELECLOTH_ALREADY = 802  --记录是否存入剑网2两周年庆外装
NEWYEARCLOTH_ALREADY = 803 --记录是否存入2007年新年装
MATCHERCLOTH_ALREADY = 804 --记录是否存入主婚人外装
CHAOHUA_ALREADY = 816 --记录是否存入朝华外装,1代表存入朝华装，0代表没存入
XINYUAN_ALREADY = 817 --记录是否存入新元外装,1代表存入新元装，0代表没存入
XIANYU_ALREADY = 818 --记录是否存入纤羽外装,1代表存入纤羽装，0代表没存入
PAPACLOTH_ALREADY = 820 --记录是否存入趴趴客栈外装,1代表存入,0代表没有存入

tTask = {803,804,816,817,818,820}

--2005年圣诞装
tXmas = {     --头,上衣,裤子
          --标准男
					{{108,109},{109,109},{110,73}},
					--魁梧男
					{{108,110},{109,110},{110,74}},
					--性感女
					{{108,112},{109,112},{110,76}},
					--娇小女
					{{108,111},{109,111},{110,75}}
				}

--2007年元旦装
tYuandan7 = {     --头,上衣,裤子
          --标准男
					{{108,139},{109,185},{110,81}},
					--魁梧男
					{{108,140},{109,186},{110,82}},
					--性感女
					{{108,141},{109,187},{110,83}},
					--娇小女
					{{108,142},{109,188},{110,84}}
				}

--2007年新年装
tNewyear7 = {     --头,上衣,裤子
          --标准男
					{{108,195},{109,255},{110,85}},
					--魁梧男
					{{108,196},{109,256},{110,86}},
					--性感女
					{{108,197},{109,257},{110,87}},
					--娇小女
					{{108,198},{109,258},{110,88}}
				}

--剑网2两周年庆外装				
tCele2cloth = {     --头,上衣,裤子
          --标准男
					{{108,135},{109,181},{110,77}},
					--魁梧男
					{{108,136},{109,182},{110,78}},
					--性感女
					{{108,137},{109,183},{110,79}},
					--娇小女
					{{108,138},{109,184},{110,80}}
				}
				
--2006年新年装				
tNewyear6 = {     --一套
          --标准男
					{109,113},
					--魁梧男
					{109,114},
					--性感女
					{109,116},
					--娇小女
					{109,115}
				}
				
--主婚人外装
tMatchercloth = {    --一套
          --标准男
					{109,241},
					--魁梧男
					{109,242},
					--性感女
					{109,243},
					--娇小女
					{109,244}
				}

--新元外装
tXinyuan = {     --一套
					--标准男
					{109,495},
					--魁梧男
					{109,496},
					--性感女
					{109,497},
					--娇小女
					{109,498}
				}
				
--朝华外装
tChaohua = {		--一套
					--标准男	
					{109,499},
					--魁梧男
					{109,500},
					--性感女
					{109,501},
					--娇小女
					{109,502}		
				}
				
--纤羽外装
tXianyu = {				--男一套，女三件
					--标准男	
					{109,505},
					--魁梧男
					{109,506},
					--性感女
					{{108,485},{109,503},{110,225}},
					--娇小女
					{{108,486},{109,504},{110,226}}
				}

--趴趴外装
tPapaCloth = {
				--标准男
				{{108,510},{109,510},{110,510}},
				--魁梧男
				{{108,511},{109,511},{110,511}},
				--性感女
				{{108,513},{109,513},{110,513}},
				--较小女
				{{108,512},{109,512},{110,512}}
			}
				

tAllcloth = {{tNewyear7,"2007 New Year Costume"},{tMatchercloth,"Wedding Officiant Costume"}}		

tAlreadyput = {{"I want to store the 2007 New Year Costume/#PutClothInBox(1)","I want to take out the 2007 New Year Costume"},
							 {"I want to store the Wedding Officiant Costume/#PutClothInBox(2)","I want to take out the Wedding Officiant Costume"},
							 {"I want to store the Chaohua Costume/#PutClothInBox(3)","I want to take out the Chaohua Costume"},
							 {"I want to store the Xinyuan Costume/#PutClothInBox(4)","I want to take out the Xinyuan Costume"},
							 {"I want to store the Xianyu Costume/#PutClothInBox(5)","I want to take out the Xianyu Costume"},
							 {"I want to store the Panda Inn outfit/#PutClothInBox(6)","I want to take out the Panda Inn outfit"}
							}

tRouteCloth = {--少林 武当 峨嵋 丐帮 唐门 杨门 五毒
	{{0,108,73,0,109,73},{0,108,77,0,109,77}},
	{{0,108,74,0,109,74},{0,108,78,0,109,78},{0,108,82,0,109,82},{0,108,86,0,109,86}},
	{{},{},{0,108,81,0,109,81},{0,108,85,0,109,85}},--峨嵋 前两个为空
	{{0,108,75,0,109,75},{0,108,79,0,109,79},{0,108,83,0,109,83},{0,108,87,0,109,87}},
	{{0,108,76,0,109,76},{0,108,80,0,109,80},{0,108,84,0,109,84},{0,108,88,0,109,88}},
	{{0,108,105,0,109,105},{0,108,106,0,109,106},{0,108,107,0,109,107},{0,108,108,0,109,108}},
	{{0,108,123,0,109,125},{0,108,124,0,109,126},{0,108,125,0,109,127},{0,108,126,0,109,128}}
	}

		
function OnUse()
	local easter_egg = GetTask(EASTER_EGG)
	if easter_egg == 1 or easter_egg == 0 then 
		Talk(1,"main","<color=green>Swordsman Romance Box<color>: Still worried about having nowhere to put the Panda Inn outfit in your bag? Now you can store it inside the box! Store any one piece and you can claim a full set!")
    SetTask(EASTER_EGG,2)	
	else return main()
	end
end

function main()
	local tSay = {
		"I want to claim the outfit gifted by the Swordsman Romance Box/GetDefaultCloth",
		"I want to claim a stored costume/GetOutCloth",
		"I want to store the Carefree Box or the Moonlight Box/get_two_box",
		"I want to claim the sect outfit/get_route_cloth",
		"I want to learn what the Swordsman Affinity Box is for/AboutBox",
		"Close the Swordsman Romance Box/Leave"
	}
	local cloth_put = 0
	local insert_flag = 0
	for i = 1,6 do 
		cloth_put = GetTask(tTask[i])
		if cloth_put == 0 then
			insert_flag = insert_flag + 1
		end
	end
	if insert_flag > 0 then 
		tinsert(tSay,2,"I want to store my own costume into the Swordsman Affinity Box/PutInBox")
	end
	Say("<color=green>Swordsman Affinity Box<color>: Hero, what help do you need?",getn(tSay),tSay);
end

function GetDefaultCloth()
  local sSay = {
  			"I want the 2005 Christmas Costume set/GiveXmas",
  			"I want the 2006 New Year Costume/#GiveNewyear(1)",
  			"I want the 2007 New Year's Day Costume/#GiveNewyear(2)",
  			"Let me think about it again/end_say"
  			}
  Say("<color=green>Swordsman Affinity Box<color>: Which costume set do you want, hero? Please pick freely:",getn(sSay),sSay)
 end

function GiveXmas()
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("Your inventory space is not enough, please tidy it up and come back to claim it!",0)
	return
  end
  for i=1,3 do
  	AddItem(0,tXmas[player_sex][i][1],tXmas[player_sex][i][2],1)
  end
end
	
function GiveNewyear(nYear)
	local player_sex = GetBody()
  if nYear == 1 then
  	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
  		Say("<color=green>Swordsman Affinity Box<color>: Your inventory space is not enough, please tidy it up and come back to claim it!",0)
  		return
  	end
  	AddItem(0,tNewyear6[player_sex][1],tNewyear6[player_sex][2],1)
  elseif nYear == 2 then
  	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
			Say("<color=green>Swordsman Affinity Box<color>: Your inventory space is not enough, please tidy it up and come back to claim it!",0)
			return
  	end
  	for i =1,3 do
  		AddItem(0,tYuandan7[player_sex][i][1],tYuandan7[player_sex][i][2],1)
    end
  end
end

function end_say()
  return main()
end

function PutInBox()
	local player_sex = GetBody()
	local putAlready = 0
	local tSay = {}
	for i = 1,6 do
		putAlready = GetTask(tTask[i])
		if putAlready == 0 then
			tinsert(tSay,tAlreadyput[i][1])
		end
	end
	tinsert(tSay,"I don't want to store any costume/end_say")
	Say("<color=green>Swordsman Affinity Box<color>: Which costumes do you want to store, hero?",getn(tSay),tSay)
end

function PutClothInBox(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if nIndex < 2 then
		if GetItemCount(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2]) > 0 then
			DelItem(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2],1)
			Msg2Player("You have already"..tAllcloth[nIndex][2].."stored it in the Swordsman Affinity Box!")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2],1)
    	Msg2Player("You have already"..tAllcloth[nIndex][2].."stored it in the Swordsman Affinity Box!")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2],1)
    	Msg2Player("You have already"..tAllcloth[nIndex][2].."stored it in the Swordsman Affinity Box!")
    	SetTask(tTask[nIndex],1)	
    else
    	Say("<color=green>Swordsman Romance Box<color>: Your bag does not have"..tAllcloth[nIndex][2].."any of these pieces. Please check and then store them in the treasure box!",0)
    end
	elseif nIndex == 2 then
			if DelItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1) ~= 1 then
				Say("<color=green>Swordsman Affinity Box<color>: You do not have a Wedding Officiant Costume set in your inventory, please check and then store it in the treasure box!",0)
		  else 
		  	Msg2Player("You have already stored the Wedding Officiant Costume in the Swordsman Affinity Box!")
				SetTask(MATCHERCLOTH_ALREADY,1)
		  end
	elseif nIndex == 3 then
			if DelItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1) ~= 1 then
				 Say("<color=green>Swordsman Romance Box<color>: Your bag does not have a full set of the Chaohua outfit. Please check and then store it in the treasure box!",0)
			else 
		  	Msg2Player("You have already stored the Chaohua outfit in the Swordsman Romance Box!")
		  	SetTask(CHAOHUA_ALREADY,1)
		  end
	elseif nIndex == 4 then
			if DelItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1) ~= 1 then
				 Say("<color=green>Swordsman Romance Box<color>: Your bag does not have a full set of the Xinyuan outfit. Please check and then store it in the treasure box!",0)
			else 
		  	Msg2Player("You have already stored the Xinyuan outfit in the Swordsman Romance Box!")
		  	SetTask(XINYUAN_ALREADY,1)
		  end
	elseif nIndex == 5 then
			if player_sex < 3 then
				 if DelItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1) ~= 1 then
				 		Say("<color=green>Swordsman Romance Box<color>: Your bag does not have a full set of the Xianyu outfit. Please check and then store it in the treasure box!",0)
				 else 
				 		Msg2Player("You have already stored the Xianyu outfit in the Swordsman Romance Box!")
		  			SetTask(XIANYU_ALREADY,1)
		  	 end
		  else
		  		if GetItemCount(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2],1)
		  			 Msg2Player("You have already stored the Xianyu outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2],1)
		  			 Msg2Player("You have already stored the Xianyu outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2],1)
		  			 Msg2Player("You have already stored the Xianyu outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    			else
				 		Say("<color=green>Swordsman Romance Box<color>: Your bag does not have any piece of the Xianyu outfit. Please check and then store it in the treasure box!",0)    				
    			end
    	end
	elseif nIndex == 6 then
			if GetItemCount(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2],1)
		  			 Msg2Player("You have already stored the Panda Inn outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2],1)
		  			 Msg2Player("You have already stored the Panda Inn outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2],1)
		  			 Msg2Player("You have already stored the Panda Inn outfit in the Swordsman Romance Box!")
    				 SetTask(tTask[nIndex],1)
    		else
				 		Say("<color=green>Swordsman Romance Box<color>: Your bag does not have any piece of the Panda Inn outfit. Please check and then store it in the treasure box!",0)    				
    		end
	end
end
		
function GetOutCloth()
	local player_sex = GetBody()
	local tSay = {}
	local i1 = GetTask(CELECLOTH_ALREADY)
	local i2 = GetTask(NEWYEARCLOTH_ALREADY)
	local i3 = GetTask(MATCHERCLOTH_ALREADY)
	local i4 = GetTask(CHAOHUA_ALREADY)
	local i5 = GetTask(XINYUAN_ALREADY)
	local i6 = GetTask(XIANYU_ALREADY)
	local i7 = GetTask(PAPACLOTH_ALREADY)
	if i1 == 1 then
			tinsert(tSay,"I want to take out the JX2 Two-Year Anniversary Costume/#GetCloth(1)")
	end
	if i2 == 1 then
		 tinsert(tSay,"I want to take out the 2007 New Year Costume/#GetCloth(2)")
	end
	if i3 == 1 then
		 tinsert(tSay,"I want to take out the Wedding Officiant Costume/#GetCloth1(1)")
	end
	if i4 == 1 then
		 tinsert(tSay,"I want to take out the Chaohua outfit/#GetCloth1(2)")
	end
	if i5 == 1 then
		 tinsert(tSay,"I want to take out the Xinyuan outfit/#GetCloth1(3)")
	end
	if i6 == 1 then
		 tinsert(tSay,"I want to take out the Xianyu outfit/#GetCloth(3)")
	end
	if i7 == 1 then
		tinsert(tSay,"I want to take out the Panda Inn outfit/#GetCloth(4)")
	end
	if i1 == 0 and i2 == 0 and i3 == 0 and i4 == 0 and i5 == 0 and i6 == 0 and i7 == 0 then 
		Say("<color=green>Swordsman Affinity Box<color>: You have not stored any costume yet; you can only claim costumes after storing them!",0)
	else
		tinsert(tSay,"I don't want to take out any costume/end_say")
		Say("<color=green>Swordsman Affinity Box<color>: Which costume do you want to take out, hero?",getn(tSay),tSay)
	end
end

function GetCloth(nIndex)
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("Your inventory space is already full, please tidy it up first and then come back!",0)
    return	
	end
	if nIndex == 1 then
		for i =1,3 do
			AddItem(0,tCele2cloth[player_sex][i][1],tCele2cloth[player_sex][i][2],1)
		end
	elseif nIndex ==2 then
		for i =1,3 do
			AddItem(0,tNewyear7[player_sex][i][1],tNewyear7[player_sex][i][2],1)
		end
	elseif nIndex == 3 then
		if player_sex < 3 then
			AddItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1)
		else
			for i =1,3 do
				AddItem(0,tXianyu[player_sex][i][1],tXianyu[player_sex][i][2],1)
			end
		end
	elseif nIndex == 4 then 
		for i = 1,3 do 
			AddItem(0,tPapaCloth[player_sex][i][1],tPapaCloth[player_sex][i][2],1)
		end
	end
end

function GetCloth1(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("Your inventory space is already full, please tidy it up first and then come back!",0)
    return	
	end
	if nIndex == 1 then 
		AddItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1)
	end
	if nIndex == 2 then
		AddItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1)
	end
	if nIndex == 3 then
		AddItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1)
	end
end
		

function AboutBox()
	Say("<color=green>Swordsman Romance Box<color>: Opening this treasure box lets you obtain the Christmas outfit, New Year's Day outfit, and New Year outfit for free. At the same time, you can also store in the box any piece matching your body type from the 2007 New Year outfit and the Swordsman Online 2 second-anniversary outfit, as well as the host wedding outfit, the Chaohua, Xinyuan, and Xianyu outfits, the Moonlight Box, and the Carefree Box. Once stored, you can obtain these stored items for free!",
		1,
		"I understand/end_say")
end

function Leave()

end

function get_two_box()
	local strtab = {
		"I want to store the Carefree Box/#get_xoyo_box(1)",
		"I want to take out the Carefree Box/#get_xoyo_box(2)",
		"I want to store the Moonlight Box/#get_xoyo_box(3)",
		"I want to take out the Moonlight Box/#get_xoyo_box(4)",
		"返回/main",
		"Never mind/Leave"	
		}
	Say("<color=green>Swordsman Romance Box<color>: Great hero, I can now store the Carefree Box and the Moonlight Box as well, so much more convenient.",
		getn(strtab),
		strtab)	
end

function get_xoyo_box(nType)
	if nType < 1 or nType > 4 then
		return 
	end
	if nType == 2 or nType == 4 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: Your bag is already full. Tidy it up first and then come back!")
	    return	
		end	
	end
	if nType == 1 then
		if GetItemCount(2,1,1168) < 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: You do not have a Carefree Box on you.");
			return
		else
			if DelItem(2,1,1168,1) == 1 then
				SetTask(ABLUEMOON_KEEP_XOYO,1);
				Talk(1,"","<color=green>Swordsman Romance Box<color>: Your Carefree Box has been stored. You can take it out through the Swordsman Romance Box at any time.");
				return
			end
		end
	elseif nType == 2 then
		if GetTask(ABLUEMOON_KEEP_XOYO) ~= 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: You do not have a Carefree Box stored with me.");
			return
		end
		if BigGetItemCount(2,1,1168) >= 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: Don't you already have a Carefree Box?");
			return
		else			
			if AddItem(2,1,1168,1) == 1 then
				Talk(1,"","<color=green>Swordsman Romance Box<color>: Your Carefree Box has been taken out. You can store it through the Swordsman Romance Box at any time.");
				return
			end	
		end
	elseif nType == 3 then
		if GetItemCount(2,1,1169) < 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: You do not have a Moonlight Box on you.");
			return
		else
			if DelItem(2,1,1169,1) == 1 then
				SetTask(ABLUEMOON_KEEP_MOON,1);
				Talk(1,"","<color=green>Swordsman Romance Box<color>: Your Moonlight Box has been stored. You can take it out through the Swordsman Romance Box at any time.");
				return
			end
		end		
	elseif nType == 4 then
		if GetTask(ABLUEMOON_KEEP_MOON) ~= 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: You do not have a Moonlight Box stored with me.");
			return
		end		
		if BigGetItemCount(2,1,1169) >= 1 then
			Talk(1,"","<color=green>Swordsman Romance Box<color>: Don't you already have a Moonlight Box?");
			return
		else			
			if AddItem(2,1,1169,1) == 1 then
				Talk(1,"","<color=green>Swordsman Romance Box<color>: Your Moonlight Box has been taken out. You can store it through the Swordsman Romance Box at any time.");
				return
			end	
		end 
	end			
end 

function get_route_cloth()
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if nFaction == 0 then
		Talk(1,"","<color=green>Swordsman Romance Box<color>: You have not joined a sect yet.");
		return
	end
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
		Talk(1,"","<color=green>Swordsman Romance Box<color>: Your bag is already full. Tidy it up first and then come back!")
	   return	
	end	 
	if BigGetItemCount(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3]) >= 1 and BigGetItemCount(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6]) >= 1 then
		Talk(1,"","<color=green>Swordsman Romance Box<color>: Don't you already have a set? Come back for another when it wears out.");
		return
	else 
		if AddItem(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3],1) == 1 and AddItem(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6],1) == 1 then
			Msg2Player("You have obtained one set of the sect outfit");
		end
	end
end