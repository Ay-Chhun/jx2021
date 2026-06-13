--½Å±¾Ãû³Æ£ºÁéÆÇ¿ªÆô½Å±¾
--½Å±¾¹¦ÄÜ£ºµã»÷ÁéÆÇ¿ªÆôµÄ»Øµ÷½Å±¾£¬Ö÷ÒªÓÃÓÚ¿ªÆôÌõ¼şµÄÅĞ¶Ï
--´úÂë¿ª·¢ÈË£ºÁõÓî±ó
--´úÂë¿ª·¢Ê±¼ä£º2010-3-23
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\lib\\globalfunctions.lua")

function main(aptitude_name)
	if aptitude_name == "Danh Tuc" or aptitude_name == "Dao Ly" or aptitude_name == "Tuan Dat" or aptitude_name == "Chuoc Nhat" or aptitude_name == "Bach Chien" then
		if GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>"..aptitude_name.."<color>. C¸c h¹ cÇn ph¶i ®¹t ®¼ng cÊp 73 trë lªn vµ th«ng th¹o kü n¨ng cÊp 55.")
			return 0
		else
			return 1
		end
	end
	if aptitude_name == "Hµo m«n" or aptitude_name == "Doan Giao" or aptitude_name == "PhÇn V©n" or aptitude_name == "Ph¸ Qu©n" then
		if GetItemCount(2,0,30002) < 1 and GetItemCount(2,0,30003) < 1 and GetItemCount(2,0,30005) < 1 and GetItemCount(2,0,30006) < 1 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>"..aptitude_name.."<color>. Kh«ng cã Ên tİn trong hµnh trang cña b¹n.")
			return 0
		end		
	elseif aptitude_name == "Lac Ha" then
		if GetItemCount(2,0,30001) < 1 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>"..aptitude_name.."<color>. Kh«ng cã Vâ l©m thËp nhŞ sø trong hµnh trang cña b¹n.")
			return 0
		end		
	else
		Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>"..aptitude_name.."<color>.")
		return 0
	end
	--ÁéÆÇ¿ªÆôÌõ¼şÅĞ¶Ï
    return 1;
end
