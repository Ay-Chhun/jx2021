Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_move_speed_percent_add",30,30*18,1,178000);	--跑动速度提高30%，持续30秒
		Msg2Player("T鑓  ch箉 t╪g 30% trong 30 gi﹜");
		Msg2_LeiTai("Durian Mooncake");
	end;
end;