-- ¸´Èü

-- ¸´ÈüµÄÄÚÈÝ±í
-- ·µ»ØÖµÎªµÃ·Ö
-- µÚÒ»ÁÐÊÇËµÃ÷£¬µÚ¶þÁÐÊÇ³õÊ¼Öµ£¬µÚÈýÁÐÊÇµ±Ç°µÄÖµ
tQUARTER_FINAL_HEAD =
{
	{"cã ph¶i ®· ®¹t ®­îc cÊp 70                             ","return 0"					, "return ChkLevel()"	},
	{"cã ph¶i ®· häc ®­îc kü n¨ng vâ c«ng cÊp 55                     ","return 0"					, "return ChkLearnSkill()"	},
	{"Hoµn thµnh nhiÖm vô th­¬ng héi, sè l­ît lµ:                         ","return GetShanghuiChance()", "return GetShanghuiChance()"},
	{"Hoµn thµnh nhiÖm vô Truy n·, sè l­ît lµ:                         ","return GetTongjiChance()"	, "return GetTongjiChance()"}, 
	{" ®iÓm tÝch lòy chiÕn tr­êng                                 ","return GetBattlePoint()"	, "return GetBattlePoint()"},
	{"cã ph¶i ®· hoµn thµnh n.v chñ tuyÕn BiÖn Kinh - Long Hæ Th«n S¬n Hµ.        ","return 0"					, "return ChkTask(140, 59)"	},
	{"cã ph¶i ®· hoµn thµnh n.v chñ tuyÕn Thµnh §« - Thanh phong dÜ khø","return 0"					, "return ChkTask(150, 33)"	},
	{"cã ph¶i ®· hoµn thµnh n.v chñ tuyÕn TuyÒn Ch©u, hiÓu ®­îc ch©n t­íng?          ","return 0"					, "return ChkTask(147, 7)"	},
	{"cã ph¶i ®· hoµn thµnh nhiÖm vô Phong §« - ®¸nh b¹i Ng« ViÖt l·o tæ  ","return 0"					, "return ChkTask(1402, 90)"	},
	{"cã ph¶i ®· hoµn thµnh nhiÖm vô Thiªn M«n TrËn- håi ©m cho D­¬ng NghiÖp        ","return 0"					, "return ChkTaskTmz()"	},
	{"cã ph¶i ®· hoµn thµnh n.v chñ tuyÕn T©y Nam - c¬n phÉn né cña Ngò §éc Gi¸o      ","return 0"					, "return ChkTask(1316, 3)"	},
	{"Thªm l­u ph¸i                                 ","return 0"					, "return GetRouteAddition()"	},
}

THE_FILE = "\\script\\online\\crosscountry\\quarter_final.lua"

