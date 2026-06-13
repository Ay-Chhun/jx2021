
-- GamveserverÆô¶¯Ê±Apply¹¥³ÇÕ½Êý¾Ý

Include("\\script\\lib\\string.lua")

t_can_do_arrest = 
{
	100,	--½­ÄÏÇø\ÈªÖÝ
	101,	--½­ÄÏÇø\º£Íâ¹Âµº
	102,	--½­ÄÏÇø\ÌÒ»¨µº
	103,	--½­ÄÏÇø\¶«º£º£±õÒ»
	104,	--½­ÄÏÇø\¶«º£º£±õ¶þ
	105,	--½­ÄÏÇø\ÈªÖÝ¸®Î÷
	106,	--½­ÄÏÇø\ÁúÈª´å
	107,	--½­ÄÏÇø\ÎäÒÄÉ½
	108,	--½­ÄÏÇø\ÈªÖÝ¸®±±
	109,	--½­ÄÏÇø\ÇåÒô¶´Ò»²ã
	110,	--½­ÄÏÇø\ÇåÒô¶´¶þ²ã
	111,	--½­ÄÏÇø\ÇåÏª¶´
	112,	--½­ÄÏÇø\Á½Ë®¶´Ò»²ã
	113,	--½­ÄÏÇø\Á½Ë®¶´¶þ²ã
	114,	--½­ÄÏÇø\ÍõÄ¸¶´Ò»²ã
	115,	--½­ÄÏÇø\ÍõÄ¸¶´¶þ²ã
	116,	--½­ÄÏÇø\ÍõÄ¸¶´Èý²ã
	117,	--½­ÄÏÇø\ÌìÑÄº£½Ç
	150,	--½­ÄÏÇø\ÑïÖÝ
	151,	--½­ÄÏÇø\ÔÆÃÎÔó
	200,	--ÖÐÔ­Ò»Çø\ãê¾©
	201,	--ÖÐÔ­Ò»Çø\ãê¾©¸®ÄÏ
	202,	--ÖÐÔ­Ò»Çø\ÐÓ»¨´å
	203,	--ÖÐÔ­Ò»Çø\ãê¾©¸®Î÷
	204,	--ÖÐÔ­Ò»Çø\ÉÙÁÖ
	205,	--ÖÐÔ­Ò»Çø\ãê¾©¸®¶«
	206,	--ÖÐÔ­Ò»Çø\ÑãÃÅ¹Ø·Ï
	207,	--ÖÐÔ­Ò»Çø\¶þÁúÉ½
	208,	--ÖÐÔ­Ò»Çø\ÁºÉ½²´
	209,	--ÖÐÔ­Ò»Çø\Ø¤°ï
	210,	--ÖÐÔ­Ò»Çø\ÑôÖÐ¶´Ò»²ã
	211,	--ÖÐÔ­Ò»Çø\ÑôÖÐ¶´¶þ²ã
	212,	--ÖÐÔ­Ò»Çø\ÑôÖÐ¶´Èý²ã
	213,	--ÖÐÔ­Ò»Çø\ÉÙÁÖÃÜÊÒÒ»²ã
	214,	--ÖÐÔ­Ò»Çø\ÉÙÁÖÃÜÊÒ¶þ²ã
	215,	--ÖÐÔ­Ò»Çø\ºÚ·ç¶´
	216,	--ÖÐÔ­Ò»Çø\ÏéÔÆ¶´
	217,	--ÖÐÔ­Ò»Çø\Ò°ÖíÁÖ
	218,	--ÖÐÔ­Ò»Çø\Áé±¦É½
	219,	--ÖÐÔ­Ò»Çø\Ìì²¨Ñî¸®
	300,	--ÖÐÔ­¶þÇø\³É¶¼
	301,	--ÖÐÔ­¶þÇø\³É¶¼¸®Î÷
	302,	--ÖÐÔ­¶þÇø\Çà³ÇÉ½
	303,	--ÖÐÔ­¶þÇø\¶ëáÒ
	304,	--ÖÐÔ­¶þÇø\³É¶¼¸®ÄÏ
	305,	--ÖÐÔ­¶þÇø\ÌÆÃÅ
	306,	--ÖÐÔ­¶þÇø\½­½ò´å
	307,	--ÖÐÔ­¶þÇø\·á¶¼
	308,	--ÖÐÔ­¶þÇø\³É¶¼¸®±±
	309,	--ÖÐÔ­¶þÇø\½£¸óÊñµÀ
	310,	--ÖÐÔ­¶þÇø\½£ÃÅ¹Ø
	311,	--ÖÐÔ­¶þÇø\·üÅ£É½
	312,	--ÖÐÔ­¶þÇø\Îäµ±
	313,	--ÖÐÔ­¶þÇø\ÌìÊ¦¶´Ò»²ã
	314,	--ÖÐÔ­¶þÇø\ÌìÊ¦¶´¶þ²ã
	315,	--ÖÐÔ­¶þÇø\±ùÐÄ¶´Ò»²ã
	316,	--ÖÐÔ­¶þÇø\±ùÐÄ¶´¶þ²ã
	317,	--ÖÐÔ­¶þÇø\ÖñË¿¶´Ò»²ã
	318,	--ÖÐÔ­¶þÇø\ÖñË¿¶´¶þ²ã
	319,	--ÖÐÔ­¶þÇø\·âÄ§¶´Ò»²ã
	320,	--ÖÐÔ­¶þÇø\·âÄ§¶´¶þ²ã
	321,	--ÖÐÔ­¶þÇø\½ð¹â¶´
	322,	--ÖÐÔ­¶þÇø\Áú»¢¶´Ò»²ã
	323,	--ÖÐÔ­¶þÇø\Áú»¢¶´¶þ²ã
	324,	--ÖÐÔ­¶þÇø\ÆßÐÇ¶´Ò»²ã
	325,	--ÖÐÔ­¶þÇø\ÆßÐÇ¶´¶þ²ã
	350,	--ÖÐÔ­¶þÇø\ÏåÑô
	326,	--ÖÐÔ­¶þÇø\ÄºÑ©É½×¯
	327,	--ÖÐÔ­¶þÇø\ÎÚÃÉ²¿
	328,	--ÖÐÔ­¶þÇø\¹íÃÅ»ØÀÈ
	329,	--ÖÐÔ­¶þÇø\ÌìÊ¦ÃØ¾³
	400,	--Î÷ÄÏÇø\´óÀí¸®
	401,	--Î÷ÄÏÇø\µã²ÔÉ½
	402,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉ±±²¿
	403,	--Î÷ÄÏÇø\Î÷Ë«°æÄÉÄÏ²¿
	404,	--Î÷ÄÏÇø\´äÑÌ
	405,	--Î÷ÄÏÇø\ÎäÁêÉ½½Å
	406,	--Î÷ÄÏÇø\ÎäÁêÉ½
	407,	--Î÷ÄÏÇø\Îå¶¾½Ì
	408,	--Î÷ÄÏÇø\ÃçÁë
	409,	--Î÷ÄÏÇø\Ç§Ñ°ËþÒ»²ã
	410,	--Î÷ÄÏÇø\Ç§Ñ°Ëþ¶þ²ã
	411,	--Î÷ÄÏÇø\Ç§Ñ°ËþÈý²ã
	412,	--Î÷ÄÏÇø\ÁúÑÛ¶´Ò»²ã
	413,	--Î÷ÄÏÇø\ÁúÑÛ¶´¶þ²ã
	414,	--Î÷ÄÏÇø\·ïÑÛ¶´
	415,	--Î÷ÄÏÇø\·ïÑÛ¶´¶þ²ã
	416,	--Î÷ÄÏÇø\°×Ë®¶´Ò»²ã
	417,	--Î÷ÄÏÇø\°×Ë®¶´¶þ²ã
	418,	--Î÷ÄÏÇø\ÈëÃÅÃÔ¹¬Ò»
	419,	--Î÷ÄÏÇø\ÈëÃÅÃÔ¹¬¶þ
	420,	--Î÷ÄÏÇø\Ñà×Ó¶´Ò»²ã
	421,	--Î÷ÄÏÇø\Ñà×Ó¶´¶þ²ã
	422,	--Î÷ÄÏÇø\Íò¶¾Õ¯
	500,	--Î÷±±Çø\·ïÏè
	501,	--Î÷±±Çø\·ïÏè¸®ÄÏ
	502,	--Î÷±±Çø\»ªÉ½
	503,	--Î÷±±Çø\ÇØÊ¼»ÊÁê
	504,	--Î÷±±Çø\·ïÏè¸®±±
	505,	--Î÷±±Çø\Ò©Íõ¹È
	506,	--Î÷±±Çø\É³Ä®ÃÔ¹¬
	507,	--Î÷±±Çø\ÁúÃÅÕò
	508,	--Î÷±±Çø\¹âÃ÷¶¥
	509,	--Î÷±±Çø\À¥ÂØ
	510,	--Î÷±±Çø\Ò©Íõ¶´
	511,	--Î÷±±Çø\¹ÅÑô¶´Ò»²ã
	512,	--Î÷±±Çø\¹ÅÑô¶´¶þ²ã
	600,	--±±Çø\ÍõÆì²¿Âä
	601,	--±±Çø\´ó²ÝÔ­Ò»
	602,	--±±Çø\´ó²ÝÔ­¶þ
	603,	--±±Çø\ÑãÃÅ¹ØÍâ·Ï
	604,	--±±Çø\ÑãÃÅ¹Ø
	889,	--»Ø·çÕ¯
}

