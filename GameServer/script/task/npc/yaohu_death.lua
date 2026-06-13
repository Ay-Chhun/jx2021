function OnDeath(id)
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("lihai", "Le Hai", 6073, 1590, 3220);
	SetNpcLifeTime(npcIndex, 10);
	Msg2Player("Le Hai:".."Hoµng Nhi........")
	Msg2Player("Le Hai:".."Hoµng Nhi........")
	NpcChat(ncpIndex, "Hoµng Nhi........")
end