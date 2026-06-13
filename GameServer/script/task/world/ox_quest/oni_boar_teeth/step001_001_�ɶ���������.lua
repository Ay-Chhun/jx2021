-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 51, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th«n d©n", "green")..":"
quest_title = cf_ox_SetColor("Boar Plague", "yellow").."\n"
quest_detail = cf_ox_SetColor("Head southwest to find the goods bag for the villager.", "gray").."\n\n"
quest_description_1 = quest_giver.."A! §¹i hiÖp! \n s¸ng nay lóc ho¶ng lo¹n ta ®· lµm mÊt tói hµng, bao nhiªu vèn liÕng ®Òu ë trong ®ã."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 51, 61)
	SetTask(111, 2)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Head southwest to find the goods bag for the villager.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end