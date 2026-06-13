-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 107, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("§øa bĞ ®¸ng th­¬ng", "green")..":"
quest_title = cf_ox_SetColor("Black blood", "yellow").."\n"
quest_detail = cf_ox_SetColor("Go to Emei to ask about the black blood stains", "gray").."\n\n"
quest_description_1 = quest_giver.."Nghe nãi D­¬ng NguyÖt s­ ë Nga My tinh th«ng y thuËt, nhê b»ng h÷u ®Õn ®ã hái xem c¸ch trŞ liÖu."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(122, 5)
	--CreateTrigger(0, 101, 71)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¾­Ñé½±Àø
	AddItem(2, 0, 16, 1)					-- ÈÎÎñµÀ¾ß ºÚÉ«µÄÑª
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Go to Emei to ask about the black blood stains")
	Say(quest_title..quest_detail..quest_description_1, 0)
end