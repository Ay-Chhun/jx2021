-- ²É¼¯´úÀíÈË  npc
-- 2006-8-21 12:12

TISHEN_INDEX_ID = 100
TISHEN_ITEM_VALUE = 101

MAX_PAGE_ITEM_COUNT = 5
GOLD_PER_8_HOUR = 4
MAX_TISHEN_COUNT = 20

function GetPlayerSex()
	if GetSex() == 1 then
		return "ThiÕu hiÖp"
	else
		return "N÷ hiÖp "
	end
end

function main()
	local szSay = 
	{
		"Xem thö ng­êi ñy th¸c thu thËp ®­îc bao nhiªu!/see_gather_item",
		"Häc tËp tõ ng­êi ñy th¸c thu thËp/learn_exp",
		"Nhê ng­êi ñy th¸c thu thËp t×m nguyªn liÖu kh¸c/manage_tishen",
		"§éi lµm thuª, ta ph¶i nhê hä míi ®­îc/employ_tishen",
		"T×m hiÓu ng­êi ñy th¸c thu thËp/tishen_shuoming",
		"Nothing here!/end_say",
	}
	
	-- ¼ÆËã»ñµÃµÄÎïÆ·
	for i = 1, MAX_TISHEN_COUNT do
		CalcTishenGatherData(i)
	end
	
	-- Çå¿ÕÒÑµ½×î¸ßµÈ¼¶µÄÌæÉí²É¼¯¾­Ñé
	for i = 1, MAX_TISHEN_COUNT do
		local nSkillID = GetTishenGatherSkillID(i)
		local nSkillLevel = GetLifeSkillLevel(0, nSkillID)
		if nSkillLevel >= 99 then		-- µ½×î¸ßµÈ¼¶ÁË
			AddTishenGatherExp(i)		-- ¼Ó²»ÉÏ£¬µ«ÊÇÒªÇåµô
		end
	end
	
	Say("Position"..GetPlayerSex().."What do you need?", getn(szSay), szSay)	
end

function employ_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime >= 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- Now gathering  :"..szGatherItem.."  Remaining  :"..nHour.."h "..nMin.." minutes"..nSec.." Gi©y "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."Team"..szMsg.."/#employ_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."Team"..szMsg.."/#employ_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("I don't know!"..GetPlayerSex().."§éi nµo sÏ thu thËp?", getn(szSay), szSay)
	else
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."T¹i ®©y kh«ng m­ín ®éi ngò thu thËp", 0)
	end
end

function employ_tishen_info(nIndex)
	Say("May I ask"..GetPlayerSex().."How long do you want to commission?",
		4,
		"Dïng 1 ThÇn N«ng ®¬n--nhËn ®­îc 8 giê ñy th¸c thu thËp (thu phİ "..GOLD_PER_8_HOUR.." gold)/#yes_use(1,"..nIndex..")",
		"Dïng 2 ThÇn N«ng ®¬n--nhËn ®­îc 16 giê ñy th¸c thu thËp (thu phİ "..(GOLD_PER_8_HOUR * 2).." gold)/#yes_use(2,"..nIndex..")",
		"Dïng 3 ThÇn N«ng ®¬n--nhËn ®­îc 24 giê ñy th¸c thu thËp (thu phİ "..(GOLD_PER_8_HOUR * 3).." gold)/#yes_use(3,"..nIndex..")",
		"Let me see/main")
end

function yes_use(nCount, nIndex)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ ThÇn N«ng §¬n, kh«ng thÓ tiÕp tôc c«ng viÖc ñy th¸c thu thËp.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ ThÇn N«ng §¬n, kh«ng thÓ tiÕp tôc c«ng viÖc ñy th¸c thu thËp.", 0)
		return
	end

	local szName, nLastTime, szGatherItem = IsTishenGatherExist(nIndex)
	if szName == nil then
		return
	end
	
	local nTime = nCount * 8 * 3600 + nLastTime
	if nTime > 25 * 3600 then
		Say("!!"..GetPlayerSex().."NghØ ng¬i mét l¸t. \n<color=red>(Thêi gian thuª 1 lÇn kh«ng ®­îc qu¸ 25 giê)", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,343,nCount) == 1 then
		AddTishenGatherTime(nIndex, nCount * 8 * 3600)
		Msg2Player("Now gathering"..szGatherItem.." sÏ gióp b¹n thªm ["..(nCount * 8).."] hours")
	end
