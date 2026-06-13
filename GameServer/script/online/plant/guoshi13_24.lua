--Event 2010 November  2010-11-23

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\vng\\config\\newserver.lua");

-- So 9880, 30,30,30, ... la so gi vay ?
tFruitAwardNov2010 =
{
	[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Longan"},
	[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Rambutan"},
	[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
	[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "Coconut"},
	[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "Mangosteen"},
	[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "Pomelo"},
	[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "Strawberry"},
	[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Banana"},
	[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Mango"},
	[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "Peach"},
	[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "Plum"},
	[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "Lychee"},
	[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "Apple"},
	[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "Avocado"},
	[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, "Papaya"},
	[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "Soursop"},
	[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Pineapple"},
	[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "Li"},
	[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "Langsat"},
	[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "Star Fruit"},
}

function fruitcheckserverNov()
	--local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	
	local nServerID = GetGlbValue ( 1023 )  -- server id
	for i = 1, getn(tFruitAwardServerGroupNov) do
		for j = 1, getn(tFruitAwardServerGroupNov[i]) do
			if nServerID == tFruitAwardServerGroupNov[i][j] then
				return i
			end
		end	
	end
	return 0
end

