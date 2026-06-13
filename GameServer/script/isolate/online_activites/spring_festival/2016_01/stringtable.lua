
t_level = {0,80}
tb_online_task ={
	{30, "0 hours 30 minutes"},
	{60, "1 hour 0 minutes"},
	{120,"2 hours 0 minutes"},
	{180,"3 hours 0 minutes"},
	{240,"4 hours 0 minutes"},
	{300,"5 hours 0 minutes"},
	{360,"6 hours 0 minutes"},
}
tb_online_award = {
	{"M¶nh Thiªn th¹ch", 2,2,7,2,4},
	{"Exchange Token",2,95,918,2,4},
	{"Thiªn th¹ch",2,2,8,2,4},
	{"¸o Choµng T¹o Bè", 0,152,1,1,4},
	{"ThiÕt Tinh cÊp 1",2,1,30533,2,4},
	{"Coarse Cloth Shoes",0,154,1,1,4},
	{"Vow of the Same Will",2,1,30913,1,4},
}

tb_material_npc = {
    { 1, 15, {"Some Dragon Beard Grass", "hd_1y_lxc", {{301,1551,3010,15}}, }, {"Dragon Beard Grass", 2,1,30984,10}, },
    { 1, 15, {"TiÓu kª", "hd_1y_xj", {{308,1431,3057,15}}, }, {"Phông Tr¶o", 2,1,30985,4}, },
    { 1, 15, {"TiÓu ¸p", "hd_1y_xy", {{301,1442,3015,15}}, }, {"Duck Egg", 2,1,30986,8}, },
    { 1, 15, {"Mét sè Hoa Phông Hoµng", "hd_1y_fhh", {{308,1560,3133,15}}, }, {"Hoa Phông Hoµng", 2,1,30987,20}, },
    { 1, 15, {"Some Red Bean", "hd_1y_hd", {{304,1447,2986,15}}, }, {"Red Bean", 2,1,30988,20}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{203,1539,3007,1},{203,1415,3062,1},{203,1436,2832,1}, }}, {"Feng Ze Valley", 2,1,30989,50}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{205,1638,3012,1},{205,1648,3236,1},{205,1784,3079,1}, }}, {"Sichuan Pepper", 2,1,30990,50}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{201,1451,2828,1},{201,1461,3057,1},{201,1576,3033,1}, }}, {"B¾p Hoµng Kim", 2,1,30991,150}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{304,1484,2952,1},{304,1421,3038,1},{304,1541,3084,1}, }}, {"Snake Meat", 2,1,30992,100}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{105,1560,3074,1},{105,1435,3010,1},{105,1531,2908,1}, }}, {"Goose Meat", 2,1,30993,100}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{301,1536,3084,1},{301,1423,3031,1},{301,1495,2905,1}, }}, {"Wheat", 2,1,30994,200}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{108,1502,3150,1},{108,1577,3006,1},{108,1434,2942,1}, }}, {"Goat Meat", 2,1,30995,150}, },
    { 2, 30, {"Gourmet Bandit", "hd_1y_msqz", {{308,1428,3094,1},{308,1554,3084,1},{308,1552,3191,1}, }}, {"Bamboo Shoot", 2,1,30996,150}, },
}

