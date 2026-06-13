--随机生成兔小丫NPC脚本,顺便打开一个MISSION
tMap = {
	{"Quanzhou", 100, 1459, 2811},
	{"Bianjing", 200, 1169, 2845},
	{"Chengdu", 300, 1653, 3559},
	{"Xiangyang", 350, 1436, 2808},
	{"Yangzhou", 150, 1680, 3118},
	{"Dali", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	AddGlobalNews("Exam Official Little Rabbit has already"..tMap[nMapID][1].."set up the exam hall. Everyone hurry over to join the first Imperial Examination of Swordsman 2!")
	Msg2Global("Exam Official Little Rabbit has already"..tMap[nMapID][1].."set up the exam hall. Everyone hurry over to join the first Imperial Examination of Swordsman 2!")	
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("兔小丫","兔小丫",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC生存时间1小时
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
