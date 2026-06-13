Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

szNPCName = "<color=green>Long Quang Ch©n Nh©n:<color> "
tbAllowItem = {
	[2]	= {
		[0] = {
			[504] = {8,"Small Prajna Tree",10},	--	{QuestID, ItemName, ItemQty}
			[398] = {10,"Prajna Tree",8},
			[1084] = {32,"Thiªn Qu¸i Th¹ch",1},
		},
		[1] = {
			[30087] = {6,"Bag of Seeds",2},
			[30269] = {12,"Four Spirits Tree",8},
			[30270] = {14,"Azure Dragon Fruit",30},
			[30273] = {15,"HuyÒn Vò C¨n",30},
			[30272] = {16,"B¹ch Hæ DiÖp",30},
			[30271] = {17,"Háa Phông Hoa",30},
			[30164] = {18,"Longan",29},
			[30165] = {18,"Rambutan",29},
			[30166] = {18,"Cam",29},
			[30167] = {18,"Coconut",29},
			[30168] = {18,"Mangosteen",29},
			[30169] = {18,"Pomelo",29},
			[30170] = {18,"Strawberry",29},
			[30171] = {18,"Banana",29},
			[30172] = {18,"Mango",29},
			[30173] = {18,"Peach",29},
			[30174] = {18,"Plum",29},
			[30175] = {18,"Lychee",29},
			[30176] = {18,"Apple",29},
			[30177] = {18,"Avocado",29},
			[30178] = {18,"Papaya",29},
			[30179] = {18,"Soursop",29},
			[30180] = {18,"Pineapple",29},
			[30181] = {18,"Li",29},
			[30182] = {18,"Langsat",29},
			[30183] = {18,"Star Fruit",29},
			[30132] = {26,"Vâ L©m B¶o H¹p",100},
			[30135] = {27,"Ch×a khãa Thanh §ång",1},
			[30134] = {28,"Ch×a kho¸ B¹ch Ng©n",1},
			[30133] = {29,"Ch×a Khãa Vµng",1},
			[30071] = {30,"Nh©n S©m V¹n N¨m",2},
			[30130] = {31,"Phi Yªn Th¹ch",2},
			[30346] = {33,"M¶nh B¹ch Kim",10},
			[1009] = {34,"Thiªn Th¹ch Tinh Th¹ch",3},
			[9999] = {37,"Qu©n C«ng Ch­¬ng",3},
			[9998] = {38,"Qu©n C«ng §¹i",2},
			[9977] = {39,"Qu©n C«ng Huy Hoµng",1},
		},
		[2] = {
			[7] = {35,"M¶nh Thiªn th¹ch",20},
			[8] = {36,"Thiªn th¹ch",20},
		},
	}
}
function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if PhucSinh2_CheckActive() ~= 1 then
		return 0
	end
	if PhucSinh2_GetStatus() == 1 then
		return 0
	end
	
	if tbAllowItem[genre] == nil then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	if tbAllowItem[genre][detail] == nil then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	if tbAllowItem[genre][detail][particular] == nil then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	
	if tbAllowItem[genre][detail][particular][1] ~= PhucSinh2_GetDailyMission() then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbItem = GetPutinItem();
	local nCount = 0
	local nG, nD, nP = tbItem[1][2], tbItem[1][3], tbItem[1][4]
	
	if GetItemCount(nG,nD,nP) < tbAllowItem[nG][nD][nP][3] then
		Talk(1,"",szNPCName.."Ng­¬i kh«ng cã ®ñ "..tbAllowItem[nG][nD][nP][3].." "..tbAllowItem[nG][nD][nP][2]..", please prepare more.")
		return 0
	end
	
	if PhucSinh2_GetStatus() == 0 then
		if DelItem(nG,nD,nP,tbAllowItem[nG][nD][nP][3]) == 1 then
			PhucSinh2_SetStatus(1)
--			DelItemByIndex(tbItem[1][1],-1)
		end
	end
	return 1
end
