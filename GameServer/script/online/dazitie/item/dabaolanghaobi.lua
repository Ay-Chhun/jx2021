function OnUse(nItem)
	Say(format("C¸c h¹ ®ång ý më %s nhËn%d c¸i %s kh«ng?","Large feather brush box",50,"Feather brush"),2,"Agree/ensure","Cancel/do_nothing")
end

function ensure()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
	end
	if DelItem(2, 1, 30453, 1) == 1 then
		AddItem(2, 1, 30451, 50);
	end
end

function do_nothing()
end
