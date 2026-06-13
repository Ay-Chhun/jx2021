--会经常修改的配置项写这里

szMaterialItem  = "mooncake"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--最终奖励的选择
		[1] = {"exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_yuntielinshi",},
		[2] = {"exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_dinghunyuntieshenshi",},
		[3] = {"ib_final1",},
}




--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
	["firecracker"] = { --201604节日爆竹
		{"Fuse",  {2, 200, 1} },
		{"Launch Tube", {2, 200, 2} },
		{"Explosive Powder", {2, 200, 3} },
		{"Ph竜 Hoa Huy Ho祅g", {2, 200, 4} },
		{"Dazzling Fireworks", {2, 200, 5} },
		{"Grand Ceremony Fireworks", {2, 200, 6} },
	},
	["soups"] = { --201605
		{"C竎 lo筰 u",  {2, 200, 7} },
		{"Rock Sugar", {2, 200, 8} },
		{"Lotus Seed", {2, 200, 9} },
		{"Three-color sweet soup", {2, 200, 10} },
		{"Assorted sweet soup", {2, 200, 11} },
		{"Lotus sweet soup", {2, 200, 12} },
	},
	["toys"] = { --201606
		{"Paper Kite",  {2, 200, 13} },
		{"Con Quay", {2, 200, 14} },
		{"Robot", {2, 200, 15} },
		{"Small Toy Box", {2, 200, 16} },
		{"Large Toy Box", {2, 200, 17} },
		{"Toy Crate", {2, 200, 18} },
	},
	["phoenix_flower"] = { --201607
		{"Ink Pen",  {2, 200, 19} },
		{"Notebook", {2, 200, 20} },
		{"Hoa Ph鬾g Ho祅g", {2, 200, 21} },
		{"Yearbook", {2, 200, 22} },
		{"Autograph", {2, 200, 23} },
		{"Memory Notebook", {2, 200, 24} },
	},
	["tanabata"] = {--201608
		{"Weaver Girl's Tears",  {2, 200, 25} },
		{"Cowherd's Flower", {2, 200, 26} },
		{"Magpie Bridge", {2, 200, 27} },
		{"Cowherd Gift Box", {2, 200, 28} },
		{"Weaver Girl Gift Box", {2, 200, 29} },
		{"Mandarin Duck Gift Box", {2, 200, 30} },
	},
	["mooncake"] = {--201609
		{"Flour",  {2, 200, 31} },
		{"Nh﹏ B竛h", {2, 200, 32} },
		{"Nh﹏ B竛h Th藀 C萴", {2, 200, 33} },
		{"Mooncake", {2, 200, 34} },
		{"Special cake", {2, 200, 35} },
		{"Assorted cake", {2, 200, 36} },
	},
}
--tConfig会跟别的活动冲突，所以副活动会用到的一些配置项写在外面
--三个材料道具
tMainActivityMaterials ={
	_tActivityItems[szMaterialItem][1],
	_tActivityItems[szMaterialItem][2],
	_tActivityItems[szMaterialItem][3],
}
--三个最终产品道具
tMainActivityProducts ={
	_tActivityItems[szMaterialItem][4],
	_tActivityItems[szMaterialItem][5],
	_tActivityItems[szMaterialItem][6],
}
_tActivityItems = nil--这个表没用了

tConfig = { 
	tMaterials = tMainActivityMaterials,
	tProducts = tMainActivityProducts,
	tFinalPrizeSel = tFinalPrizeSelection,
}
