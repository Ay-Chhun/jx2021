Include("\\script\\online_activites\\2010_12\\activites_01\\head.lua")

function main()
	local tSay = {}
	local szHeader = "Merry Christmas 2010."
	
	tinsert(tSay, "Trang trÝ c©y th«ng mõng n¨m míi./makeup_xmas_tree")
	tinsert(tSay, "Submit Dry Firewood./give_wood_201012")
	tinsert(tSay, "What a beautiful pine tree./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end