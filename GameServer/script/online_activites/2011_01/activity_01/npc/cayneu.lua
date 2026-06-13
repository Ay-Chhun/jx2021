Include("\\script\\online_activites\\2011_01\\activity_01\\head.lua");

function main()
	local tSay = {}
	local szHeader = "Chóc mõng n¨m míi T©n M·o."
	
	tinsert(tSay, "Submit Five-Fruit Trays./PB_give_5fruit")
	tinsert(tSay, "The Tet pole is truly beautiful./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end