function GetRouteAddition()
	local t =
	{
		[8] = 5,	-- ¶ëáÒ·ð¼Ò
		[9] = 10,	-- ¶ëáÒË×¼Ò
		[17] = 5, 	-- Ç¹Æï
		[18] = 10, -- ¹­Æï
		[20] = 10, -- Ð°ÏÀ
		[21] = 10, -- ¹ÆÊ¦
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		return t[nRoute]
	end
end

function ChkTaskTmz()
	if GetTask(1401) == 125 or GetTask(1401) == 135 then
		return 5
	else
		return 0
	end
end

function ChkTask(nTaskid, nValue)
	if GetTask(nTaskid) >= nValue then
		return 5
	else
		return 0
	end
end

function ChkLevel()
	if GetLevel() >= 70 then
		return 5
	else
		return 0
	end
end

function ChkLearnSkill()
	t =
	{
		[2] = 31,	-- ÉÙÁÖË×¼Ò£¬´ïÄ¦Îä¾­
		[3] = 56,	-- ÉÙÁÖìøÉ®£¬´óÁ¦½ð¸ÕÖ¸
		[4] = 43,	-- ÉÙÁÖÎäÉ®£¬ÉÙÁÖÁú×¦ÊÖ
		[6] = 73,	-- ÌÆÃÅ£¬ÂúÌì»¨Óê
		[8] = 88,	-- ¶ëáÒ·ð¼Ò£¬´ó´È´ó±¯Öä
		[9] = 101,	-- ¶ëáÒË×¼Ò£¬ÃÔÐÄÆ®ÏãÇú
		[11] = 112,	-- Ø¤°ï¾»ÒÂ£¬×íÈ­
		[12] = 123, -- Ø¤°ïÎÛÒÂ£¬´ò¹·¹÷·¨
		[14] = 145, -- ÎäµÀ£¬ÕæÎäÆß½Ø½£
		[15] = 158, -- ±ÊÎä£¬ÉÏÇåÎÞ¼«¹¦
		[17] = 731, -- Ç¹Æï£¬±ÌÔÂ·ÉÐÇÇ¹
		[18] = 744, -- ¹­Æï£¬Á÷¹â¾øÓ°¼ý
		[20] = 377, -- Ð°ÏÀ£¬Ê¬ÁÑÄ§¹¦
		[21] = 363, -- ¹ÆÊ¦£¬ÐQ¹Æ
		[23] = 1030,
		[29] = 1176,
		[30] = 1229,
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		local nRet = HaveLearnedSkill(t[nRoute])
		if nRet == nil then
			return 0
		elseif nRet == 0 then
			return 0
		else
			return 5
		end
	end
end

function GetShanghuiChance()
	local nReadyLun = CustomDataRead("yueye_shanghui")		-- ÒÑ¾­Íê³ÉµÄÂÖÊý
	if nReadyLun == nil then
		nReadyLun = 0
	end
	local nLun = floor(GetTask(390) / 10)
	return nReadyLun + nLun
end

function GetShanghuiChanceDiff(nLun)
	if nLun < 0 then
		return 0
	end
	
	local nLun = floor(nLun / 10)
	if nLun >= 20 then
		nLun = 20
	end
	return nLun * 2
end

function GetBattlePoint()
	return GetTask(747)
end

function GetBattlePointDiff(nPoint)
	if nPoint < 0 then
		return 0
	end
	
	local nDiff = floor(nPoint / 10000)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff * 5
end

function GetTongjiChance()
	return GetTask(1108)
end

function GetTongjiChanceDiff(nChance)
	if nChance < 0 then
		return 0
	end
	
	local nDiff = floor(nChance / 20)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff
end

function GetCaptainIndex()
	return GetTeamMember(0)
end

function YY_SaveData(szKey, t)
	local nCount = getn(t)
	local szFormat = ""
	local szResult = ""
	local szSplit = ", "
	local nSplitLen = strlen(szSplit)
	for i=1, nCount do
		if type(t[i]) == "number" and floor(t[i]) == t[i] then
			szFormat = szFormat.."d"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "number" then
			szFormat = szFormat.."f"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "string" then
			szFormat = szFormat.."s"
			szResult = szResult..format("%q", t[i])..szSplit
		end
	end
	szResult = strsub(szResult, 1, strlen(szResult) - nSplitLen)
	szResult = "CustomDataSave("..format("%q", szKey)..szSplit..format("%q", szFormat)..szSplit..szResult..")"
	dostring(szResult)
end

function YY_GetData(...)
	local t = {}
	for i=1, getn(arg) do
		if tonumber(arg[i]) == nil then
			t[i] = arg[i]
		else
			t[i] = tonumber(arg[i])
		end
	end
	return t
end

-- ¸ù¾ÝtQUARTER_FINAL_HEAD±íÉú³É½á¹û±íµÄ½á¹¹
function YY_MakeQuarterFinalInfo(nType)
	local tResult = {}
	
	-- Èç¹ûÊÇÉú³É³õÊ¼»¯µÄÊý¾Ý£¬ÔòÌáÇ°ÓÐÐ§µÄÊý¾Ý¶¼¼ÇÎª0
	if nType == 0 then
		nRow = 2
	elseif nType == 1 then
		nRow = 3
	end
	
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tResult[i] = dostring(tQUARTER_FINAL_HEAD[i][nRow])
	end
	return tResult
end

function qf_team_operation()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	
	local szSay = "Ng­¬i muèn tiÕn hµnh thao t¸c nµo?"
	local t =
	{
		"Register for the semifinal battle./qf_signup",
	}
	if szCaptainName ~= nil then
		tinsert(t, 2, "Tra xem ®é cèng hiÕn cña m×nh./qf_offer")
		if szCaptainName == "" then
			tinsert(t, 3, "Tra xem kÕt qu¶/queue_member_status")
			tinsert(t, 4, "Tra xem tæng ®iÓm chiÕn ®éi./refer_point")
		end
	end
	tinsert(t, getn(t)+1, "Leave/end_say")
	Say(szSay, getn(t), t)
end

function qf_offer()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Talk(1, "", "ChØ cã thµnh viªn chiÕn ®éi míi lµm ®­îc.")
		return
	end
	
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	nPoint = CountPoint(tDiff)
	local szSay = "chiÕn ®éi cña b¹n, ®é cèng hiÕn lµ: <color=yellow>["..nPoint.."]<color> ®iÓm\n(cã thÓ ®é cèng hiÕn chiÕn ®éi nhiÒu h¬n so víi thùc tÕ do sù sai biÖt thêi gian tÝnh to¸n)"
	Say(szSay, 2, "Tra xem t×nh h×nh chiÕn ®éi./show_detail", "Leave/end_say")
end

function show_detail()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." Points: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Next page/next_page","Leave/end_say")
end

function next_page()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	local nCount = getn(tQUARTER_FINAL_HEAD)
	for i=7, nCount do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." Points: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Previous page/show_detail","Leave/end_say")
