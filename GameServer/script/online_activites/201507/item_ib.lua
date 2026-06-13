Include("\\script\\online_activites\\201507\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201507_ID) ~= 1 then
		Talk(1,"","VÀt ph»m Æ∑ h’t hπn!");
		return 0;
	end
	if VET_201507_Item1UseTime()<VET_201507_GetItem1MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "Intermediate Army Order", 2000, "Advanced Army Order"));
		return 0
	end
	if VET_201507_Item2UseTime()<VET_201507_GetItem2MaxUseTime() then
		Talk(1,"",format("Sˆ dÙng ÆÒ %d %s vµ %d %s mÌi Æ≠Óc dÔng!", 2000, "Intermediate Army Order", 2000, "Advanced Army Order"));
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end