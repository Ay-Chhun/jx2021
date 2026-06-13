Include("\\script\\lib\\globalfunctions.lua");

NN_MAIN = 2;
NN_SUB1 = 1;
NN_SUB2 = 30243;

NN_titleTable = 
{
	{"Live Without Love!", 65, 1},
	{"Peerless Resentment of Life", 65, 2},
	{"Beautiful Without Pride", 65, 3},
	{"Both Pretty and Charming", 65, 4},
	{"A Pretty Girl Against the Grain", 65, 5},
	{"Ugly Build, Pretty Structure", 65, 6},
	{"Teen of the Martial World", 65, 7},
	{"Sad Because of Being Handsome", 65, 8},
	{"Small, Healthy and Pretty", 65, 9},
	{"Doll of the Martial World", 65, 10},	
	{"M¸ Nh©n V‚ L©m", 65, 11},
	{"Beauty of the Martial World", 65, 12},
	{"Fair Maiden of the Martial World", 65, 13},
	{"Handsome Man of the Martial World", 65, 14},
	{"Hoa HÂng V‚ L©m", 65, 15},
	{"Amorous Wanderer", 65, 16},
	{"Nameless Hero", 65, 17},
	{"Swordsman Online 2", 65, 18}
};

function OnUse(itemIndex)
	local menu = {};
	menu[0] = "Ch‰n danh hi÷u c«n ÆÊi, hi÷u qu∂: kh∏ng t t c∂ t®ng 10"; 
	for i=1, getn(NN_titleTable) do
		tinsert(menu, NN_titleTable[i][1].."/#DoUse("..i..")");
	end
	gf_PageSay(menu, 1, 6);
end

function DoUse(index)
	if 1 == DelItem(NN_MAIN, NN_SUB1, NN_SUB2, 1) then
		local now = GetTime();
		local year, month, day, hour, minute, second = GmTime(GetTime()+8*60*60);
		--WriteLog("year: "..year..", month: "..month..", day: "..day..", hour: "..hour..", minute: "..minute..", second: "..second);
		local expireTime = MkTime(year, month, day, 23, 59, 59);
		--WriteLog("now: "..now..", expireTime: "..expireTime);
		AddTitle(NN_titleTable[index][2], NN_titleTable[index][3]);
		SetCurTitle(NN_titleTable[index][2], NN_titleTable[index][3]);
		SetTitleTime(NN_titleTable[index][2], NN_titleTable[index][3], GetTime() + 30*24*3600);
	end
end