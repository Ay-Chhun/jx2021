--½Å±¾Ãû³Æ£ºIB·şÎñÆ÷²Ø½£×°±¸°ü»»½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ²Ø½£×°±¸°ü¶Ò»»¶ÔÓ¦µÄ²Ø½£×°±¸
--¹¦ÄÜ²ß»®ÈË£ºÁõÏ£
--´úÂë±àĞ´ÈË£ºÕÔ¹ó´º
--´úÂë±àĞ´Ê±¼ä£º2007-01-10
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--=============================¹«¹²±äÁ¿¶¨ÒåÇø=============================
	cangjian_bag_name = {"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n","B¶o r­¬ng Tµng KiÕm y gi¸p","B¶o r­¬ng Tµng KiÕm hoa khè","B¶o r­¬ng Tµng KiÕm trang søc","B¶o r­¬ng Tµng KiÕm vò khİ"}
	att_wt = {35,80,50,185,5}
	use_level_min = 70		--ÊÇ·ñÌáĞÑÊ¹ÓÃµÄ×îµÍµÈ¼¶
function OnUse(idx)
	local id = tonumber(idx)
	--ÎïÆ·ĞÅÏ¢µÄ»ñÈ¡ºÍÕûÀí
	local bag_diff = GetItemParticular(id) - 1058
	--Á÷ÅÉÅĞ¶Ï
	local player_Route = GetPlayerRoute()
	if player_route_chk(player_Route) == 0 then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ dïng vËt phÈm nµy!")
		return
	elseif GetLevel() < use_level_min then
		Say("§¼ng cÊp b¹n kh«ng thÓ dïng"..cangjian_bag_name[bag_diff]..", hay lµ muèn nhËn"..cangjian_bag_name[bag_diff].."?",
			2,
			"Ta muèn sö dông!/#use_cangjian_bag_det("..bag_diff..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
	else
		Say("B¹n ®ång ı dïng"..cangjian_bag_name[bag_diff].." ®Ó nhËn trang bŞ øng víi m«n ph¸i?",
			2,
			"Ta muèn sö dông!/#use_cangjian_bag_det("..bag_diff..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
	end
end
function use_cangjian_bag_det(bag_diff)
	--Íæ¼Ò¸ºÖØºÍ¿Õ¼ä¼ì²â
	if Zgc_pub_goods_add_chk(1,att_wt[bag_diff]) ~= 1 then
		return
	end
	--×¼±¸ĞÅÏ¢¶¨Òå
	local canjiantao={
		{},
		{--²Ø½£Ã±×ÓÃû×Ö-----------------²Ø½£ÒÂ·şÃû×Ö------------²Ø½£¿ã/Ğ¬Ãû×Ö-----------²Ø½£ÓñÅåÃû×Ö---------²Ø½£ÎäÆ÷-¸±Àà£ºÃ±×Ó¡¢ÒÂ·ş¡¢¿ã/Ğ¬¡¢ÓñÅä-Ğ¡Àà-ÎäÆ÷¸±Àà-Ğ¡Àà
		{"Vajra Saber, headgear","Vajra Saber, common","Kim Cang Dao Trang","Vajra Saber, belt","Kim Cang Dao §ao",103,100,101,102,3,271},
		{"Vajra Saber, headgear","Vajra Saber, common","Kim Cang Dao Trang","Vajra Saber, belt","Kim Cang Dao §ao",103,100,101,102,3,272}
		},
		{
		{"Tathagata Saber, headgear","Tathagata Saber, common","Tathagata Saber, attire","Tathagata Saber, belt","Tathagata Saber, staff",103,100,101,102,8,371},
		{"Tathagata Saber, headgear","Tathagata Saber, common","Tathagata Saber, attire","Tathagata Saber, belt","Tathagata Saber, staff",103,100,101,102,8,372}
		},
		{
		{"Arhat Saber, headgear","Arhat Saber, common","Arhat Saber, attire","Arhat Saber, belt","La H¸n Dao Thñ",103,100,101,102,0,471},
		{"Arhat Saber, headgear","Arhat Saber, common","Arhat Saber, attire","Arhat Saber, belt","La H¸n Dao Thñ",103,100,101,102,0,472}
		},
		{},
		{
		{"Knight-Errant Saber, headgear","Knight-Errant Saber, common","Knight-Errant Saber, attire","Knight-Errant Saber, belt","Knight-Errant Saber, needle",103,100,101,102,1,671},
		{"Knight-Errant Saber, headgear","Knight-Errant Saber, common","Knight-Errant Saber, attire","Knight-Errant Saber, belt","Knight-Errant Saber, needle",103,100,101,102,1,672},
		{"Knight-Errant Saber, headgear","Knight-Errant Saber, common","Knight-Errant Saber, attire","Knight-Errant Saber, belt","Knight-Errant Saber, needle",103,100,101,102,1,673},
		{"Knight-Errant Saber, headgear","Knight-Errant Saber, common","Knight-Errant Saber, attire","Knight-Errant Saber, belt","Knight-Errant Saber, needle",103,100,101,102,1,674}
		},
		{},
		{
		{},
		{},
		{"Guanyin Saber, headgear","Guanyin Saber, common","Guanyin Saber, attire","Guanyin Saber, belt","Quan ¢m Dao KiÕm",103,100,101,102,2,873},
		{"Guanyin Saber, headgear","Guanyin Saber, common","Guanyin Saber, attire","Guanyin Saber, belt","Quan ¢m Dao KiÕm",103,100,101,102,2,874},
		},
		{
		{},
		{},
		{"Ngäc N÷ Dao Qu¸n","Ngäc N÷ Dao Th­êng","Ngäc N÷ Dao Trang","Ngäc N÷ Dao Béi","Ngäc N÷ Dao CÇm",103,100,101,102,10,973},
		{"Ngäc N÷ Dao Qu¸n","Ngäc N÷ Dao Th­êng","Ngäc N÷ Dao Trang","Ngäc N÷ Dao Béi","Ngäc N÷ Dao CÇm",103,100,101,102,10,974}
		},
		{},
		{
		{"Subduing Dragon Saber, headgear","Subduing Dragon Saber, common","Subduing Dragon Saber, attire","Subduing Dragon Saber, belt","Gi¸ng Long Dao Thñ",103,100,101,102,0,1171},
		{"Subduing Dragon Saber, headgear","Subduing Dragon Saber, common","Subduing Dragon Saber, attire","Subduing Dragon Saber, belt","Gi¸ng Long Dao Thñ",103,100,101,102,0,1172},
		{"Subduing Dragon Saber, headgear","Subduing Dragon Saber, common","Subduing Dragon Saber, attire","Subduing Dragon Saber, belt","Gi¸ng Long Dao Thñ",103,100,101,102,0,1173},
		{"Subduing Dragon Saber, headgear","Subduing Dragon Saber, common","Subduing Dragon Saber, attire","Subduing Dragon Saber, belt","Gi¸ng Long Dao Thñ",103,100,101,102,0,1174}
		},
		{
		{"Wind Demon Saber, headgear","Wind Demon Saber, common","Phong Ma Dao Trang","Wind Demon Saber, belt","Phong Ma Dao C«n",103,100,101,102,5,1271},
		{"Wind Demon Saber, headgear","Wind Demon Saber, common","Phong Ma Dao Trang","Wind Demon Saber, belt","Phong Ma Dao C«n",103,100,101,102,5,1272},
		{"Wind Demon Saber, headgear","Wind Demon Saber, common","Phong Ma Dao Trang","Wind Demon Saber, belt","Phong Ma Dao C«n",103,100,101,102,5,1273},
		{"Wind Demon Saber, headgear","Wind Demon Saber, common","Phong Ma Dao Trang","Wind Demon Saber, belt","Phong Ma Dao C«n",103,100,101,102,5,1274}
		},
		{},
		{
		{"True Martial Saber, headgear","True Martial Saber, common","True Martial Saber, attire","True Martial Saber, belt","Ch©n Vò Dao KiÕm",103,100,101,102,2,1471},
		{"True Martial Saber, headgear","True Martial Saber, common","True Martial Saber, attire","True Martial Saber, belt","Ch©n Vò Dao KiÕm",103,100,101,102,2,1472},
		{"True Martial Saber, headgear","True Martial Saber, common","True Martial Saber, attire","True Martial Saber, belt","Ch©n Vò Dao KiÕm",103,100,101,102,2,1473},
		{"True Martial Saber, headgear","True Martial Saber, common","True Martial Saber, attire","True Martial Saber, belt","Ch©n Vò Dao KiÕm",103,100,101,102,2,1474}
		},
		{
		{"NhÊt D­¬ng Dao Qu¸n","NhÊt D­¬ng Dao Th­êng","NhÊt D­¬ng Dao Trang","NhÊt D­¬ng Dao Béi","NhÊt D­¬ng Dao Bót",103,100,101,102,9,1571},
		{"NhÊt D­¬ng Dao Qu¸n","NhÊt D­¬ng Dao Th­êng","NhÊt D­¬ng Dao Trang","NhÊt D­¬ng Dao Béi","NhÊt D­¬ng Dao Bót",103,100,101,102,9,1572},
		{"NhÊt D­¬ng Dao Qu¸n","NhÊt D­¬ng Dao Th­êng","NhÊt D­¬ng Dao Trang","NhÊt D­¬ng Dao Béi","NhÊt D­¬ng Dao Bót",103,100,101,102,9,1573},
		{"NhÊt D­¬ng Dao Qu¸n","NhÊt D­¬ng Dao Th­êng","NhÊt D­¬ng Dao Trang","NhÊt D­¬ng Dao Béi","NhÊt D­¬ng Dao Bót",103,100,101,102,9,1574}
		},
		{},
		{
		{"Cavalry General Helmet","Cavalry General Robe","Cavalry General Armor","Cavalry General Pendant","Cavalry General Spear",103,100,101,102,6,1771},
		{"Cavalry General Helmet","Cavalry General Robe","Cavalry General Armor","Cavalry General Pendant","Cavalry General Spear",103,100,101,102,6,1772},
		{"Cavalry General Helmet","Cavalry General Robe","Cavalry General Armor","Cavalry General Pendant","Cavalry General Spear",103,100,101,102,6,1773},
		{"Cavalry General Helmet","Cavalry General Robe","Cavalry General Armor","Cavalry General Pendant","Cavalry General Spear",103,100,101,102,6,1774}
		},
		{
		{"D­¬ng An Qu¸n","D­¬ng An Th­êng","D­¬ng An Trang","D­¬ng An Béi","D­¬ng An Cung",103,100,101,102,4,1871},
		{"D­¬ng An Qu¸n","D­¬ng An Th­êng","D­¬ng An Trang","D­¬ng An Béi","D­¬ng An Cung",103,100,101,102,4,1872},
		{"D­¬ng An Qu¸n","D­¬ng An Th­êng","D­¬ng An Trang","D­¬ng An Béi","D­¬ng An Cung",103,100,101,102,4,1873},
		{"D­¬ng An Qu¸n","D­¬ng An Th­êng","D­¬ng An Trang","D­¬ng An Béi","D­¬ng An Cung",103,100,101,102,4,1874}
		},
		{},
		{
		{"U Minh Thiªn Qu©n Qu¸n","U Minh Thiªn Qu©n Th­êng","U Minh Thiªn Qu©n Trang","U Minh Thiªn Qu©n Béi","U Minh Thiªn Qu©n §ao",103,100,101,102,7,2071},
		{"U Minh Thiªn Qu©n Qu¸n","U Minh Thiªn Qu©n Th­êng","U Minh Thiªn Qu©n Trang","U Minh Thiªn Qu©n Béi","U Minh Thiªn Qu©n §ao",103,100,101,102,7,2072},
		{"U Minh Thiªn Qu©n Qu¸n","U Minh Thiªn Qu©n Th­êng","U Minh Thiªn Qu©n Trang","U Minh Thiªn Qu©n Béi","U Minh Thiªn Qu©n §ao",103,100,101,102,7,2073},
		{"U Minh Thiªn Qu©n Qu¸n","U Minh Thiªn Qu©n Th­êng","U Minh Thiªn Qu©n Trang","U Minh Thiªn Qu©n Béi","U Minh Thiªn Qu©n §ao",103,100,101,102,7,2074}
		},
		{
		{"Miªu T©m Qu¸n","Miªu T©m Th­êng","Miªu T©m Trang","Miªu T©m Béi","Miªu T©m Tr¶o",103,100,101,102,11,2171},
		{"Miªu T©m Qu¸n","Miªu T©m Th­êng","Miªu T©m Trang","Miªu T©m Béi","Miªu T©m Tr¶o",103,100,101,102,11,2172},
		{"Miªu T©m Qu¸n","Miªu T©m Th­êng","Miªu T©m Trang","Miªu T©m Béi","Miªu T©m Tr¶o",103,100,101,102,11,2173},
		{"Miªu T©m Qu¸n","Miªu T©m Th­êng","Miªu T©m Trang","Miªu T©m Béi","Miªu T©m Tr¶o",103,100,101,102,11,2174}
		}
	}
	--Íæ¼ÒĞÅÏ¢»ñÈ¡ÒÔ¼°ÕûÀí
	local player_Route = GetPlayerRoute()
	local player_body = GetBody()
	--°ü´æÔÚ¼ì²â
	if GetItemCount(2,1,(1058+bag_diff)) == 0 then
		Talk(1,"","Xin x¸c nhËn trªn ng­êi cã mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return
	end
	--°üÊ¹ÓÃ³É¹¦¼ì²â
	if DelItem(2,1,(1058+bag_diff),1) == 0  then
		Talk(1,"","Xin x¸c nhËn trªn ng­êi cã mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return		
	end
	local add_flag = AddItem(0,canjiantao[player_Route][player_body][bag_diff+5],canjiantao[player_Route][player_body][11],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n sö dông:"..cangjian_bag_name[bag_diff].."§æi lÊy: "..canjiantao[player_Route][player_body][bag_diff].."!")
	else
		WriteLog("®æi Tµng KiÕm bao: Ng­êi ch¬i"..GetName().."sö dông:"..cangjian_bag_name[bag_diff].."§æi trang bŞ thÊt b¹i, kı hiÖu:"..add_flag)
	end
end
--*******************************Íæ¼ÒÁ÷ÅÉ¼ì²â********************************
function player_route_chk(player_Route)
	if player_Route == 0 or player_Route == 1 or player_Route == 5 or player_Route == 7 or player_Route == 10 
	or player_Route == 13 or player_Route == 16 or player_Route == 19 then
		return 0 
	else
		return 1
	end
end
