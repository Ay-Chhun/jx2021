--by liubo
--财富宝箱
Include("\\script\\lib\\globalfunctions.lua")

--给木箱奖励接口
--成功返回1，失败返回0
--使用前判断背包空间
function get_award_woodenbox()
	if gf_CheckEventDateEx(46) == 1 then
		if gf_AddItemEx2({2,1,30340,1},"Wooden Chest","Th莕 T礽 B秓 Rng","",0,1) ~= 1 then
			return 0
		end
  		gf_WriteLogEx("Than Tai Bao Ruong", "i th祅h c玭g", 1, "M閏 rng online") 		
		return 1
	end
	return 0
end