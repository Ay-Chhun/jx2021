--file name:item_star.lua
--author:yanjun
--create date:2007-9-25
--describe:07年兔小丫天涯海角种许愿星
MAP_ID = 117;

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID ~= MAP_ID then
		Talk(1,"","You can only light the wishing star at the Ends of the Earth!");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"Please enter the star's name:");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	if nMapID ~= MAP_ID then
		Talk(1,"","You can only light the wishing star at the Ends of the Earth!");
		return 0;
	end;
	if DelItem(2,1,1171,1) == 1 then
		local nNpcIndex = CreateNpc("透明人",sName,GetWorldPos());
		Msg2Player("May your wishes come true!");
		SetNpcLifeTime(nNpcIndex,1*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
	end;
end;