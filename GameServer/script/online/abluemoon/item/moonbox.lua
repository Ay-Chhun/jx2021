--月亮盒
--authored by pengbo
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

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

tLinglong = {  -- 头,衣服,裤子
		{{207,213}, {281,287}, {281,287}, "Linglong Garment (Red)"},  --红
		{{208,214}, {282,288}, {282,288}, "Linglong Garment (Yellow)"},  --黄
		{{209,215}, {283,289}, {283,289}, "Linglong Garment (Pink)"},  --粉
		{{210,216}, {284,290}, {284,290}, "Linglong Garment (Purple)"},  --紫
		{{211,217}, {285,291}, {285,291}, "Linglong Garment (Blue)"},  --蓝
		{{212,218}, {286,292}, {286,292}, "Linglong Garment (Green)"},  --绿
}

tXiaoyao_cloth = {
		{  --标准男    -头,衣服,裤子
			{{"Common Brown",437},{"Graceful Green",431},{"Noble Purple",419},{"Elegant Blue",425},{"Mysterious Black",413}}, --少林
			{{"Common Brown",438},{"Graceful Green",432},{"Noble Purple",420},{"Elegant Blue",426},{"Mysterious Black",414}}, --唐门
			{{"Common Brown",439},{"Graceful Green",433},{"Noble Purple",421},{"Elegant Blue",427},{"Mysterious Black",415}}, --丐帮
			{{"Common Brown",440},{"Graceful Green",434},{"Noble Purple",422},{"Elegant Blue",428},{"Mysterious Black",416}}, --武当
			{{"Common Brown",441},{"Graceful Green",435},{"Noble Purple",423},{"Elegant Blue",429},{"Mysterious Black",417}}, --杨门
			{{"Common Brown",442},{"Graceful Green",436},{"Noble Purple",424},{"Elegant Blue",430},{"Mysterious Black",418}}, --五毒
		},
		{  --魁梧男
			{{"Common Brown",467},{"Graceful Green",461},{"Noble Purple",449},{"Elegant Blue",455},{"Mysterious Black",443}}, --少林
			{{"Common Brown",468},{"Graceful Green",462},{"Noble Purple",450},{"Elegant Blue",456},{"Mysterious Black",444}}, --唐门
			{{"Common Brown",469},{"Graceful Green",463},{"Noble Purple",451},{"Elegant Blue",457},{"Mysterious Black",445}}, --丐帮
			{{"Common Brown",470},{"Graceful Green",464},{"Noble Purple",452},{"Elegant Blue",458},{"Mysterious Black",446}}, --武当
			{{"Common Brown",471},{"Graceful Green",465},{"Noble Purple",453},{"Elegant Blue",459},{"Mysterious Black",447}}, --杨门
			{{"Common Brown",472},{"Graceful Green",466},{"Noble Purple",454},{"Elegant Blue",460},{"Mysterious Black",448}}, --五毒
		},
		{  --性感女
			{"Lotus Green",408,408,208},{"Lavender Purple",409,409,209},{"Sea-Ice Blue",410,410,210},{"Dream Pink",411,411,211},{"Rose Red",412,412,212}
		},
		{  --娇小女
		  {"Lotus Green",398,398,198},{"Lavender Purple",399,399,199},{"Sea-Ice Blue",400,400,200},{"Dream Pink",401,401,201},{"Rose Red",402,402,202}
		}
}

tLinglongPart = {{108,"Linglong Headdress"},{109,"Linglong Outfit"},{110,"Linglong Bottoms"}}

tRose_headwear = {
		{{117,120},"Red Rose"},
		{{118,121},"Pink Rose"},
		{{119,122},"Yellow Rose"},
		{{203,205},"Blue Rose"},
		{{204,206},"Purple Rose"}
		} --编号
		
function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
		Say("Male characters cannot use the Moonlight Box!",0)
		return
	else
		Say("<color=green>Moonlight Box<color>: Hero, which outfit would you like? Please choose freely:",5,
				"I want the Wenkui Flower Brocade Garment/give_wenkui",
				"I want the Xiaoyao Garment/give_xiaoyao",
				"I want the Linglong Garment/give_linglong",
				"I want the Rose Headwear/give_rose_headwear",
				"Let me think about it again/leave"
				)
	end
end

function give_wenkui()
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tWenkui_cloth[player_sex]) do
		tinsert(tSay,tWenkui_cloth[player_sex][i][1].."/#wk_give_cloth("..tWenkui_cloth[player_sex][i][2]..")")
	end
	tinsert(tSay,"Let me think about it again/end_say")
	Say("<color=green>Moonlight Box<color>: Hero, which exam outfit would you like? Please choose freely:",getn(tSay),tSay)
end

function give_linglong()
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..")")
	end
	tinsert(tSay,"Let me think about it again/end_say")
	Say("<color=green>Moonlight Box<color>: Hero, which Linglong Garment would you like? Please choose freely:",getn(tSay),tSay)
end

function give_rose_headwear()
	local player_sex = GetBody()
	local sex = player_sex-2
	local tSay = {}
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("<color=green>Moonlight Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	for i = 1,getn(tRose_headwear) do
		tinsert(tSay,tRose_headwear[i][2].."/#rh_give_cloth("..tRose_headwear[i][1][sex]..")")
	end
	tinsert(tSay,"Let me think about it again/end_say")
	Say("<color=green>Moonlight Box<color>: Hero, which Rose Headwear would you like? Please choose freely:",getn(tSay),tSay)
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
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
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
	AddItem(0,109,nIndex,1)
	AddItem(0,110,nIndex-200,1)
end
	
function rh_give_cloth(nIndex)
  if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Say("<color=green>Moonlight Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	AddItem(0,108,nIndex,1)
	Msg2Player("You have received"..tRose_headwear[i][2])
end

function wk_give_cloth(nDetail)
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>Moonlight Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	AddItem(0,109,nDetail,1)
end

function ll_give_cloth(nDetail)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("<color=green>Moonlight Box<color>: Your inventory is full. Please tidy it up and come back!",0)
		return
	end
	local nBody = GetBody()
	for i = 1,3 do
		AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
	end
end

function end_say()
	return OnUse()
end

function leave()

end