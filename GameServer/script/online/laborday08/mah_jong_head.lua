--2008ÄêÎåÒ»»î¶¯Í·ÎÄ¼ş
--by vivi
--2008/04/10

--ÈÎÎñ±äÁ¿
--×¢Òâ£ºĞŞ¸ÄÂé½«±äÁ¿¼ÇµÃĞŞ¸Äadd_mahjong_probº¯Êı
TASK_MJ_TONG1 = 861; --´æ·ÅÂé½«1Í²µÄ¸öÊı£¬ÒÔÏÂÀàÍÆ¡£
TASK_MJ_TONG2 = 862;
TASK_MJ_TONG3 = 863;
TASK_MJ_TONG4 = 864;
TASK_MJ_TONG5 = 865;
TASK_MJ_TONG6 = 866;
TASK_MJ_TONG7 = 867;
TASK_MJ_TONG8 = 868;
TASK_MJ_TONG9 = 869;
TASK_MJ_TIAO1 = 870; --´æ·ÅÂé½«1ÌõµÄ¸öÊı£¬ÒÔÏÂÀàÍÆ¡£
TASK_MJ_TIAO2 = 871;
TASK_MJ_TIAO3 = 872;
TASK_MJ_TIAO4 = 873;
TASK_MJ_TIAO5 = 874;
TASK_MJ_TIAO6 = 875;
TASK_MJ_TIAO7 = 876;
TASK_MJ_TIAO8 = 877;
TASK_MJ_TIAO9 = 878;
TASK_MJ_WAN1 = 879; --´æ·ÅÂé½«1ÍòµÄ¸öÊı£¬ÒÔÏÂÀàÍÆ¡£
TASK_MJ_WAN2 = 880;
TASK_MJ_WAN3 = 881;
TASK_MJ_WAN4 = 882;
TASK_MJ_WAN5 = 883;
TASK_MJ_WAN6 = 884;
TASK_MJ_WAN7 = 885;
TASK_MJ_WAN8 = 886;
TASK_MJ_WAN9 = 887;
TASK_MJ_DONG = 888; --´æ·ÅÂé½«¶«·çµÄ¸öÊı¡£
TASK_MJ_NAN = 889; --´æ·ÅÂé½«ÄÏ·çµÄ¸öÊı¡£
TASK_MJ_XI = 890; --´æ·ÅÂé½«Î÷·çµÄ¸öÊı¡£
TASK_MJ_BEI = 891; --´æ·ÅÂé½«±±·çµÄ¸öÊı¡£
TASK_MJ_ZHONG = 892; --´æ·ÅÂé½«ºìÖĞµÄ¸öÊı¡£
TASK_MJ_FA = 893; --´æ·ÅÂé½«·¢²ÆµÄ¸öÊı¡£
TASK_MJ_BAI =894; ----´æ·ÅÂé½«°×°åµÄ¸öÊı¡£
TASK_MJ_SINGLE_PRIZE = 895;--ÁìÈ¡µ¥ÕÅ½±ÀøµÄ´ÎÊı
TASK_MJ_PIHU_RPIZE = 896; --Æ¨ºú¶Ò»»½±Àø´ÎÊı
TASK_MJ_TONG_RPIZE = 897; --ÇåÒ»É«Í²µÄ¶Ò»»´ÎÊı
TASK_MJ_TIAO_RPIZE = 898; --ÇåÒ»É«ÌõµÄ¶Ò»»´ÎÊı
TASK_MJ_WAN_RPIZE = 899; --ÇåÒ»É«ÍòµÄ¶Ò»»´ÎÊı
TASK_MJ_SIXI_RPIZE = 900; --´óËÄÏ²¶Ò»»´ÎÊı
TASK_MJ_BIWU_NUM = 901; --Ã¿ÈÕ±ÈÎä´ó»á»ñµÃÂé½«Êı
TASK_MJ_TX_DATE = 902; --Ã¿ÈÕÖ»ÓĞÒ»´Î¿ÉÒÔ»ñµÃÂé½«
TASK_MJ_BIWU_DATE = 903;--ÊÇ·ñÁìÈ¡ÁË±ÈÎä´ó»áµ±ÈÕµÄ15±¾
TASK_MS_BJ_NUM = 904; --¹Ò°×¾Ô»ñÈ¡Âé½«µÄÊıÁ¿

--ÁÙÊ±±äÁ¿
TASK_TEMP_MJ_KIND = 126

--È«¾Ö±äÁ¿
PIHU_TOTAl_NUM = 42; --Æ¨ºú¶Ò»»´ÎÊıÏŞÖÆ
TONG_TOTAL_NUM = 21;
TIAO_TOTAL_NUM = 14;
WAN_TOTAL_NUM = 7;
SIXI_TOTAL_NUM = 2;
BAIJU_TOTAL_NUM = 120; --¹Ò°×¾Ô×î¶à¿É»ñµÃÂé½«ÊıÁ¿