end

function queue_member_status()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "ChØ cã ®éi tr­ëng chiÕn ®éi míi cã thÓ lµm thao t¸c nµy.")
	end
	
	local szSay = "B¹n muèn xem tin tøc thµnh viªn nµo?"
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	for i=1, getn(tMember) do
		tMember[i] = tMember[i].."/#show_member_status("..i..")"
	end
	tinsert(tMember, getn(tMember) + 1, "Leave/end_say")
	Say(szSay, getn(tMember), tMember)
end

function refer_point()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "ChØ cã ®éi tr­ëng chiÕn ®éi míi cã thÓ lµm thao t¸c nµy.")
	end
	
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local nPoint = 0
	for i=1, getn(tMember) do
		local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
		nPoint = nPoint + CountPoint(tMemberResult)
	end
	-- ÅÅÃû
	AddRelayShareData("yueye", 0, 0, THE_FILE,
						"AddShareDataCallBack", 2, GetName(), "d", nPoint)
	-- ´æÅÌ£¬±£³ÖÊý¾ÝºÍrelayÊÇÒ»ÖÂµÄ
	SaveNow()
	Say("B¹n ®· cËp nhËt thµnh c«ng ®iÓm chiÕn ®éi ®éi m×nh, h·y tra xem tin tøc míi nhÊt vÒ thø h¹ng chiÕn ®éi cña b¹n.", 0)
end

function show_member_status(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	local nPoint = CountPoint(tDiff)
	szShow = "Tæng ®iÓm: <color=yellow>"..nPoint.."<color>\n"
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." Points: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Next page/#member_next_page("..index..")","trë l¹i/queue_member_status", "Leave/end_say")
end

function member_next_page(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	for i=7, getn(tQUARTER_FINAL_HEAD) do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." Points: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Previous page/#show_member_status("..index..")","trë l¹i/queue_member_status", "Leave/end_say")
end

function qf_signup()
	if check_can_signup() ~= 1 then
		return
	end
	
	local nSize = GetTeamSize()
	local szSay = "ChiÕn ®éi cña b¹n ®· tháa ®iÒu kiÖn b¸o danh,"
	if nSize < 8 then
		szSay = szSay.."<color=red>sè thµnh viªn 1 chiÕn ®éi tèi ®a lµ 8 ng­êi, hiÖn ®· cã"..nSize.." thµnh viªn<color>, b¹n cã ®ång ý b¸o danh kh«ng?"
	else
		szSay = szSay.."Register?"
	end
	
	Say(szSay, 3, "Tra xem danh s¸ch thµnh viªn/show_member_list", "\nagree to register\n\n/confirm_signup", "Let me think about it!/end_say")
end

