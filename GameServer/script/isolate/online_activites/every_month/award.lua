--ªÓ∂ØΩ±¿¯‘⁄’‚¿Ô

Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Include("\\script\\isolate\\online_activites\\base\\activity_award_base.lua")

T_FinalAward = {
	room_weight = {1,100},
	--name, room,content,award
	["exp2g"] = {"Kinh nghi÷m",1, {
			{"Exp", -3, 0, 0, 2000000000},
		}},
	["finish_pet_task"] = {"Hoµn thµnh nhi÷m vÙ phÙc sinh ÆÂng hµnh", 1, {
		{"Hoµn thµnh nhi÷m vÙ phÙc sinh ÆÂng hµnh", act_finish_pet_task, {}, 0, 0},
		}},
	["exp1g_yuntielinshi"] = {"EXP + M∂nh MÀt Tﬁch", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"M∂nh MÀt Tﬁch", 2, 1, 30669, 500, 4, 0},
		}},
	["exp1g_zhenqi"] = {"EXP + Ch©n kh›", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"Ch©n kh›", -4, 0, 0, 50000},
		}},
	["exp1g_shengwang10k_shimen10k"] = {"EXP + Reputation + Sect Points", 1, {
			{"Exp", -3, 0, 0, 1000000000},
			{"Reputation", -5, 0, 0, 10000},
			{"Sect Points", -6, 0, 0, 10000},
		}},
	["exp2g_shengwang10k_shimen10k"] = {"EXP + Reputation + Sect Points", 1, {
			{"Exp", -3, 0, 0, 2000000000},
			{"Reputation", -5, 0, 0, 10000},
			{"Sect Points", -6, 0, 0, 10000},
		}},
	["exp1g_dinghunyuntieshenshi"] = {"EXP + M∂nh MÀt Tﬁch",1,  {
			{"Exp", -3, 0, 0, 1000000000},
			{"M∂nh MÀt Tﬁch", 2, 1, 30669, 500, 4, 0},
		}},
	["ib_final1"] = {"Ph«n th≠Îng cuËi phong phÛ", 7, {
			{"Exp", -3, 0, 0, 2000000000},
			{"M∂nh Th∏i Dﬁch", 2, 0, 1082, 4000},
			{"MÀt Tﬁch Cao C p", act_give_gaoji_zhenjuan, {1, 1, 1, 2}, 0, 0},
			{"Th«n Tµi B∂o R≠¨ng", 2, 1, 30344, 3},
			{"V– Ti’u Y Vµng", 2, 1, 30491, 5, 1, 7},
			{"ßπi ßﬁnh HÂn ", 2, 1, 1113, 1, 1, 15},
			{"ßﬁnh HÂn Thi™n Thπch Th«n Thπch", 2, 1, 1067, 1, 1, 15},
		}},
}
T_VNG_AWARD = {
	finish_pet_task = 1,
}

function get_award_name(szAward)
	local t = T_FinalAward[szAward]
	if t then
		return t[1]
	end
	return ""
end

function get_award_desc(szAward)
	local t = T_FinalAward[szAward]
	if t then
		return get_list_content(t[3])
	end
	return ""
end

function get_award(szAward, nTaskId, nBitIdx)
	local t = T_FinalAward[szAward]
	if t then
		if gf_Judge_Room_Weight(t[2], T_FinalAward.room_weight[2] , "") ~= 1 then
			return 0
		end
		check_get_award(szAward,1)
		local r = award_by_list(t[3], 1, 1, nTaskId, nBitIdx)
		return r
	end
	return 0
end

function check_get_award(szAward, bNotify)
	local t = T_FinalAward[szAward]
	if t then
		local r,msg = check_award_by_list(t[3], bNotify)
		return r,msg
	end
	return 0,""
end

function check_is_vng_award(szAward)
	return T_VNG_AWARD[szAward] or 0
end