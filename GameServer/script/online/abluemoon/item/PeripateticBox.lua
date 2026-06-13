--逍遥盒
--authored by pengbo
tWenkui_cloth = {
	{  --标准男
		{"Wenkui Flower Brocade Robe (Purple)",259},{"Wenkui Flower Brocade Robe (Blue)",260}
	},
	{  --魁梧男
		{"Wenkui Flower Brocade Robe (Purple)",261},{"Wenkui Flower Brocade Robe (Blue)",262}
	},
	{  --性感女
		{"Wenkui Flower Brocade Garment (Red)",263},{"Wenkui Flower Brocade Garment (Pink)",264},{"Wenkui Flower Brocade Garment (Green)",265},{"Wenkui Flower Brocade Garment (Blue)",266},
		{"Wenkui Flower Brocade Garment (Yellow)",267},{"Wenkui Flower Brocade Garment (Orange)",268},{"Wenkui Flower Brocade Garment (Black)",269}
	},
	{  --娇小女
		{"Wenkui Flower Brocade Garment (Red)",270},{"Wenkui Flower Brocade Garment (Pink)",271},{"Wenkui Flower Brocade Garment (Green)",272},{"Wenkui Flower Brocade Garment (Blue)",273},
		{"Wenkui Flower Brocade Garment (Yellow)",274},{"Wenkui Flower Brocade Garment (Orange)",275},{"Wenkui Flower Brocade Garment (Black)",276}	
	},
}

tXiaoyao_cloth = {
		{  --标准男    -头,衣服,裤子
			{{"Common Brown",437},{"Graceful Green",431},{"Noble Purple",419},{"Elegant Blue",425},{"Mysterious Black",413}}, --少林
			{{"Common Brown",440},{"Graceful Green",434},{"Noble Purple",422},{"Elegant Blue",428},{"Mysterious Black",416}}, --唐门
			{{"Common Brown",439},{"Graceful Green",433},{"Noble Purple",421},{"Elegant Blue",427},{"Mysterious Black",415}}, --丐帮
			{{"Common Brown",438},{"Graceful Green",432},{"Noble Purple",420},{"Elegant Blue",426},{"Mysterious Black",414}}, --武当
			{{"Common Brown",441},{"Graceful Green",435},{"Noble Purple",423},{"Elegant Blue",429},{"Mysterious Black",417}}, --杨门
			{{"Common Brown",442},{"Graceful Green",436},{"Noble Purple",424},{"Elegant Blue",430},{"Mysterious Black",418}}, --五毒
		},
		{  --魁梧男
			{{"Common Brown",467},{"Graceful Green",461},{"Noble Purple",449},{"Elegant Blue",455},{"Mysterious Black",443}}, --少林
			{{"Common Brown",470},{"Graceful Green",464},{"Noble Purple",452},{"Elegant Blue",458},{"Mysterious Black",446}}, --唐门
			{{"Common Brown",469},{"Graceful Green",463},{"Noble Purple",451},{"Elegant Blue",457},{"Mysterious Black",445}}, --丐帮
			{{"Common Brown",468},{"Graceful Green",462},{"Noble Purple",450},{"Elegant Blue",456},{"Mysterious Black",444}}, --武当
			{{"Common Brown",471},{"Graceful Green",465},{"Noble Purple",453},{"Elegant Blue",459},{"Mysterious Black",447}}, --杨门
			{{"Common Brown",472},{"Graceful Green",466},{"Noble Purple",454},{"Elegant Blue",460},{"Mysterious Black",448}}, --五毒
		},
		{  --性感女
			{"Lotus Green",308,408,208},{"Lavender Purple",309,409,209},{"Sea-Ice Blue",310,410,210},{"Dream Pink",311,411,211},{"Rose Red",312,412,212}
		},
		{  --娇小女
		  {"Lotus Green",298,398,198},{"Lavender Purple",299,399,199},{"Sea-Ice Blue",300,400,200},{"Dream Pink",301,401,201},{"Rose Red",302,402,202}
		}
}

function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
			Say("<color = green>Xiaoyao<color>: Hero, which outfit would you like? Please choose freely:",3,
			"I want the Wenkui Flower Brocade Robe/give_wenkui",
			"I want the Xiaoyao outfit/give_xiaoyao",
			"Let me think about it again/leave"
					)
	else
		Say("<color = green>Xiaoyao<color>: Hero, which outfit would you like? Please choose freely:",2,
				"I want the Xiaoyao Garment/give_xiaoyao",
				"Let me think about it again/leave"
				)
	end
end

function give_xiaoyao()
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local tSay = {}
	local choice = 0
	if player_route < 5 then
		choice = 1
	elseif player_route < 7 then
		choice = 2
	elseif player_route < 13 then
		choice = 3
	elseif player_route < 16 then
		choice = 4
	elseif player_route < 19 then
		choice = 5
	else
		choice = 6
	end
	if player_sex < 3 then
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][1][i][1].."/#xy_give_cloth("..tXiaoyao_cloth[player_sex][choice][i][2]..")")
		end
		tinsert(tSay,"Let me think about it again/end_say")
		Say("<color=green>Xiaoyao Box<color>: Hero, which exam outfit would you like? Please choose freely:",getn(tSay),tSay)
	else 
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][i][1].."/#xy_give_cloth1("..tXiaoyao_cloth[player_sex][i][2]..")")
		end
		tinsert(tSay,"Let me think about it again/end_say")
		Say("<color=green>Xiaoyao Box<color>: Hero, which exam outfit would you like? Please choose freely:",getn(tSay),tSay)
	end
end

function xy_give_cloth(nIndex)
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
		Say("<color=green>Xiaoyao Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex,1)
end

function xy_give_cloth1(nIndex)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>Xiaoyao Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex+100,1)
	AddItem(0,110,nIndex+200,1)
end

function end_say()
	return OnUse()
end

function leave()

end