function show_member_list()
	-- Éú³É¶ÓÔ±ÐÅÏ¢
	local nSize = GetTeamSize()
	local nCount = 1
	tMember = {}
	szMemberInfo = "Team leader:<color=yellow>"..GetName().."<color>"
	local nOldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 and PlayerIndex ~= GetCaptainIndex() then
			szMemberInfo = szMemberInfo.."\nThµnh viªn"..nCount..":<color=green>"..GetName().."<color>"
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldPlayer
	Talk(1, "qf_signup", szMemberInfo)
end

function check_can_signup()
	-- ²»×é¶ÓÊÇ²»ÐÐµÎ
	local nResult = 1
	if GetTeamSize() < 1 then
		Say("ChØ cã lËp tæ ®éi míi cã thÓ tham gia trËn b¸n kÕt.", 2, "Liªn quan t¹o lËp tæ ®éi./about_quarter_final_team", "Leave/end_say")
		return 0
	end
	
	-- ²»ÊÇ¶Ó³¤ÊÇ²»ÐÐµÎ
	if PlayerIndex ~= GetCaptainIndex() then
		Say("ChØ cã ®éi tr­ëng míi cã thÓ b¸o danh", 2, "Liªn quan t¹o lËp tæ ®éi./about_quarter_final_team", "Leave/end_say")
		return 0
	end
	
	-- ¶Ó³¤²»ÊÇ±ÈÈüÕÊºÅ£¬Ã»ÓÐÍê³É³õÈüÊÇ²»ÐÐµÎ
	if GetTask(1785) == 0 then
		Say("§éi tr­ëng ph¶i lµ tµi kho¶n tham gia ch¹y bé ®ång thêi ®¼ng cÊp ph¶i tõ 30 trë lªn míi cã thÓ tham gia b¸o danh.", 2, "Liªn quan t¹o lËp tæ ®éi./about_quarter_final_team", "Leave/end_say")
		return 0
	end
	
	-- ¶ÓÔ±ÖÐÒÑ¾­×é½¨¹ý¶ÓÎé»òÕß²Î¼Ó¹ý¶ÓÎéµÄÈËÊÇ²»ÐÐµÎ
	local nOldPlayer = PlayerIndex
	local szMsg = ""
	local szSplit = ","
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRet = CustomDataRead("yueye_is_join_team")
		if nRet ~= nil then
			nResult = 0
			szMsg = szMsg.."<color=yellow> "..GetName().."<color>"..szSplit
		end
	end
	PlayerIndex = nOldPlayer
	if nResult == 0 then
		szMsg = strsub(szMsg, 1, strlen(szMsg) - strlen(szSplit))
		szMsg = szMsg.."B¹n ®· lµ thµnh viªn cña chiÕn ®éi kh¸c, kh«ng thÓ t¹o lËp tæ ®éi míi."
		PlayerIndex = nOldPlayer
		Say("<color=green>Cross-country messenger<color>:"..szMsg, 0)
	end
	return nResult
end

function qf_get_award()
	-- ²»ÊÇÕ½¶ÓÀïµÄÈËÊÇ²»ÐÐµÎ
	local isCaptain = 0
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Say("ChØ cã thµnh viªn chiÕn ®éi míi cã thÓ nhËn phÇn th­ëng.", 0)
		return
	elseif szCaptainName ~= "" then		-- ¶ÓÔ±
		-- ²»×é¶ÓÊÇ²»ÐÐµÎ
		if GetTeamSize() < 1 then
			Say("ChØ cã tæ ®éi cïng víi ®éi tr­ëng chiÕn ®éi míi cã thÓ nhËn phÇn th­ëng.", 0)
		end
		-- ¶Ó³¤²»ÊÇÕ½¶Ó¶Ó³¤ÊÇ²»ÐÐµÎ
		local nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex <= 0 then
			return 0
		end
		if szCaptainName ~= GetName() then
			Say("ChØ cã tæ ®éi cïng víi ®éi tr­ëng chiÕn ®éi míi cã thÓ nhËn phÇn th­ëng.", 0)
			return 0
		end
		PlayerIndex = nOldPlayer
	else
		isCaptain = 1
	end
	
	-- ½ñÌìÁì¹ýµÎÊÇ²»ÐÐµÎ
	local nDateNow = tonumber(date("%j"))
	if nDateNow <= nDate then
		Say("H«m nay b¹n ®· nhËn phÇn th­ëng.", 0)
		return 0
	end
	
	-- ok£¬¿ÉÒÔÁìÈ¡¹ÄÀøÁË
	local nReputation = 50
	ModifyReputation(nReputation, 0)
	Talk(1,"", "B¹n nhËn ®­îc "..nReputation.." ®iÓm danh väng. \n®iÓm tÝch lòy trËn b¸n kÕt cña b¹n ®· chuyÓn ®Õn ®éi tr­ëng.")
	WriteLog("Cross-Country Camp"..GetName().."§· nhËn phÇn th­ëng ngµy: "..nReputation.." ®iÓm danh väng"..date("%H%M"))
	-- ¼ÇÂ¼½ñÌìÁìÈ¡¹ýÁË
	CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDateNow)
	
	-- »ã×Ü»ý·Ö
	local nDiffDate = nDateNow - nDate
	qf_point_collect(nDiffDate, isCaptain)
