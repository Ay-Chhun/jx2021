--by liubo
--²ÆÉñ±¦Ïä½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_MAMMON_BOX_AWARD =  {
	{2, 1500, 50000000, 1},
    	{2, 1500, 100000000, 1},
    	{2, 500, 200000000, 1},
    	{1, 1000, "Tói Thiªn Th¹ch Tinh Th¹ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
	{1, 1000, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
  	{1, 1000, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},   
  	{1, 1000, "§¹i §Þnh Hån", {2, 1, 1113, 1}, 7 * 24 * 3600},
     	{1, 250, "Bao tinh th¹ch Thiªn Th¹ch", {2, 1, 1051, 1}, 7 * 24 * 3600}, 
     	{31, 1000, "Book_Pet1()", ""},
	{31, 1000, "Book_Pet2()", ""},
	{31, 200, "Book_Pet3()", ""},
	{31, 50, "Book_Pet4()", ""},	
	
};

VET_BOOK_PET1 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 1", {2,150,1,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 1", {2,150,5,1}, 0},
	{1, 699, "Strong Body Mighty Form Lv 1", {2,150,9,1}, 0},
	{1, 699, "Yin Wind Bone Eroding Lv 1", {2,150,13,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 1", {2,150,17,1}, 0},
	{1, 699, "Formless Featureless Lv 1", {2,150,21,1}, 0},
	{1, 699, "Metal Spirit Attachment Lv 1", {2,150,25,1}, 0},
	{1, 699, "Wood Spirit Attachment Lv 1", {2,150,29,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 1", {2,150,33,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 1", {2,150,37,1}, 0},
	{1, 699, "Earth Spirit Attachment Lv 1", {2,150,41,1}, 0},
	{1, 699, "Sky Shattering Shadow Slash Lv 1", {2,150,45,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 1", {2,150,49,1}, 0},
	{1, 456, "Swift Spirit Quickness Lv 1", {2,150,53,1}, 0},
	{1, 700, "Formless Ancient Lv 1", {2,150,57,1}, 0},
}

VET_BOOK_PET2 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 2", {2,150,2,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 2", {2,150,6,1}, 0},
	{1, 699, "Strong Body Mighty Form Lv 2", {2,150,10,1}, 0},
	{1, 699, "Yin Wind Bone Eroding Lv 2", {2,150,14,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 2", {2,150,18,1}, 0},
	{1, 699, "Formless Featureless Lv 2", {2,150,22,1}, 0},
	{1, 699, "Metal Spirit Attachment Lv 2", {2,150,26,1}, 0},
	{1, 699, "Wood Spirit Attachment Lv 2", {2,150,30,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 2", {2,150,34,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 2", {2,150,38,1}, 0},
	{1, 699, "Earth Spirit Attachment Lv 2", {2,150,42,1}, 0},
	{1, 699, "Sky Shattering Shadow Slash Lv 2", {2,150,46,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 2", {2,150,50,1}, 0},
	{1, 456, "Swift Spirit Quickness Lv 2", {2,150,54,1}, 0},
	{1, 700, "Formless Ancient Lv 2", {2,150,58,1}, 0},
}

VET_BOOK_PET3 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 3", {2,150,3,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 3", {2,150,7,1}, 0},
	{1, 718, "Strong Body Mighty Form Lv 3", {2,150,11,1}, 0},
	{1, 718, "Yin Wind Bone Eroding Lv 3", {2,150,15,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 3", {2,150,19,1}, 0},
	{1, 718, "Formless Featureless Lv 3", {2,150,23,1}, 0},
	{1, 718, "Metal Spirit Attachment Lv 3", {2,150,27,1}, 0},
	{1, 718, "Wood Spirit Attachment Lv 3", {2,150,31,1}, 0},
	{1, 718, "Thñy Linh Phô ThÓ CÊp 3", {2,150,35,1}, 0},
	{1, 718, "Háa Linh Phô ThÓ CÊp 3", {2,150,39,1}, 0},
	{1, 718, "Earth Spirit Attachment Lv 3", {2,150,43,1}, 0},
	{1, 718, "Sky Shattering Shadow Slash Lv 3", {2,150,47,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng CÊp 3", {2,150,51,1}, 0},
	{1, 333, "Swift Spirit Quickness Lv 3", {2,150,55,1}, 0},
	{1, 718, "Formless Ancient Lv 3", {2,150,59,1}, 0},
}
VET_BOOK_PET4 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 4",{2,150,4,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 4",{2,150,8,1}, 0},
	{1, 718, "Qiang Shen Ba Ti Level 4",{2,150,12,1}, 0},
	{1, 718, "Yin Feng Shi Gu Level 4",{2,150,16,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 4",{2,150,20,1}, 0},
	{1, 718, "Wu Xing Wu Xiang Level 4",{2,150,24,1}, 0},
	{1, 718, "Jin Ling Fu Ti Level 4",{2,150,28,1}, 0},
	{1, 718, "Mu Ling Fu Ti Level 4",{2,150,32,1}, 0},
	{1, 718, "Shui Ling Fu Ti Level 4",{2,150,36,1}, 0},
	{1, 718, "Huo Ling Fu Ti Level 4",{2,150,40,1}, 0},
	{1, 718, "Tu Ling Fu Ti Level 4",{2,150,44,1}, 0},
	{1, 718, "Po Kong Zhan Ying Level 4",{2,150,48,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng cÊp 4",{2,150,52,1}, 0},
	{1, 333, "Qing Ling Xun Ji Level 4",{2,150,56,1}, 0},
	{1, 718, "Wu Xing Zhi Gu Level 4",{2,150,60,1}, 0},
}

function OnUse(nItem)
--	Talk(1, "", "TÝnh n¨ng t¹m ®ãng ®Ó b¶o tr×. B¹n vui lßng quay l¹i sau !!")
--	do return end
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Thêi ®iÓm hiÖn t¹i ch­a cho phÐp ®æi r­¬ng, c¸c h¹ h·y sö dông sau nhÐ.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_MAMMON_BOX_AWARD,10000, "", "Than Tai Bao Ruong","Sö dông ThÇn Tµi B¶o R­¬ng")
	end
end


function Book_Pet1()
	gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "Than Tai Bao Ruong","Sö dông Kim R­¬ng")
end


function Book_Pet2()
	gf_EventGiveRandAward(VET_BOOK_PET2,10000,"", "Than Tai Bao Ruong","Sö dông B¹ch Kim R­¬ng")
end


function Book_Pet3()
	gf_EventGiveRandAward(VET_BOOK_PET3,10000,"", "Than Tai Bao Ruong","Sö dông ThÇn Tµi B¶o R­¬ng")
end


function Book_Pet4()
	gf_EventGiveRandAward(VET_BOOK_PET4,10000,"", "Than Tai Bao Ruong","Sö dông ThÇn Tµi B¶o R­¬ng")
end