end

function manage_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime > 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- Now gathering  :"..szGatherItem.."  Remaining  :"..nHour.."h "..nMin.." minutes"..nSec.." Gi©y "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."Team"..szMsg.."/#manage_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."Team"..szMsg.."/#manage_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("I don't know!"..GetPlayerSex().."§éi nµo sÏ thu thËp?", getn(szSay), szSay)
	else
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."T¹i ®©y kh«ng m­ín ®éi ngò thu thËp", 0)
	end
end

function manage_tishen_info(nIndex)
	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	
	local nSkillID = GetTishenGatherSkillID(nIndex)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B¹n kh«ng cã kü n¨ng thu thËp, kh«ng thÓ thay ®æi!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Next page/#next_page("..nSkillID..")"
			break
		end
		tSay[i] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
	end
	tSay[getn(tSay)+1] = "Kh«ng muèn thu thËp nguyªn liÖu kh¸c, gièng ban ®Çu lµ ®­îc/end_say"
	Say("!!"..GetPlayerSex().." cÇn thu thËp lo¹i vËt phÈm nµo?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B¹n kh«ng cã kü n¨ng thu thËp, kh«ng thÓ thay ®æi!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		tSay[nIndex] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	local nIndexID = GetTaskTemp(TISHEN_INDEX_ID)
	tSay[nIndex] = "Previous page/#manage_tishen_info("..nIndexID..")"
	tSay[nIndex+1] = "Kh«ng muèn thu thËp nguyªn liÖu kh¸c, gièng ban ®Çu lµ ®­îc/end_say"
	
	Say("!!"..GetPlayerSex().." cÇn thu thËp lo¹i vËt phÈm nµo?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)

	Say("!!"..GetPlayerSex().."X¸c nhËn muèn thu thËp <color=yellow>"..szItem.."<color> ?",
		2,
		"Confirm/#change_gather("..nMapLevel..","..nSkillID..",\""..szItem.."\")",
		"Sai/end_say")
end

function change_gather(nMapLevel, nSkillID, szItem)
	local nIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nRet = ChangeTishenGather(nIndex, nMapLevel, nSkillID)
	if nRet > 0 then
		local nActionName = GetGatherSkillName(nSkillID)
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex()..", c¸i ng­êi nµy"..nActionName.."®éi ngò chuyÓn thµnh thu thËp <color=yellow>"..szItem.."<color>", 0)
	end
end

function see_gather_item()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			local szMsg = ""
			if nLastTime <= 0 then
				szMsg = " -- Thu thËp hoµn tÊt"
			else
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				szMsg =  " -- Now gathering  :"..szGatherItem.."  Remaining  :"..nHour.."h "..nMin.." minutes"..nSec.." Gi©y "
			end
			
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."Team"..szMsg.."/#seeinfo("..i..")"
			else
				szSay[ntIndex] = szName.."Team"..szMsg.."/#seeinfo("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("I don't know!"..GetPlayerSex().."®Şnh cho ®¸m ng­êi nµo ®i thu thËp vËt phÈm?", getn(szSay), szSay)
	else
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."T¹i ®©y kh«ng m­ín ®éi ngò thu thËp", 0)
	end
end