end

function confirm_signup()
	if check_can_signup() ~= 1 then
		return
	end
	local nDate = tonumber(date("%j"))
	
	-- ¶Ó³¤¼ÇÂ¼¶ÓÎéÐÅÏ¢
	local nOldPlayer = PlayerIndex
	local szCaptainName = GetName()
	local nCount = 1
	local tMemberInfo = {}
	local tResult = {}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			tMemberInfo[i] = GetName()
			if PlayerIndex ~= GetCaptainIndex() then
				-- ÊÇ·ñÒÑ¾­×é½¨ÁËÕ½¶Ó£¬´æÔÚ´ËÏîÄ¿±íÊ¾ÒÑ¾­×é½¨¹ýÕ½¶Ó
				-- ¶ÓÔ±¼ÇÂ¼¶Ó³¤Ãû×Ö£¬ÔÙºóÊÇÉÏ´ÎÁìÈ¡¹ÄÀøÆ·µÄÊ±¼ä
				CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDate-1)
				
				tResult[nCount] = YY_MakeQuarterFinalInfo(0)
				-- Ã¿¸öÈËÉíÉÏ¼ÇÂ¼¸´Èü±ÈÈü¿ªÊ¼Ê±µÄÍê³ÉÇé¿ö
				YY_SaveData("yueye_quarter_final_default", tResult[nCount])
				YY_SaveData("yueye_quarter_final_last", tResult[nCount])
				nCount = nCount + 1
			end
		end
	end
	PlayerIndex = nOldPlayer
	
	-- ÊÇ·ñÒÑ¾­×é½¨ÁËÕ½¶Ó£¬´æÔÚ´ËÏîÄ¿±íÊ¾ÒÑ¾­×é½¨¹ýÕ½¶Ó£¬¶Ó³¤²»ÓÃ¼ÇÂ¼×Ô¼ºµÄÃû×Ö
	CustomDataSave("yueye_is_join_team", "sd", "", nDate-1)
	YY_SaveData("yueye_all_member_name", tMemberInfo)
	-- ¶Ó³¤ÉíÉÏÒ²Òª¼ÇÂ¼×Ô¼ºÔÚ¸´Èü±ÈÈü¿ªÊ¼Ê±µÄÍê³ÉÇé¿ö
	local tSelf = YY_MakeQuarterFinalInfo(0)
	YY_SaveData("yueye_quarter_final_default", tSelf)
	YY_SaveData("yueye_quarter_final_last", tSelf)
	
	-- ¶Ó³¤ÉíÉÏ¼ÇÂ¼ËùÓÐ¶ÓÔ±(°üÀ¨×Ô¼º)µÄ¸´Èü±ÈÈüÍê³ÉÇé¿ö(¼´¸´ÈüÒÔºó±ä»¯µÄÊý¾Ý)
	local tMemberResult = {}
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tMemberResult[i] = 0
	end
	for i=1, getn(tMemberInfo) do
		YY_SaveData(tMemberInfo[i], tMemberResult)
	end
	show_signup_result()
	-- Á¢¿Ì´æÅÌ
	nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			SaveNow()
		end
	end
	PlayerIndex = nOldPlayer
