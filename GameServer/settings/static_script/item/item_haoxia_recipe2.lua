--ºÏ³ÉÎÞÏ¾ºÀÏÀÁî
Include("\\script\\lib\\globalfunctions.lua")

tItemHaoXiaRecipe = {
	[30941] = {{"Yanling Cloth", {2, 1, 30676, 30}}, {"Spirit Iron", {2, 1, 30681, 60}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 400}},	{" Kim ", 300}},
	[30942] = {{"Ma Lang Gi¸p", {2, 1, 30677, 30}}, {"Spirit Iron", {2, 1, 30681, 60}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 400}},	{" Kim ", 300}},
	[30943] = {{"§Þa Long Gi¸p", {2, 1, 30678, 30}}, {"Spirit Iron", {2, 1, 30681, 60}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 400}},	{" Kim ", 300}},
}

tItemWuXiaHaoXia = {
	[30941] = {"V« H¹ Hµo HiÖp LÖnh (Nãn)", {2,1,30944,1}},
	[30942] = {"V« H¹ Hµo HiÖp LÖnh (ƒo)", {2,1,30945,1}},
	[30943] = {"V« H¹ Hµo HiÖp LÖnh (QuÇn)", {2,1,30946,1}},
}

function OnUse(nItem)
	local szItemName = GetItemName(nItem)
	local nP = GetItemParticular(nItem);
	local tRecipe = tItemHaoXiaRecipe[nP];
	local tProduct = tItemWuXiaHaoXia[nP];
	if not tRecipe or not tProduct then
		return 0;
	end
	local msg = format("Dïng <color=gold>[%s]<color> ghÐp thµnh <color=gold>[%s]<color> cÇn tiªu hao nguyªn liÖu d­íi ®©y:", szItemName, tProduct[1]);
	local strItem = "\n    <color=%s>%s(%d/%d)<color>";
	local strMoney = "\n    <color=%s>%d %s<color>"
	for _, v in tRecipe do
		if type(v[2]) == "table" then
			local nCount = GetItemCount(v[2][1], v[2][2], v[2][3]);
			local nNeed = v[2][4];
			msg = msg..format(strItem, (nCount >= nNeed and "green" or "red"), v[1], min(nCount, nNeed), nNeed);
		else
			local nCash = GetCash();
			msg = msg..format(strMoney, (nCash >= v[2]*10000 and "green" or "red"), v[2], v[1]);
		end
	end
	Say(msg, 2, format("\n§æi ngay/#ExchangeWxhxItem(%d, %d)", nItem, nP), "\nT«i chØ xem xem th«i/nothing");
end

function ExchangeWxhxItem(nItem, nP)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local nFlag = 1;
	local tRecipe = tItemHaoXiaRecipe[nP];
	for _, v in tRecipe do
		local tItem = v[2];
		if type(tItem) == "table" then
			if GetItemCount(tItem[1], tItem[2], tItem[3]) < tItem[4] then
				nFlag = 0;
				break
			end
		else
			if GetCash() < tItem*10000 then
				nFlag = 0;
				break
			end 
		end
	end
	if nFlag ~= 1 then
		Talk(1,"","Nguyªn liÖu kh«ng ®ñ, kh«ng thÓ ghÐp.");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	for _, v in tRecipe do
		local tItem = v[2];
		if type(tItem) == "table" then
			if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
				return 0;
			end
		else
			if Pay(tItem*10000) ~= 1 then
				return 0;
			end 
		end
	end
	local t = tItemWuXiaHaoXia[nP];
	gf_AddItemEx2(t[2], t[1], GetItemName(nItem), "GhÐp phèi ph­¬ng", 0, 1);
end