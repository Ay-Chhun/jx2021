
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(880000);
		Msg2Player("B¹n më hång bao nhËn ®­îc 88 vµng");
		WriteLog("[Marriage]:"..GetName().."Opened 1 small red envelope");
	end
end;