end

function show_signup_result()
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= GetCaptainIndex() then
			local szCaptainName = CustomDataRead("yueye_is_join_team")
			local szMsg = "B¹n ®· thµnh c«ng gia nhËp <color=green>"..szCaptainName.."<color> chiÕn ®éi."
			Talk(1, "", szMsg)
		else
			local t = YY_GetData(CustomDataRead("yueye_all_member_name"))
			local szMsg = "B¹n ®· thµnh c«ng t¹o lËp chiÕn ®éi, thµnh viªn lµ:"
			for i=1, getn(t) do
				szMsg = szMsg.."\n"..i..":<color=green>"..t[i].."<color>"
			end
			Talk(1, "", szMsg)
		end
	end
end

function CalcResult(nScale, tNow, tLast)
	local tResult = {}
	
	for i=1, getn(tLast) do
		tResult[i] = tonumber(tNow[i]) - tonumber(tLast[i])
	end

	-- ¸ù¾Ý»ý·Ö¹æÔòËã²îÒì
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		if i == 3 then		-- ÉÌ»á
			tResult[i] = GetShanghuiChanceDiff(tResult[i])
		elseif i == 4 then	-- Í¨¼©
			tResult[i] = GetTongjiChanceDiff(tResult[i])
		elseif i == 5 then	-- Õ½³¡
			tResult[i] = GetBattlePointDiff(tResult[i])
		end
		tResult[i] = tResult[i] * nScale
	end
	return tResult
end

function Add2Table(t1, t2)
	local tResult = {}
	for i=1, getn(t1) do
		tResult[i] = tonumber(t1[i]) + tonumber(t2[i])
	end
	return tResult
end

function qf_point_collect(nDiffDate, isCaptain)
	local nScale = 1
	if nDiffDate > 5 then
		nScale = 0.8
	end
	
	-- ¼ÆËã²îÖµ
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tLast = YY_GetData(CustomDataRead("yueye_quarter_final_last"))
	local tDiff = CalcResult(nScale, tNow, tLast)
	
	-- °ÑÏÖÔÚµÄ½á¹û±£´æÆðÀ´£¬ÓÃÓÚÏÂ´ÎËã²îÖµ
	YY_SaveData("yueye_quarter_final_last", tNow)
	
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		local t = YY_GetData(CustomDataRead(szName))
		tDiff = Add2Table(t, tDiff)
		YY_SaveData(szName, tDiff)
	end
	PlayerIndex = nOldPlayer
	
	if isCaptain == 1 then	-- ¶Ó³¤°ÑËùÓÐÊý¾Ý´¦Àíºó¼ÓÈëÅÅÐÐ°ñ
		local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
		local nPoint = 0
		for i=1, getn(tMember) do
			local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
			nPoint = nPoint + CountPoint(tMemberResult)
		end
		-- ÅÅÃû
		AddRelayShareData("yueye", 0, 0, THE_FILE,
							"AddShareDataCallBack", 2, GetName(), "d", nPoint)
		-- ´æÅÌ£¬±£³ÖÊý¾ÝºÍrelayÊÇÒ»ÖÂµÄ
		SaveNow()
	end
end

function qf_rank()
	ApplyRelayShareData("yueye", 0, 0, THE_FILE, "ApplyCallBack")
end

function ApplyCallBack(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Talk(1,"","HiÖn t¹i cuéc ®ua viÖt d· vÉn ch­a xÕp h¹ng.")
		return
	end
	
	local nRankCount = 0
	if nCount > 10 then
		nRankCount = 10
	else
		nRankCount = nCount
	end
	
	-- ÎÞÄÎ°¡£¬Ã»°ì·¨£¬Say,Talk¶¼²»ÄÜÍêÈ«ÏÔÊ¾10¸öÅÅÃû£¬Ö»ÄÜÕâÑùÁË
	CustomDataSave("yueye_rank_count", "d", nRankCount)
	for i=1, nRankCount do
		local t = YY_GetData(GetRelayShareDataByIndex(szKey, nKey1, nKey2, i - 1))
		YY_SaveData("yueye_rank"..i, t)
	end
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName ~= nil then
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		local nMySortType, szMyName, nMyPoint, nMyRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, szCaptainName)
		if nMySortType ~= nil then
			CustomDataSave("yueye_rank_mine", "sdd", szMyName, nMyPoint, nMyRank)
		else
			CustomDataSave("yueye_rank_mine", "sdd", "", 0, 0)
		end
	end
	
	-- ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
	show_rank_data(1)
