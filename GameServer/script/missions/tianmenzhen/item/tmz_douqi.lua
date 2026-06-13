--¶·Æø

g_tbSkillName = {
	[0] = "",
	[1] = "",
	[2] = "Sinew Transformation Classic",
	[3] = "Marrow Cleansing Classic",
	[4] = "Nh­ Lai ThÇn Ch­ëng",
	[5] = "",
	[6] = "HÊp Tinh TrËn",
	[7] = "",
	[8] = "V¹n T­íng ThÇn C«ng",
	[9] = "Thiªn ¢m TrÊn Hån Khóc",
	[10] = "",
	[11] = "Eighteen Dragon Subduing Palms",
	[12] = "Dog Beating Staff Technique",
	[13] = "",
	[14] = "V« Th­îng Th¸i Cùc KiÕm",
	[15] = "Th¸i Cùc ThÇn C«ng",
	[16] = "",
	[17] = "Liªn Hoµn Toµn Long th­¬ng",
	[18] = "B¸ V­¬ng T­êng Phông TiÔn",
	[19] = "",
	[20] = "V« Thiªn Ma C«ng",
	[21] = "V« ¶nh Ma Cæ",
	[22] ="",
	[23] ="V« Cùc Phong L«i QuyÕt",
	[24] ="",
	[25] ="Heaven and Earth Great Shift",
	[26] ="Quang Minh Ngò Hµnh TrËn",
	[27] ="Frost Cotton Palm",
	[28] ="",
	[29] ="Loan Phông Cöu Thiªn",
	[30] ="Cöu Vü Hoa Tiªn QuyÕt",
}	

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("B¶n ®å nµy kh«ng thÓ sö dông ®Êu khÝ",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","C¸c h¹ vÉn ch­a häc tuyÖt kü trÊn ph¸i, kh«ng thÓ sö dông ®Êu khÝ");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetMomentum(10,1);
		Msg2Player("Sö dông ®Êu khÝ, ®iÓm s¸t khÝ thµnh 10");
	end;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 6006 then
		return 0;
	else
		return 1;
	end
end