function OnUse()
	Say("Using the Carrot Small Gift Box gives you <color=yellow>one red carrot<color>. Do you want to use it?",2,
			"I want to use it/give_hongluobo",
			"Not now/end_say"
	)
end

function give_hongluobo()
	if DelItem(2,1,1094,1) == 1 then
		AddItem(2,1,1090,1)
	else
		Say("Please confirm you have a Carrot Small Gift Box on you!",0)
	end	
end

function end_say()
end