ABLUEMOON_ITEM_TO_EXP = 622 --记录生活材料换经验的日期
THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_item2exp.lua"

--===================================================用收集品换取经验开始============================================
function item_to_exp()
	if GetLevel() < 50 then
		Say("<color=green>Zhou the Philanthropist<color>: Do no evil because it is small, and neglect no good because it is small. Young hero, you are still young; once you have trained to level 50, consider coming to donate some food for the refugees!",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if ( GetTask(ABLUEMOON_ITEM_TO_EXP) == nDay ) then
		Say("<color=green>Zhou the Philanthropist<color>: Do no evil because it is small, and neglect no good because it is small. Great hero, you have already donated food today!",0)
		return
	end
	Say("<color=green>Zhou the Philanthropist<color>: Years of war have brought much suffering to the people of both nations. Great hero, if you have surplus supplies, you may hand them to me to distribute to the disaster victims, and as a reward I will grant you some experience. Please consider it, great hero!",
			3,
			"I want to donate some living materials/gather",
			"I want to donate some prepared food/food",
			"Let me go look for some/end_say"
			)
end

function gather()	
	Say("<color=green>Zhou the Philanthropist<color>: What would you like to donate, great hero?",
			7,
			"I want to donate some spinning materials/#item2exp(1)",
			"I want to donate some leather-making materials/#item2exp(2)",
			"I want to donate some mining materials/#item2exp(3)",
			"I want to donate some lumber materials/#item2exp(4)",
			"I want to donate some herb-gathering materials/#item2exp(5)",
			"I want to donate some harvest materials/#item2exp(6)",
			"Let me go look for some/end_say"
			)
end

function food()
	Say("<color=green>Zhou the Philanthropist<color>: What would you like to donate, great hero?",4,
		"I want to donate some staple food/#item2exp(7)",
		"I want to donate some dishes/#item2exp(8)",
		"I want to donate some fine wine/#item2exp(9)",
		"Let me think about it again/end_say"
	)
end

function item2exp(nType)
	local tSay = {}
	for i = 1,getn(tItem2Exp[nType]) do
		tSay[i] = "I want to donate"..tItem2Exp[nType][i][5].." points"..tItem2Exp[nType][i][1].."/#giveexp("..nType..","..i..")"
	end
	tSay[getn(tSay)+1] = "Let me think about it again/end_say"
	Say("<color=green>Zhou the Philanthropist<color>: What would you like to donate, great hero?",getn(tSay),tSay	)	
end

function wantexp()
	ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
end

function giveexp(ntype,nlevel)
	local nDay = tonumber(date("%y%m%d"))
	local Genre = tItem2Exp[ntype][nlevel][2]
	local Detail = tItem2Exp[ntype][nlevel][3]
	local Particular = tItem2Exp[ntype][nlevel][4]
	local neednum = tItem2Exp[ntype][nlevel][5]
	if GetItemCount(Genre,Detail,Particular) < neednum then
		Say("<color=green>Zhou the Philanthropist<color>: You do not have enough materials on you, great hero!",0)
		return
	end
	if DelItem(Genre,Detail,Particular,neednum) == 1 then
		Msg2SubWorld("Great hero"..GetName().." donated a large amount for the disaster victims at Zhou the Philanthropist in Chengdu"..tItem2Exp[ntype][nlevel][1]..", and is widely praised by the people!")
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
	end
end

function giveexp_go(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	local player_level = GetLevel()
	local Exp = player_level^3 
	if nCount == 0 then  --第一次初始化人数
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --彩蛋～
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp*2)
		Msg2Player("Obtained"..(Exp*2).."EXP points!")
		Say("<color=green>Zhou the Philanthropist<color>: Thank you, great hero, for your contribution to the people! Since you are the <color=yellow>"..count.."<color> donor today, you receive a special <color=yellow>double<color> reward as encouragement!",0)
	else
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp)
		Msg2Player("Obtained"..Exp.."EXP points!")
		Say("<color=green>Zhou the Philanthropist<color>: Thank you, great hero, for your contribution to the people! You are the <color=yellow>"..count.."<color> donor today. If you are the first or every hundredth donor, you will receive a <color=yellow>double<color> reward!",0)		
	end
