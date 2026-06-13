Include("\\script\\online_activites\\201409\\huadeng.lua")
Include("\\script\\online_activites\\activity_head.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local tAward = {
		{1, 300, "Thiªn HuyÔn Kh¾c B¶n cÊp 3", {2, 1, 30408, 1, 4}, 7 * 24 * 3600},
		{31, 10, "yunling_4()", 1},
		{1, 300, "Small Prajna Tree", {2, 0, 504, 1, 4}, 7 * 24 * 3600},
		{1, 300, "Prajna Tree", {2, 0, 398, 1, 4}, 7 * 24 * 3600},
		{1, 700, "LuyÖn L« ThiÕt Kho¸ng", {2, 1, 30537, 1, 4}, 7 * 24 * 3600},
		{1, 700, "TÈy T©m Th¹ch Kho¸ng", {2, 1, 30536, 1, 4}, 7 * 24 * 3600},
		{1, 750, "CÊp 1 TÈy T©m Th¹ch", {2, 1, 30521, 1, 4}, 7 * 24 * 3600},
		{1, 750, "CÊp 1 LuyÖn L« ThiÕt", {2, 1, 30527, 1, 4}, 7 * 24 * 3600},
		{1, 300, "CÊp 2 TÈy T©m Th¹ch", {2, 1, 30522, 1, 4}, 7 * 24 * 3600},
		{1, 300, "CÊp 2 LuyÖn L« ThiÕt", {2, 1, 30528, 1, 4}, 7 * 24 * 3600},
		{1, 1300, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1, 4}, 7 * 24 * 3600},
		{1, 1000, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1, 4}, 7 * 24 * 3600},
		{1, 219, "Ice Stone", {2, 1, 149, 1}, 0},
		{1, 300, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 1, 4}, 7 * 24 * 3600},
		{1, 700, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1, 4}, 7 * 24 * 3600},
		{1, 100, "B¹ch C©u Tiªn ®¬n", {2, 1, 1008, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Tam Thanh Tiªn ®¬n", {2, 1, 1099, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Lôc ThÇn Tiªn ®¬n", {2, 1, 1066, 1, 4}, 7 * 24 * 3600},
		{1, 100, "ThÇn N«ng §¬n", {2, 1, 343, 1, 4}, 7 * 24 * 3600},
		{1, 100, "§¹i Nh©n s©m", {2, 0, 553, 1, 4}, 7 * 24 * 3600},
		{1, 150, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 200, "Qu©n C«ng §¹i", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 300, "Thiªn Kiªu LÖnh", {2, 97, 236, 1, 4}, 0},
		{1, 100, "Lingbo Microstep", {0, 112, 78, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 10, "Lingbo Microstep Complete Edition", {0, 112, 158, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{31, 300, "ahf_GetGaojiZhenjuan(1,1,1)", 1},
		{31, 500, "ahf_GetLevel3JSEquip()", 1},
		{1, 1, "NguyÖt L­îng Thè", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 10, "Year Beast", {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	};
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho¹t ®éng 09/2014", "Mid-Autumn Lantern Festival");
end

function yunling_4()
	local tAward = {
		{"H-Fierce Cliff-Lv4", {0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Sky Breaking-Lv4", {0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Tóy KiÕm-Lv4", {0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Swift Wind-Lv4", {0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Frost Dance-Lv4", {0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Eagle Strike-Lv4", {0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Linh T©m-Lv4", {0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-ThÇn Lùc-Lv4", {0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Ng­ng ThÇn-Lv4", {0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-No Gap-Lv4", {0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-No Limit-Lv4", {0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Cuång NhÉn-Lv4", {0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Sharp Edge-Lv4", {0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Linh Viªn-Lv4", {0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-Sea Fortune-Lv4", {0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"H-H¶i T©m-Lv4", {0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Liet Nham-Lv4", {0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Pha Khong-Lv4", {0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Tóy KiÕm-Lv4", {0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Tat Phong-Lv4", {0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Tan Vu-Lv4", {0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Qu¸n Th¹ch-Lv4", {0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-No Ngam-Lv4", {0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Xuyªn V©n-Lv4", {0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-ThÇn Lùc-Lv4", {0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Ng­ng ThÇn-Lv4", {0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Vo Gian-Lv4", {0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Vo Cuc-Lv4", {0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Cuång NhÉn-Lv4", {0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Lang Nhue-Lv4", {0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Linh Viªn-Lv4", {0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-Hai Van-Lv4", {0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"C-H¶i T©m-Lv4", {0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Fierce Cliff-Lv4", {0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Sky Breaking-Lv4", {0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Tóy KiÕm-Lv4", {0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Swift Wind-Lv4", {0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Frost Dance-Lv4", {0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Boundless-Lv4", {0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Eye Closing-Lv4", {0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-ThÇn Lùc-Lv4", {0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Ng­ng ThÇn-Lv4", {0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-No Gap-Lv4", {0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Vo Cuc-Lv4", {0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Cuång NhÉn-Lv4", {0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Lang Nhue-Lv4", {0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Linh Viªn-Lv4", {0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-Hai Van-Lv4", {0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
		{"T-H¶i T©m-Lv4", {0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1}},		
	}
	local nRandIndex = random(getn(tAward));
	gf_AddItemEx2(tAward[nRandIndex][2], tAward[nRandIndex][1], "Ho¹t ®éng 09/2014", "Mid-Autumn Lantern Festival", 7 * 24 * 3600, 1)
end

function ahf_GetLevel3JSEquip_vn()
local tAward = {
		[1] = {"¸o Choµng Háa V©n", 0, 152, 3, 1},
		[2] = {"¸o Choµng Ngò Hµnh Kim ChÕ", 0, 152, 4, 1},
		[3] = {"¸o Choµng Ngò Hµnh Méc ChÕ", 0, 152, 5, 1},
		[4] = {"¸o Choµng Ngò Hµnh Thñy ChÕ", 0, 152, 6, 1},
		[5] = {"¸o Choµng Ngò Hµnh Háa ChÕ", 0, 152, 7, 1},
		[6] = {"¸o Choµng Ngò Hµnh Thæ ChÕ", 0, 152, 8, 1},
		[7] = {"¸o Choµng Ngò Hµnh ¢m ChÕ", 0, 152, 9, 1},
		[8] = {"Huy Ch­¬ng Ngäc ChÕ", 0, 153, 3, 1},
		[9] = {"Huy Ch­¬ng Kim ChÕ ngò hµnh", 0, 153, 4, 1},
		[10] = {"Huy Ch­¬ng Méc ChÕ ngò hµnh", 0, 153, 5, 1},
		[11] = {"Huy Ch­¬ng Thñy ChÕ ngò hµnh", 0, 153, 6, 1},
		[12] = {"Huy Ch­¬ng Háa ChÕ ngò hµnh", 0, 153, 7, 1},
		[13] = {"Huy Ch­¬ng Thæ ChÕ ngò hµnh", 0, 153, 8, 1},
		[14] = {"Huy Ch­¬ng ¢m ChÕ ngò hµnh", 0, 153, 9, 1},
		[15] = {"Gao Tong Wa Recipe", 0, 154, 3, 1},
		[16] = {"ChiÕn Hµi Kim ChÕ ngò hµnh", 0, 154, 4, 1},
		[17] = {"ChiÕn Hµi Méc ChÕ ngò hµnh", 0, 154, 5, 1},
		[18] = {"ChiÕn Hµi Thñy ChÕ ngò hµnh", 0, 154, 6, 1},
		[19] = {"ChiÕn Hµi Háa ChÕ ngò hµnh", 0, 154, 7, 1},
		[20] = {"ChiÕn Hµi Thæ ChÕ ngò hµnh", 0, 154, 8, 1},
		[21] = {"ChiÕn Hµi ¢m ChÕ ngò hµnh", 0, 154, 9, 1},
	}
		local nRan = random(1,getn(tAward))
	--gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ACTIVITY_HEAD", "Trang bÞ Kim Xµ 3 sao")
	--gf_AddItemEx2({0,154,4,1}, "Tû tµo lao", "Ho¹t ®éng 09/2014", "Héi §Ìn Hoa Trung Thu")
	AddItem(tAward[nRan][2],tAward[nRan][3],tAward[nRan][4],tAward[nRan][5])
end