function OnCityWarInit(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildCityWarData(szKey, nKey1, nKey2)
	end
end

-- ²ÎÊý£º±»¼©ÄÃÈËÎïµÄPlayerIndex
function DoArrest(pTargetIndex)
	if pTargetIndex <= 0 then
		return
	end
	-- ÅÐ¶ÏÊÇ·ñÔÚÄÜ¹»¼©ÄÃµÄµ×ÅÌÄÚ
	if can_do_arrest(pTargetIndex) == 1 then
		SetTaskTemp(10, 2132)
		SetTask(450, pTargetIndex)
		DoWait(5, 6, 5)
		local szName = GetName()
		local nOldPlayer = PlayerIndex
		PlayerIndex = pTargetIndex
		-- ÔÝÊ±¼òµ¥ÌáÊ¾Ò»ÏÂ°É
		Msg2Player("B¹n ®ang bÞ "..szName.."Pursue")
	end
end

-- ²ÎÊý£º±»É±ÈËµÄPlayerIndex
function OnKill(nKillerIndex)
	SetReviveCD(1, 10)			-- ±»ÌáÏ½É±ËÀÓÐ10ÃëËÀÍöCD
end

-- ²ÎÊý£ºÐèÒª½»µÄµØÍ¼,Î¬»¤·Ñ,µ¥Î»½ð
function GetOutlay(nMapID, nGold)
	nGold = floor(nGold * 1.5)
	if nGold < 1500 then
		nGold = 1500
	elseif nGold > 20000 then
		nGold = 20000
	end
	SetCityWarOutlay(nMapID, nGold)
end

function can_do_arrest(pTargetIndex)
	if GetPKValue() >= 4 then
		Msg2Player("TrÞ PK nhá h¬n 4 giê míi ®­îc truy n· ng­êi ch¬i!")
		return 0
	end
	
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("CÇn ph¶i cã 1 Thµnh §« TÇm N· LÖnh míi cã thÓ truy n· ng­êi ch¬i!")
		return 0
	end
	
	if GetDeathPunish() == 0 then
		Msg2Player("B¶n ®å kh«ng cã trõng ph¹t tö vong kh«ng ®­îc truy n·!")
		return 0
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = pTargetIndex
	local nPKValue = GetPKValue()
	local nIsOffline = IsOfflineLive()
	PlayerIndex = nOldPlayer
	if nPKValue == 0 then
		Msg2Player("Kh«ng ®­îc truy n· ng­êi ch¬i kh«ng cã trÞ PK!")
		return 0
	end
	
	if nIsOffline == 1 then
		Msg2Player("Kh«ng ®­îc truy n· ng­êi ch¬i rêi m¹ng ñy th¸c!")
		return 0
	end
	
	local nMapID = GetWorldPos()
	local isExist = 0
	-- µØÅÌÅÐ¶Ï
	for index, value in t_can_do_arrest do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player("Khu vùc hiÖn t¹i kh«ng ®­îc truy n· ng­êi ch¬i!")
		return 0
	end
	
	local tSpecailMap =
	{
		[100] = {200, 300, 350, 400, 500, 150},
		[300] = {200, 100, 350, 400, 500, 150},
		[350] = {200, 100, 300, 400, 500, 150},
	}
	local nBelongMap, nDuty = GetCityWarDutyFlag()
	if tSpecailMap[nBelongMap] ~= nil then
		for index, value in tSpecailMap[nBelongMap] do
			if nMapID == value then
				Msg2Player("Kh«ng ®­îc truy n· ng­êi ch¬i trong thµnh ch­a chiÕm lÜnh.")
				return 0
			end
		end
	end
	return 1
end

-- ³ÇÊÐÊ§Ð§Ê±¶ÔÍæ¼ÒËù×öµÄ²Ù×÷
function FireOut(szRoleName)
	DoScriptByName(szRoleName,"\\script\\gongcheng\\city_manage\\manage_head.lua","do_fire_out")
end

function do_fire_out()
	-- ÒÆ³ý³ÆºÅ
	for i = 1, 12 do
		RemoveTitle(51, i)
	end
	-- ÒÆ³ýÎïÆ·£¬³É¶¼Ö®Ó¡£¬¾üÊ¦£¬ÌáÏ½ÈÎÃüÊé
	local n = BigGetItemCount(2,1,1207)
	if n > 0 then
		BigDelItem(2,1,1207,n)
	end
	
	n = BigGetItemCount(2,1,1204)
	if n > 0 then
		BigDelItem(2,1,1204,n)
	end
	
	n = BigGetItemCount(2,1,1205)
	if n > 0 then
		BigDelItem(2,1,1205,n)
	end
end

function player_task_clear()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
	local nBodyTime = GetTask(448)
	if nBodyTime < nTime then	-- ÒÑ¾­²»ÊÇ±¾ÖÜµÄÁË
		CustomDataSave("tongcitywar_person_task","dddd",0,0,0,0)
		SetTask(448,nTime)
	end
end
