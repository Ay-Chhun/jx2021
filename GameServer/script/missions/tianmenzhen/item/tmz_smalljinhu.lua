
g_tItem = {"Little Little Golden Tiger", {2,95,696,1}};

g_tModels ={"Little Little Golden Tiger"};

Include("\\script\\item\\summon_pet_charm.lua")

_check = check;
function check()
	if GetFollower() ~= 0 then
		KillFollower();
		return 0;
	end
	return _check();
end
function create_pet(sName)
	SummonNpc(getPetModel(), sName)
end
