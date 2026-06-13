Include("\\script\\online\\snowbattle\\head.lua");
--ÌìÉ½Ñ©Ñý
function OnDeath(npcIdx)
	ModifyExp(80000000);
	AwardGenuineQi(5000);
	gf_AddItemEx2({2,1,30747,100}, "Hép Trang TrÝ Gi¸ng Sinh", "§¸nh trËn tuyÕt", "Thiªn S¬n TuyÕt Yªu", 0, 1)
	gf_AddItemEx2({2,1,30683,50}, "L«i Viªm Th¹ch", "§¸nh trËn tuyÕt", "Small Snow Monster", 0, 1)
	SetNpcLifeTime(npcIdx, 0);
	SB_OnBossDied();
end