tb_boss_npc = {
	[1]={301,1492,2909} ,		--³É¶¼¸®Î÷	
	[2]={304,1422,3043} ,		--³É¶¼¸®ÄÏ			
	[3]={308,1488,3200} ,		--³É¶¼¸®±±	
	[4]={203,1537,3016} ,		--ãê¾©¸®Î÷	
	[5]={201,1527,2991} ,		--ãê¾©¸®ÄÏ		
	[6]={205,1676,3052} ,		--ãê¾©¸®¶«			
	[7]={105,1462,3071} ,		--ÈªÖİ¸®Î÷		
	[8]={108,1477,3005} ,		--ÈªÖİ¸®±±		
	["tmp_name"] = "hd_1y_msdd",
	["name"]     = "Gourmet Robber",
}
tb_kill_award = {
	{1,50,	2,1,30982,1,"Food Voucher-Common*1"},
	{51,90,	2,1,30982,2,"Food Voucher-Common*2"},
	{91,98,	2,1,30982,3,"Food Voucher-Common*3"},
	{99,100,2,1,30983,1,"PhiÕu Âm Thùc-Cùc phÈm*1"},
}
tb_tast_food_task = {
	{--1
		idx = {
			{"Dragon Beard Grass",2,1,30984,5},
			{"Dragon Beard Grass",2,1,30984,5},
			},
		[1]  			= 	{"Dragon Beard Grass",2,1,30984,5},		--²ÄÁÏ1
		[2] 			= 	{"Phông Tr¶o",2,1,30985,2},		--²ÄÁÏ2
		-- [3] 			= 	{ -1 },					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		-- [4]  			= 	{ -1 },					--²ÄÁÏ4
		name        =	"Long Tu Phông Tr¶o",            	--Ä¿±êÃû
		["award"]       =   {"Food Voucher-Common",2,1,30982,1},	--½±Àø
		["limit"]       =   2,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao Long Tu Th¶o*5, Phông Tr¶o*2",
		["item_cnt"]	=	2,
	},
	{--2
		[1]  			= 	{"Duck Egg",2,1,30986,4},		--²ÄÁÏ1		
		[2]  			= 	{"Hoa Phông Hoµng",2,1,30987,10},		--²ÄÁÏ2
		-- [3]  			= 	{ -1 },					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		-- [4]  			= 	{ -1 },					--²ÄÁÏ4
		["name"]        =	"Phông Hoµng Thai",            	--Ä¿±êÃû
		["award"]       =   {"Food Voucher-Common",2,1,30982,2},	--½±Àø
		["limit"]       =   1,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao Trøng VŞt*4, Hoa Phông Hoµng*10",
		["item_cnt"]	=	2,
	},
	{--3
		[1]  			= 	{"Red Bean",2,1,30988,10},		--²ÄÁÏ1
		[2]  			= 	{"Feng Ze Valley",2,1,30989,10},		--²ÄÁÏ2
		[3]  			= 	{"Sichuan Pepper",2,1,30990,10},					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		-- [4]  			= 	{ -1 },					--²ÄÁÏ4
		["name"]        =	"New Year Fortune",            	--Ä¿±êÃû
		["award"]       =   {"Food Voucher-Common",2,1,30982,3},	--½±Àø
		["limit"]       =   1,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao §Ëu §á*10, Phong Tr¹ch Cèc*10, Hoa Tiªu*10",
		["item_cnt"]	=	3,
	},
	{--4
		[1]  			= 	{"B¾p Hoµng Kim",2,1,30991,30},		--²ÄÁÏ1
		[2]  			= 	{"Snake Meat",2,1,30992,20},		--²ÄÁÏ2
		[3]  			= 	{"Goose Meat",2,1,30993,20},					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		-- [4]  			= 	{ -1 },					--²ÄÁÏ4
		["name"]        =	"Long Phông Tr×nh T­êng",            	--Ä¿±êÃû
		["award"]       =   {"Food Voucher-Common",2,1,30982,4},	--½±Àø
		["limit"]       =   1,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao B¾p Hoµng Kim*30, ThŞt R¾n*20, ThŞt Ngçng*20",
		["item_cnt"]	=	3,
	},
	{--5
		[1]  			= 	{"B¾p Hoµng Kim",2,1,30991,50},		--²ÄÁÏ1
		[2]  			= 	{"Hoa Phông Hoµng",2,1,30987,50},		--²ÄÁÏ2
		[3]  			= 	{"Red Bean",2,1,30988,30},					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		[4]  			= 	{"Bamboo Shoot",2,1,30996,30},					--²ÄÁÏ4
		["name"]        =	"Stir-fried Spinach",            	--Ä¿±êÃû
		["award"]       =   {"PhiÕu Âm Thùc-Cùc phÈm",2,1,30983,1},	--½±Àø
		["limit"]       =   1,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao B¾p Hoµng Kim*50, Hoa Phông Hoµng*50, §Ëu §á*30, M¨ng Tre*30",
		["item_cnt"]	=	4,
	},
	{--6
		[1]  			= 	{"Wheat",2,1,30994,50},		--²ÄÁÏ1
		[2]  			= 	{"B¾p Hoµng Kim",2,1,30991,70},		--²ÄÁÏ2
		[3]  			= 	{"Sichuan Pepper",2,1,30990,70},					--²ÄÁÏ3£¬-1±íÊ¾²»ĞèÒª
		[4]  			= 	{"Goat Meat",2,1,30995,30},					--²ÄÁÏ4
		["name"]        =	"Goat Meat Soup",            	--Ä¿±êÃû
		["award"]       =   {"PhiÕu Âm Thùc-Cùc phÈm",2,1,30983,2},	--½±Àø
		["limit"]       =   1,					--ÈÎÎñ´ÎÊıÏŞÖÆ
		["cost_str"]	=   "CÇn tiªu hao Lóa M×*50, B¾p Hoµng Kim*70, Hoa Tiªu*70, ThŞt Dª*30",
		["item_cnt"]	=	4,
	},
}