end

function end_say()
end
--====================================================用收集品换取经验结束===========================================

tItem2Exp = {  --换取经验所需生活材料
	[1] = { --丝
					{"Rabbit Fur",2,9,1,999},
					{"Silkworm Silk",2,9,2,999},
					{"Five-Color Silk",2,9,3,799},
					{"Wolf Pearl Thread",2,2,52,799},
					{"Blood Silkworm Silk",2,2,53,599},
					{"Spirit Pearl Thread",2,2,54,300},
					{"Golden Silkworm Thread",2,2,55,300},
					{"Cold Insect Silk",2,9,4,300},
	},
	[2] = { --皮
					{"Wolf Hide",2,2,15,999},
					{"Tiger Hide",2,2,16,999},
					{"Snake Hide",2,2,18,799},
					{"Fox Hide",2,2,17,799},
					{"White Tiger Hide",2,2,46,599},
					{"Bear Hide",2,2,20,300},
					{"Roc Feather Cloak",2,10,7,300},
					{"Mountain Lion Hide",2,2,47,300},
	},
	[3] = { --矿
					{"Refined Iron",2,2,1,999},
					{"Hundred-Forged Steel",2,2,2,999},
					{"Black Gold Stone",2,8,5,799},
					{"Cold Iron",2,2,4,799},
					{"Taibai Refined Gold",2,2,5,599},
					{"Black Iron",2,2,6,300},
					{"Sky-Blue Stone",2,2,36,300},
					{"Black Onyx Stone",2,2,37,300},
	},
	[4] = { --木
					{"Pine Wood",2,2,41,999},
					{"Poplar Wood",2,2,42,999},
					{"Cedar Wood",2,2,43,799},
					{"Iron Wood",2,2,44,799},
					{"Phoenix Tree Wood",2,2,45,599},
					{"Heavy Wood",2,2,9,300},
					{"Iron Camphor Wood",2,2,10,300},
					{"Iron Thread Wood",2,2,11,300},
	},
	[5] = { --采药
					{"Castor Bean",1,2,8,1998},
					{"藏红花",1,2,1,1998},
					{"桔梗",1,2,2,1998},
					{"Yellow Coptis",1,2,3,1998},
					{"Cicada Slough",1,2,9,1599},
					{"田七",1,2,10,999},
					{"Pangolin Scale",1,2,11,899},
					{"Kui Xiang",1,2,4,799},					
	},
	[6] = { --收耕
					{"Cnidium",1,3,9,1299},
					{"Wood Ear Fungus",1,3,19,1299},
					{"Tilt Pear Bean",1,3,10,1299},
					{"Stone Mushroom",1,3,20,1299},
					{"Rao Ming Bean",1,3,11,1299},
					{"Bamboo Shoot Meat",1,3,21,1299},
					{"Rongze Valley",1,3,12,1299},
					{"Pepper",1,3,22,1299},
					{"Sugarcane",1,3,13,999},
					{"Yan Jing Wheat",1,3,14,899},
					{"Chun He Wheat",1,3,15,799},
					{"Roaming Dragon Chestnut",1,3,16,699},	
	},
	[7] = { --主食
					{"Rice Ball",1,1,2,250},
					{"Steamed Bun",1,1,3,250},
					{"Flower Roll",1,1,4,220},
					{"Meat Bun",1,1,5,200},		
	},
	[8] = { --主菜
					{"Stir-fried Bamboo Shoots",1,1,6,250},
					{"Homestyle Four-Season Beans",1,1,7,250},
					{"Stir-fried Snap Peas",1,1,8,220},
					{"Garlic Lettuce",1,1,9,200},		
	},
	[9] = { --酒
					{"Roasted Knife Fish",1,1,10,250},
					{"Daughter's Red",1,1,11,250},
					{"Rice Blossom Fragrance",1,1,12,220},
					{"Drunken Life Dreaming Death",1,1,13,200},		
	},
}