function seeinfo(nIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	for index, value in t do
		if nCount > MAX_PAGE_ITEM_COUNT then
			szSay[nCount] = "Next page/#next_item_page("..nIndex..","..nCount..")"
			break
		end
		-- n = nGenre << 24 | nDetail << 16 | nParticular
		local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		szSay[nCount] = index.."["..(value.nItemCount).."] c¸i/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
		nCount = nCount + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "LÊy tÊt c¶ vËt phÈm ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("§¸m ng­êi nµy thu thËp ®­îc mÊy vËt phÈm sau. <color=yellow>(Tr­íc khi lÊy vËt phÈm xin x¸c nhËn hµnh trang ®ñ kho¶ng trèng vµ søc lùc)<color>", getn(szSay), szSay)
	else
		Say("§¸m ng­êi nµy t¹m thêi ch­a thu thËp ®­îc vËt phÈm, mêi "..GetPlayerSex().."khi kh¸c quay l¹i!", 2, "trë l¹i/main", "Leave/end_say")
	end
end

function next_item_page(nIndex, nPageIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	local nPos = 1
	for index, value in t do
		if nPos >= nPageIndex then
			if nCount > MAX_PAGE_ITEM_COUNT then
				szSay[nCount] = "Next page/next_item_page("..nIndex..","..(MAX_PAGE_ITEM_COUNT + nPageIndex)..")"
				break
			end
			-- n = nGenre << 24 | nDetail << 16 | nParticular
			local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
			szSay[nCount] = index.."["..(value.nItemCount).."] c¸i/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
			nCount = nCount + 1
		end
		nPos = nPos + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "LÊy tÊt c¶ vËt phÈm ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("§¸m ng­êi nµy thu thËp ®­îc mÊy vËt phÈm sau. <color=yellow>(Tr­íc khi lÊy vËt phÈm xin x¸c nhËn hµnh trang ®ñ kho¶ng trèng vµ søc lùc)<color>", getn(szSay), szSay)
	end
end

function get_all_gather_item(nIndex)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ng­êi ñy th¸c thu thËp<color>: R­¬ng chøa ®å cña ng­¬i ®· khãa, kh«ng thÓ lÊy vËt phÈm cña nhãm thu thËp ra. ",0)
		return
	end

	local n = 0
	local t = GetTishenGatherItem(nIndex)
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		local nRet = UpdateTishenGatherInfo(nIndex, n, value.nItemCount)
		if nRet > 0 then
			local str = format("ChuÈn bŞ nhËn (%d,%d,%d) %d",value.nGenre,value.nDetail,value.nParticular,value.nItemCount)
			str = "[Gathering Commission]"..GetName()..str
			WriteLog(str)
			if AddItem(value.nGenre, value.nDetail, value.nParticular, value.nItemCount, 1) == 1 then
				WriteLog("[Gathering Commission]"..GetName().."NhËn vËt phÈm thµnh c«ng")
			end
		else
			Msg2Player("Hµnh trang vµ søc lùc cña b¹n ®· v­ît møc")
			break
		end
	end
end

--get_gather_item
function ggi(nItem, nMax, nIndex, sz)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ng­êi ñy th¸c thu thËp<color>: R­¬ng chøa ®å cña ng­¬i ®· khãa, kh«ng thÓ lÊy vËt phÈm cña nhãm thu thËp ra. ",0)
		return
	end

	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	SetTaskTemp(TISHEN_ITEM_VALUE, nItem)
	
	AskClientForNumber("get_gather_item_callback", 1, tonumber(nMax), "Take"..sz);
end

function get_gather_item_callback(nCount)
	local nTishenIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nItem = GetTaskTemp(TISHEN_ITEM_VALUE)
	if nTishenIndex == 0 or nItem == 0 then
		return
	end
	
	local t = GetTishenGatherItem(nTishenIndex)
	
	local nGatherCount = 0
	local nGenre = 0
	local nDetail = 0
	local nParticular = 0
	
	local n = 0
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		if n == nItem then
			nGatherCount = value.nItemCount
			nGenre = value.nGenre
			nDetail = value.nDetail
			nParticular = value.nParticular
			break
		end
	end
	
	if nCount > nGatherCount then
		nCount = nGatherCount
	end
	
	if nCount <= 0 then
		return
	end
	
	local nRet = UpdateTishenGatherInfo(nTishenIndex, n, nCount)
	if nRet > 0 then
		local str = format("ChuÈn bŞ nhËn (%d,%d,%d) %d",nGenre,nDetail,nParticular,nCount)
		str = "[Gathering Commission]"..GetName()..str
		WriteLog(str)
		if AddItem(nGenre, nDetail, nParticular, nCount, 1) == 1 then
			WriteLog("[Gathering Commission]"..GetName().."NhËn vËt phÈm thµnh c«ng")
		end
	else
		Msg2Player("Hµnh trang vµ søc lùc cña b¹n ®· v­ît møc")
	end
end

function learn_exp()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem, nExp = IsTishenGatherExist(i)
		if szName then
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."§éi ngò-- nhËn ®­îc kinh nghiÖm: ["..nExp.."]/#see_exp_info("..i..")"
			else
				szSay[ntIndex] = szName.."§éi ngò-- nhËn ®­îc kinh nghiÖm: ["..nExp.."]/#see_exp_info("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "Leave/end_say"
		Say("I don't know!"..GetPlayerSex().."®Şnh cho ®¸m ng­êi nµo ®i thu thËp kinh nghiÖm?", getn(szSay), szSay)
	else
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."T¹i ®©y kh«ng m­ín ®éi ngò thu thËp", 0)
	end
end

function see_exp_info(nIndex)
	local szSay = {}
	
	nRet = GetTishenGatherExp(nIndex)
	if nRet == nil then
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."Kh«ng cã kü n¨ng sèng, kh«ng thÓ nhËn kinh nghiÖm tõ nh©n c«ng thu thËp.", 0)
		AddTishenGatherExp(nIndex)	-- Ã»ÓĞ´ËÉú»î¼¼ÄÜµÄAdd²Ù×÷ÎªÇå¿Õ´ËÀàÌæÉíµÄ¾­Ñé
	elseif nRet > 0 then
		Say("<color=green>Gathering Agent<color>:"..GetPlayerSex().."Cã thÓ nhËn "..nRet.." ®iÓm thu thËp kinh nghiÖm. \n<color=red>Chó ı: Nh÷ng ®éi ngò thu thËp kh¸c kinh nghiÖm nhËn ®­îc sÏ bŞ xãa bá.<color>", 3, "NhËn ®iÓm/#yes_get_exp("..nIndex..")", "Xem nh÷ng ®éi ngò kh¸c/learn_exp", "Leave/end_say")
	else
		Say("§¸m ng­êi nµy t¹m thêi ch­a thu thËp ®­îc, mêi "..GetPlayerSex().."khi kh¸c quay l¹i!", 2, "trë l¹i/main", "Leave/end_say")
	end