end

function show_rank_data(index)
	local szResult = "Thø h¹ng®iÓm sè tªn ®éi tr­ëng"
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	local nRankCount = CustomDataRead("yueye_rank_count")
	if index > nRankCount then
		return
	end
	
	local nCount = index + 5	-- Ò»Ò³ÏÔÊ¾6¸öÅÅÃû
	if nCount > nRankCount then
		nCount = nRankCount
	end
	
	if szCaptainName == nil	then		-- Â·ÈË¿´½á¹ûÀ²
		for i=index, nCount  do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
		end
	else
		-- ¶Ó³¤×Ô¼º²é¿´
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		
		for i=index, nCount do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			if szCaptainName == szName then
				szResult = szResult..format("\n<color=yellow>%6d%12d        %s<color>", i, nPoint, szName)
			else
				szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
			end
		end
		local szMyName, nMyPoint, nMyRank = CustomDataRead("yueye_rank_mine")
		if szMyName ~= "" then
			szResult = szResult.."\nBattle team <color=green>["..szMyName.."]<color>, ®iÓm tÝch lòy chiÕn ®éi lµ <color=yellow>["..nMyPoint.."]<color>, ranked <color=yellow>["..(nMyRank + 1).."]<color>"
		else
			szResult = szResult.."\n<color=yellow>ChiÕn ®éi cña b¹n vÉn ch­a ®­a ®iÓm tÝch lòy, t¹m thêi vÉn ch­a xÕp h¹ng<color>"
		end
	end
	
	if index + 5 < nRankCount then
		Say(szResult, 2, "Next page/#show_rank_data(7)", "Leave/end_show_rank")
	else
		Say(szResult, 1, "Leave/end_show_rank")
	end
end

function end_show_rank()
	local nRankCount = CustomDataRead("yueye_rank_count")
	CustomDataRemove("yueye_rank_count")
	CustomDataRemove("yueye_rank_mine")
	for i=1, nRankCount do
		CustomDataRemove("yueye_rank"..i)
	end
end

function CountPoint(t)
	local nResult = 0
	for i=1, getn(t) do
		if t[i] ~= nil and t[i] >= 0 then
			nResult = nResult + t[i]
		end
	end
	return floor(nResult + 0.5)
end

function about_quarter_final_team()
	local szSay = "1. Mçi chiÕn ®éi tèi ®a 8 thµnh viªn, kh«ng h¹n chÕ m«n ph¸i. \n2. §éi tr­ëng chiÕn ®éi cÇn ph¶i lµ tµi kho¶n chuyªn dïng cho thi ®Êu, ®éi tr­ëng hoµn thµnh vßng s¬ lo¹i ph¶i ®¹t ®­îc tõ cÊp 30 trë lªn, thµnh viªn chiÕn ®éi cã thÓ sö dông tµi kho¶n kh«ng thi ®Êu tham gia thi ®Êu. \n3. Tõ trËn b¸n kÕt trë ®i, ®éi tr­ëng chiÕn ®éi tæ ®éi thµnh viªn cña tæ ®éi m×nh, gÆp NPC viÖt d· tiÕn hµnh b¸o danh. Lóc ®ã NPC viÖt d· sÏ b¸o cho b¹n biÕt sè thµnh viªn cã v­ît qu¸ quy ®Þnh 8 ng­êi kh«ng. \n4. Sau khi b¸o danh thµnh c«ng, chiÕn ®éi kh«ng thÓ tiÕp nhËn thªm thµnh viªn míi, ®ång thêi thµnh viªn trong chiÕn ®éi còng kh«ng thÓ tham gia chiÕn ®éi kh¸c."
	Say(szSay, 0)
end

function end_say()

end