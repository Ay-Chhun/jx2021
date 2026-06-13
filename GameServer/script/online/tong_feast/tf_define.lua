--TEST Select------------
DebugOutput = nothing
TF_ISFORTEST = 0
-------------------------

TF_SWITH = 1;

TF_NPC_POS = {
	[1] = {
		[1] = {205, 1643, 2947, "East Bianjing (229,188)"},
		[2] = {205, 1609, 2992, "East Bianjing (201,187)"},
		[3] = {205, 1705, 2914, "East Bianjing (213,181)"},	
	},                      
	[2] = {                 
		[1] = {201, 1587, 3015, "South Bianjing (198,188)"},
		[2] = {201, 1512, 3024, "South Bianjing (189,189)"},
		[3] = {201, 1535, 2934, "South Bianjing (191,183)"},	
	},                       
	[3] = {                 
		[1] = {203, 1520, 2945, "West Bianjing (190,184)"},
		[2] = {203, 1555, 2959, "West Bianjing (194,184)"},
		[3] = {203, 1497, 3054, "West Bianjing (187,190)"},	
	},                      
	[4] = {                 
		[1] = {105, 1560, 3108, "T﹜ Tuy襫 Ch﹗ (183,18B秠)"},
		[2] = {105, 1526, 3172, "T﹜ Tuy襫 Ch﹗ (190,198)"},
		[3] = {105, 1496, 3088, "T﹜ Tuy襫 Ch﹗ (18B秠,193)"},	
	},                      
	[5] = {                 
		[1] = {108, 1456, 2960, "B綾 Tuy襫 Ch﹗ (182,185)"},
		[2] = {108, 1511, 3024, "B綾 Tuy襫 Ch﹗ (189,189)"},
		[3] = {108, 1454, 3100, "B綾 Tuy襫 Ch﹗ (182,193)"},	
	},                      
	[6] = {                 
		[1] = {304, 1448, 2974, "Nam Th祅h Й (181,186)"},
		[2] = {304, 1496, 2912, "Nam Th祅h Й (18B秠,182)"},
		[3] = {304, 1525, 2853, "Nam Th祅h Й (186,18B秠)"},	
	},                      
	[7] = {                 
		[1] = {301, 1518, 3027, "T﹜ Th祅h Й (189,189)"},
		[2] = {301, 1574, 3015, "T﹜ Th祅h Й (196,188)"},
		[3] = {301, 1582, 3084, "T﹜ Th祅h Й (19B秠,192)"},	
	},                      
	[8] = {                 
		[1] = {308, 1464, 3105, "B綾 Th祅h Й (183,194)"},
		[2] = {308, 1536, 3184, "B綾 Th祅h Й (192,199)"},
		[3] = {308, 1493, 3162, "B綾 Th祅h Й (196,195)"},	
	},
}

TF_NPC_POS_OFFSET = {
	[1] = {-4,4},
	[2] = {4,4},
	[3] = {4,-4},	
	[4] = {-4,-4},
	[5] = {-4,8},
	[6] = {4,8},
	[7] = {8,4},
	[8] = {8,-4},
	[9] = {4,-8},
	[10] = {-4,-8},
	[11] = {-8,-4},
	[12] = {-8,4},
	[13] = {-8,8},
	[14] = {8,8},
	[15] = {8,-8},
	[16] = {-8,-8},
}


TF_HANG_IN_FOOD_MAX = 1500;
TF_CHEF_NUM_MAX = 24;
TF_TOAST_USE_CD = 90;--s
TF_HAND_IN_MAX = 720;--单类上交最大数量

--RelayShareData------------------------------
TF_FEAST_CHEF = "_TF_CHEF_";
-- 0, 0 [TongName] = x, y, timestramp, 0 or 1;npc坐标，时间戳，是否开餐 4
-- 0, 1 [TongName] = 0 or 1;当天是否已参加过 1,2制作失败
-- 0, 2 [TongName] = npcIndex * 16；桌子的npc index(RelayShare最多16个数据) 16
-- 0, 3	[TongName] = nPig, nCow, nSheep, nBacon, nWine, nTc, nCooker, nTableware；食材，美酒，桌椅，炊具，餐具 8
-- 0, 4 [npcIndex] = PlayerIndex * 10 10
TF_SHAREDATA_STRING00 = "dddd";
TF_SHAREDATA_STRING01 = "d";
TF_SHAREDATA_STRING02 = "dddddddddddddddd";
TF_SHAREDATA_STRING03 = "dddddddd";
TF_SHAREDATA_STRING04 = "dddddddddd";

-----TASK------------------------------
TF_TASK_1 = 3189 --记录个人上交信息
TF_TASK_2 = 3190 --食材，酒，炊具，桌椅
TF_TASK_3 = 3191 --·····
TF_TASK_4 = 3192 --·····3,4Byte用餐桌子的npc index
--TF_TASK_5 = 3193 
TF_TASK_6 = 3193 --1Byte哪个套餐2Byte今天使用已用餐3Byte时间计数器4Byte是否使用精致的餐具
--TF_TASK_7 = 3194 
TF_TASK_8 = 3194 --使用美酒的CD
TF_TASK_9 = 3195 --获得BUFF的时间
---------------------------------------

------item-----------------------------
TF_ITEM_PIG = {2, 1, 30583, "Pork Belly"};
TF_ITEM_COW = {2, 1, 30584, "Kobe Beef"};
TF_ITEM_SHEEP = {2, 1, 30585, "Spring Lamb"};
TF_ITEM_BACON = {2, 1, 30586, "Cold Cuts"};
TF_ITEM_TC = {2, 1, 30590, "Banquet Table"};
TF_ITEM_COOKER = {2, 1, 30591, "Cookware Set"};
TF_ITEM_WINE = {2, 1, 30587, "Mingming Wine"};
TF_ITEM_TABLEWARE = {2, 1, 30592, "Dish Set"};
TF_ITEM_TONG_TOKEN_CHIP = {2, 1, 30588, "M秐h L謓h B礽 Bang H閕"};
TF_ITEM_TONG_TOKEN = {2, 1, 30589, "L謓h B礽 Bang H閕"};
---------------------------------------

------raiddrop-------------------------
TF_RAIDDROP_PB = {
	[1] = 50,
	[2] = 85,
	[3] = 90,
	[4] = 95,
	[5] = 100,
	[6] = 100,
	[7] = 100,
	[8] = 100,
}
---------------------------------------

--用餐奖励-----------------------------
TF_FEAST_AWARD = {
	[1] = {200000, 20, 40, 1},	
	[2] = {400000, 40, 80, 2},
	[3] = {600000, 60, 120, 3},
}

TF_AWARD_BUFF = {
	{"state_p_attack_percent_add", 5, 2*3600*18, 0, 9109, 1, 0},
	{"state_m_attack_percent_add", 5, 2*3600*18, 0, 9110, 1, 0},
	{"state_magic_parmor_per_add", 5, 2*3600*18, 0, 9111, 1, 0},
	{"state_physical_parmor_per_add", 5, 2*3600*18, 0, 9112, 1, 0},
	{"state_life_max_percent_add", 10, 2*3600*18, 0, 9113, 1, 0},
	{"state_move_speed_percent_add", 10, 2*3600*18, 0, 9114, 1, 0},
	{"state_burst_enhance_rate", 5, 2*3600*18, 0, 9115, 1, 0},
	{"state_inc_exp_gain", 300, 2*3600*18, 0, 9116, 1, 0},
}