--table
tMahJong = {--Âé½«Ãû id
	{"One Copper",2,0,630},	
	{"Two Copper",2,0,631},	
	{"Three Copper",2,0,632},	
	{"Four Copper",2,0,633},	
	{"Five Copper",2,0,634},	
	{"Six Copper",2,0,635},	
	{"Seven Copper",2,0,636},	
	{"Eight Copper",2,0,637},	
	{"Cöu ®ång",2,0,638},	
	{"One",2,0,639},	
	{"Two Bars",2,0,640},	
	{"Ba",2,0,641},	
	{"Four",2,0,642},	
	{"Five Bars",2,0,643},	
	{"Six Bars",2,0,644},	
	{"Seven Bars",2,0,645},	
	{"Eight Bars",2,0,646},	
	{"Cöu ®iÒu",2,0,647},	
	{"Ten Thousand",2,0,648},	
	{"Twenty Thousand",2,0,649},	
	{"Thirty Thousand",2,0,650},	
	{"Forty Thousand",2,0,651},	
	{"Fifty Thousand",2,0,652},	
	{"Sixty Thousand",2,0,653},	
	{"Seventy Thousand",2,0,654},	
	{"Eighty Thousand",2,0,655},	
	{"Cöu v¹n",2,0,656},	
	{"East Wind",2,0,657},	
	{"Nam phong",2,0,658},	
	{"West Wind",2,0,659},	
	{"North Wind",2,0,660},	
	{"Hång trung",2,0,661},	
	{"Riches",2,0,662},	
	{"B¹ch ban",2,0,663}	
	};
	
	

--function
function get_laborday08_state()
--»î¶¯×´Ì¬ÅĞ¶Ï
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080428 then
		return 0;
	elseif nDate >= 20080428 and nDate <= 20080505 then
		return 1;
	else 
		return 2;
	end 
end

function get_laborday08_award_state()
--ÁìÈ¡½±ÀøÅĞ¶Ï
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080428 and nDate <= 20080512 then	
		return 1;
	else
		return 0;
	end
end

function add_mahjong_prob(nP)
--Í¨ÓÃÂé½«¸ÅÂÊ ´«Èë²ÎÊıÎª£º¸ÅÂÊ¡£µ¥Î»£ºÇ§·Ö±È¡£±ÈÈç´«Èë50 ±íÊ¾5%»ñµÃ
	local nRandOne = random(1,1000);
	if nRandOne <= nP then	
		local nRandTwo = random(1,100);
		if nRandTwo <= 55 then
			local nRandThree = random(1,9);
			SetTask(860+nRandThree,GetTask(860+nRandThree)+1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tMahJong[nRandThree][1].." , nã ë trong r­¬ng M¹t ch­îc.");
		elseif nRandTwo <= 85 then
			local nRandThree = random(1,9);
			SetTask(869+nRandThree,GetTask(869+nRandThree)+1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tMahJong[9+nRandThree][1].." , nã ë trong r­¬ng M¹t ch­îc.");
		elseif nRandTwo <= 95 then
			local nRandThree = random(1,9);
			SetTask(878+nRandThree,GetTask(878+nRandThree)+1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tMahJong[18+nRandThree][1].." , nã ë trong r­¬ng M¹t ch­îc.");	
		else
			local nRandThree = random(1,7);
			SetTask(887+nRandThree,GetTask(887+nRandThree)+1);
			Msg2Player("B¹n nhËn ®­îc 1 "..tMahJong[27+nRandThree][1].." , nã ë trong r­¬ng M¹t ch­îc.");
		end							
		return 1;
	else
		return 0;
	end
end

--±¦Ê¯°ü¹ü¸ÅÂÊ£¬²ÎÊı£º»ñµÃ¸ß¼¶ÁéÊ¯µÄÍ¾¾¶£¬ÓÃÓÚ¹«¸æ
function laborday08_baoshi_prob(sName)
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch CÊp 1, nã trong Tô linh ®Ønh.");
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 2, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc1 Linh Th¹ch cÊp 3, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 4, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 6, ®· nhËp vµo Tô linh ®Ønh.");
		Msg2Global("Player"..GetName().."Trong cuéc thi ThÇn bµi"..sName.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 6");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..sName.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 6");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 7, ®· nhËp vµo Tô linh ®Ønh.");		
		Msg2Global("Player"..GetName().."Trong cuéc thi ThÇn bµi"..sName.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 7");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..sName.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 7");
	end
end

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end