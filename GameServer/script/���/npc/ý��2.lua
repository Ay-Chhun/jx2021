g_InfoHeader = "<color=green>Matchmaker<color>:";
function main()
	local selTab = {
				"Ta muèn rêi khái s©n khÊu/leave",
				"Nothing/nothing",
				}
	Say(g_InfoHeader.."Ng­¬i muèn rêi khái kh«ng?",getn(selTab),selTab);
end;

function leave()
	NewWorld(150, 1600, 3141)
end;

function nothing()

end;