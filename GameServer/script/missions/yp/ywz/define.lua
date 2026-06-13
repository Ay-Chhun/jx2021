YWZ_SYSTEM_SWITCH = 1;

--Task define------------------------
YWZ_TASK_1 = 3387;
YWZ_TASK_2 = 3388;

--Limit----
YWZ_WEEK_TASK_LIMIT = 50; --ÖÜ³£ÈÎÎñÉÏÏŞ
YWZ_EX_TASK_AWARD = 15; --ÉÏ½»Ìì½¾Áî»ñÈ¡¶îÍâ½±ÀøÉÏÏŞ

--ÖÜ³£ÈÎÎñÁĞ±í
YWZ_WEEK_TASK_TABLE = {
	{20, "ThÇn §µn Hé Ph¸p", "Qilannai (174,222)"},
	{20, "NhËt ®µn hé ph¸p", "Qilannai (191,200)"},
	{20, "Giang Hå Tiªu TiÓu", "Qilannai (179,194)"},
	{20, "Hoa T«ng M«n Nh©n", "Qilannai (181,205)"},
	{20, "Nhai Th­îng S¬n TÆc", "Qilannai (160,209)"},
	{20, "NguyÖt §µn Hé Ph¸p", "Qilannai (149,202)"},
	{20, "Tinh §µn Hé Ph¸p", "Qilannai (172,183)"},
}

--RelayShareData---------------------
YWZ_SHARE_DATA = "_YWZ_DATA_";
-- 0, 0 [ÊÆÁ¦±àºÅ£¨´óÀí1£¬ÍÂŞ¬2£¬Î÷ÏÄ3£©] = ÊÆÁ¦¹±Ï×¶È
-- 0, 1 [GetName()] = ¸öÈË»ı·Ö(´óÀí)
-- 0, 2 [GetName()] = ¸öÈË»ı·Ö(ÍÂŞ¬)
-- 0, 3 [GetName()] = ¸öÈË»ı·Ö(Î÷ÏÄ)
-- 1, 0 ["WeekFlag"] = gf_GetWeekly() --¿çÖÜÖØÖÃ±ê¼Ç