end

function yes_get_exp(nIndex)
	local nAddExp, nSkillName = AddTishenGatherExp(nIndex)
	Msg2Player("B¹n nhËn ®­îc ["..nAddExp.."] ®iÓm"..nSkillName.." Kinh nghiÖm kü n¨ng ")
end

function tishen_shuoming()
	Say("Position"..GetPlayerSex().."muèn t×m hiÓu g× vÒ ñy th¸c thu thËp?",
		4,
		"ñy th¸c thu thËp cÇn nh÷ng g×?/wupinshuoming",
		"Gi¶i thİch ®éi ngò m­ín/duiwushuoming",
		"Sau khi ñy th¸c thu thËp t¹i n¬i ®ã nhËn kinh nghiÖm vµ vËt phÈm/lingqushuoming",
		"Leave./main")
end

function wupinshuoming()
	Say("Muèn ñy th¸c thu thËp cÇn KhÕ ­íc th­ vµ ThÇn N«ng ®¬n, t¹i khu vùc thu thËp sö dông KhÕ ­íc th­ lµ cã thÓ ñy th¸c, ThÇn N«ng ®¬n quyÕt ®Şnh thêi gian ñy th¸c. KhÕ ­íc th­ mua t¹i t¹p hãa, ThÇn N«ng ®¬n mua tõ chøc n¨ng Ngù c¸c.",0)
end

function duiwushuoming()
	Say("Sö dông KhÕ ­íc th­ m­ín 1 ®éi ngò, ta sÏ tr«ng thÊy chóng thu thËp vËt phÈm ®­îc chØ ®Şnh. Cã thÓ ®Õn <color=green>Ng­êi ñy th¸c thu thËp<color> xem ®· m­ín qua bao nhiªu ®éi ngò ñy th¸c thu thËp, thu thËp ®­îc vËt phÈm g× hoÆc ta cã thÓ thay ®æi vËt phÈm thu thËp.",0)
end

function lingqushuoming()
	Say("Ng­¬i cã thÓ ®Õn <color=green>Ng­êi ñy th¸c thu thËp<color> xem t×nh h×nh thu thËp, vËt phÈm thu thËp vµ kinh nghiÖm, khi ®ång thêi cã 2 ng­êi ñy th¸c thu thËp, nhËn phÇn th­ëng ng­êi kia xong, kinh nghiÖm ng­êi cßn l¹i sÏ xãa bá, vËt phÈm thu thËp kh«ng bŞ ¶nh h­ëng.",0)
end

function end_say()

end

