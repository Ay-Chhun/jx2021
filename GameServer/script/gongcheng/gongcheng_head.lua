--create date:07-04-10
--author:yanjun
--describe:¹¥³ÇÕ½½Å±¾Í·ÎÄ¼þ£¬¶¨ÒåÏà¹ØµÄ½Å±¾³£Á¿
Include("\\script\\gongcheng\\position.lua");
DEBUG_VERSION = 1;	--µ÷ÊÔ°æ±¾£¿
FREE_VERSION = 0;	--Ãâ·Ñ°æ±¾£¿
LIMIT_IGNORE = 0;	--ºöÂÔÒ»Ð©ÏÞÖÆ

TRUE = 1;
FALSE = 0;
NONE_ID = -1;		--²»ÊÇÈË
ALL_ID = 0;			--ËùÓÐÈË
GONG_ID = 1;		--¹¥³Ç·½ID
SHOU_ID = 2;		--ÊØ³Ç·½ID
GONG_RFM_ID = 3;	--¹¥³Ç·½ÍâÔ®ID
SHOU_RFM_ID = 4;	--ÊØ³Ç·½ÍâÔ®ID
GONGSHOU_ID = GONG_ID+SHOU_ID;	--ÓÃÀ´¼ÆËãµÐ¶ÔÕóÓªIDµÄ
--=======ÒÔÏÂÊÇtable³£Á¿================================================================
tCampNameP = 					--ÕóÓªÃû×Ö£¨Æ´Òô£©£¬ÉèÖÃÕóÓªµÄÊ±ºòÓÃµÄ
{
	[GONG_ID] = "gongcheng",
	[SHOU_ID] = "shoucheng",
}
tCampNameZ =					--ÕóÓªÃû×Ö£¨ÖÐÎÄ£©£¬ÏÔÊ¾¶Ô»°µÄÊ±ºòÓÃµÄ
{
	[GONG_ID] = "phe C«ng",
	[SHOU_ID] = "Phe Thñ thµnh",
}
tCityInfo = 			--¹¥³ÇµØÍ¼µÄÃû×Ö
{
	[1] = {"TuyÒn Ch©u",100,886},
	[2] = {"Thµnh §«",300,887},
	[3] = {"T­¬ng D­¬ng",350,888},
}
tItemInfo = 			--¹¥³ÇÕ½ÎïÆ·Ïà¹ØÐÅÏ¢
{
	[1] = {"C«ng thµnh Tiªn phong lÖnh",2,1,1203},
	[2] = {"Thñ VÖ lÖnh",2,1,1202},
	[3] = {"Dòng SÜ lÖnh",2,1,1201},
	[4] = {"Front Line Battle Report",2,1,1206},
	[5] = {"P_th­ëng C«ng Thµnh (th¾ng)",2,1,1208},
	[6] = {"P_th­ëng  C«ng Thµnh(b¹i)",2,1,1209},
}
tCityChannel = 			--¹¥³ÇÕ½³ÇÊÐÆµµÀ
{
	[1] = {"TuyÒn Ch©u thµnh ",27},
	[2] = {"Thµnh §« thµnh ",28},
	[3] = {"T­¬ng D­¬ng thµnh ",29},
}
tCampChannel = 			--¹¥³ÇÕ½ÕóÓªÆµµÀ
{
	[1] = {"Phe c«ng TuyÒn Ch©u",30},
	[2] = {"Phe thñ TuyÒn Ch©u thµnh",31},
	[3] = {"Phe c«ng Thµnh §« thµnh",32},
	[4] = {"Phe thñ Thµnh §« thµnh",33},
	[5] = {"Phe c«ng T­¬ng D­¬ng thµnh",34},
	[6] = {"Phe thñ T­¬ng D­¬ng thµnh",35},
}
tDoorName = {"§«ng thµnh m«n","Thµnh m«n trung khu","T©y thµnh m«n"};
--ÌØÐ§ÒôÀÖ½á¹¹
tWavFileName = 
{
	[1] = {"»ñµÃ´óÆì.wav","Ê§È¥´óÆì.wav"},
	[2] = {"»ñµÃÐ¡Æì.wav","Ê§È¥Ð¡Æì.wav"},
	[3] = {"»ñµÃ»ú¹Ø.wav","Ê§È¥»ú¹Ø.wav"},
}
MUSIC_DEFAULT = 0;
MUSIC_JIANG = 1;
MUSIC_WEIJI = 2;
MUSIC_YOUSHI = 3;
--±³¾°ÒôÀÖ
tMusicFileName = 
{
	[MUSIC_DEFAULT] = "¹¥³ÇÕ½_¼¤°º.mp3",
	[MUSIC_JIANG] = "¹¥³ÇÕ½_¼¤°º.mp3",
	[MUSIC_WEIJI] = "¹¥³ÇÕ½_ÓÅÊÆ.mp3",	--²»ÊÇÌî·´ÁË£¬Ö»ÊÇÒôÀÖÎÄ¼þÃûÐ´´íÁË
	[MUSIC_YOUSHI] = "¹¥³ÇÕ½_Î£»ú.mp3",
}
--¹¥³ÇÏµÍ³½Å±¾È«¾Ö±äÁ¿Éè¶¨==============================================================
RELAY_DATA_BATTLE = "gongcheng_result";	--¹²ÏíÊý¾Ý¿âµÄ×Ö·û´®±êÊ¶
RELAY_CALLBACK_SCRIPT = "";	--Relay¹²ÏíÊý¾Ý¿â»Øµ÷½Å±¾Â·¾¶

FLAG_COUNT_WIN = 8;			--¹¥·½Õ¼Áì8ÃæÆì×Ó¾ÍÓ®ÁË
FLAG_COUNT_END_WIN = 6;		--ÔÚ¹¥³ÇÕ½½áÊøµÄÊ±ºò¹¥·½Õ¼Áì6ÃæÆì×Ó¾ÍÓ®ÁË
LEAST_STAY_DAY = 7;			--ÒªÇó´ôÔÚ°ï»áµÄ×îÉÙÌìÊý
MAX_REGULAR_ARMY = 150;		--Õý¹æ¾ü×î´óÈËÊý
MAX_REINFORCEMENT = 150;	--×î´óÍâÔ®Êý
MAX_TOTAL_PLAYER = 150;		--×î´óÈËÊý
INVINCIBILITY_TIME = 5;		--³öºóÓªÎÞµÐÊ±¼ä
--======================================================================================

--·þÎñÆ÷È«¾Ö±äÁ¿========================================================================
--700~710
GLB_GONGCHENG_FORBIDEN = 700	--ÊÇ·ñÔÊÐí¿ªÆô¹¥³ÇÕ½£¬1Îª½ûÖ¹£¬0ÎªÔÊÐí
--¹Ì¶¨ÈÎÎñ±äÁ¿==========================================================================
--450~499
TASK_LIZHI = 450;		--±»ÀîÖ¾ÓÃÈ¥ÁË
TASK_AWARD_WIN = 451;	--¼ÇÂ¼µ±Ç°Íæ¼Ò»¹Ã»ÁìÈ¡µÄ¹¥³ÇÕ½³êÐ»´óÀñ°üÊýÁ¿
TASK_AWARD_LOST = 452;	--¼ÇÂ¼µ±Ç°Íæ¼Ò»¹Ã»ÁìÈ¡µÄ¹¥³ÇÕ½³êÐ»Ð¡Àñ°üÊýÁ¿
--ÔÚ¼ÓÈëÐÂµÄÕ½³¡Ê±»á±»Çå³ýµÄÈÎÎñ±äÁ¿====================================================
TNC_BEGIN = 490;
TNC_MUID = 490;			--¼ÇÂ¼Íæ¼Ò¼ÓÈëµÄÕ½³¡Ëù¶ÔÓ¦µÄMUID
TNC_KILL = 491;			--¼ÇÂ¼Íæ¼Òµ¥³¡PKÈËÊý
TNC_CAMP = 492;			--¼ÇÂ¼²Î¼ÓµÄÕóÓª£¬´ËÕóÓª·ÇMissionÕóÓª£¬Ö¸µÄÊÇ¹¥ÊØÕóÓª
TNC_END = 499;
TNC_TONG_AWARD = 3285; 	--°ïÅÉ½±Àø0Ã»ÓÐ£¬1Ê¤Àû£¬2Ê§°Ü
TNC_CAMP_TIME = 3344;   --¼ÇÂ¼ÊØ³ÇÊ±¼ä
--ÁÙÊ±ÈÎÎñ±äÁ¿80~100====================================================================
TEMP_BEGIN = 80;
TEMP_CAMP = 81;				--¼ÇÂ¼Íæ¼ÒÊÇ¹¥³Ç·½»¹ÊÇÊØ³Ç·½
TEMP_GURAD_ID = 82;			--¼ÇÂ¼Íæ¼ÒÊÇ·ñÎª³ÇÃÅÍêÎÀ£¬Öµ¿ÉÒÔÎª1,2,3,·Ö±ð¶ÔÓ¦Èý¸ö£¨¶«ÄÏÎ÷£©³ÇÃÅ
TEMP_ARENA_FIGHTING = 83;	--ÊÇ·ñÕýÔÚµ¥Ìô£¬1ºÍ2±íÊ¾ÊÇ£¨1±íÊ¾¹¥·½£¬2±íÊ¾ÊØ·½£©£¬0±íÊ¾·ñ¡£ÕýÔÚµ¥ÌôµÄÇé¿öÏÂ£¬TEMP_GURAD_ID¶ÔÓ¦µÄ±äÁ¿µÄÖµ²»»áÎª0
TEMP_FIGHT_STATE = 84;		--¼ÇÂ¼µ¥Ìô×´Ì¬£¬¶ÔÓ¦ÓÚµ¥Ìô×´Ì¬¼¯
TEMP_CITY_INDEX = 85;		--¼ÇÂ¼Ëù²Î¼ÓÕ½ÒÛ¶ÔÓ¦µÄ³ÇÊÐË÷Òý
TEMP_AUDIENCE = 86;			--±êÊ¶Íæ¼ÒÊÇ²»ÊÇµ¥Ìô¹ÛÖÚ£¬Öµ¿ÉÒÔÎª1,2,3,·Ö±ð¶ÔÓ¦Èý¸ö£¨¶«ÄÏÎ÷£©³ÇÃÅ
TEMP_CHALLENGER = 87;		--±êÊ¶Íæ¼ÒÔÚµ¥ÌôµÄÊ±ºòÊÇ²»ÊÇÌôÕ½Õß
TEMP_REINFORCEMENT = 88;	--±êÊ¶Íæ¼ÒÊÇ²»ÊÇÍâÔ®£¬ÖµÎª1±íÊ¾¹¥·½ÍâÔ®£¬2±íÊ¾ÊØ·½ÍâÔ®
TEMP_LOCK = 89;				--Íæ¼Ò±»Ëø¶¨±êÊ¶¡£Îª1Ê±±íÊ¾¸ÃÍæ¼ÒÕýÔÚ»ØÓ¦µ¥ÌôÉêÇë
TEMP_FIGHT_TIMER_LOOP = 90;	--¼ÇÂ¼µ±Ç°µ¥Ìô¼ÆÊ±Æ÷µÄÑ­»·´ÎÊý
TEMP_END = 90;
--======================================================================================

--======================================================================================
--ÏÂÃæÊÇÓëMissionÃÜÇÐÏà¹ØµÄ³£Á¿¶¨Òå
--======================================================================================
MISSION_ID = 35;									--MissionµÄID
TIMER_ID = 63;										--¼ÆÊ±Æ÷µÄID
LOG_ID = 207;										--µÇÂ½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 3015;								--µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ
FIGHT_TIMER_ID = 4;									--µ¥ÌôÊ±¼ä´¥·¢Æ÷ID
FIGHT_TRIGGER_ID = 3014;							--µ¥ÌôÊ±¼ä´¥·¢Æ÷×Ô¶¨Òå±àºÅ
--=========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬Ö»ÄÜÌî·Ç0ÕýÕûÊý==================================================
READY_TIME = 30;									--×¼±¸Ê±¼ä£¬30·ÖÖÓ
GONGMEN_TIME = 40;									--¹¥ÃÅÊ±¼ä£¬40·ÖÖÓ
GONGCHENG_TIME = 60;								--¹¥³ÇÊ±¼ä£¬60·ÖÖÓ
ENDING_TIME = 5;									--µÈ´ý½áÊøÊ±¼ä£¬5·ÖÖÓ
--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
READY_TIMER_INTERVAL = 5;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»·ÖÖÓ
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
GONGMEN_TIMER_INTERVAL = 5;					
GONGMEN_TIMER_COUNT = (GONGMEN_TIME/GONGMEN_TIMER_INTERVAL)-1;	
GONGCHENG_TIMER_INTERVAL = 5;					
GONGCHENG_TIMER_COUNT = (GONGCHENG_TIME/GONGCHENG_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS±äÁ¿=============================================================================
MS_GONG_TONG_NAME = 1;								--¼ÇÂ¼¹¥³Ç·½°ï»áµÄÃû×Ö			
MS_SHOU_TONG_NAME = 2;								--¼ÇÂ¼ÊØ³Ç·½°ï»áµÄÃû×Ö
MS_CITY_NAME = 3;									--³ÇÊÐÃû×Ö		
--MissionV±äÁ¿=============================================================================
MV_MISSION_STATE		= 1;						--¼ÇÂ¼Mission×´Ì¬
MV_TIMER_LOOP 			= 2;						--¼ÇÂ¼¼ÆÊ±Æ÷µÄ¼ÆÊý
MV_MISSION_UID 			= 3;						--¼ÇÂ¼MissionµÄÎ¨Ò»ID
MV_CUR_MUSIC_GONG		= 4;						--¹¥·½µ±Ç°±³¾°ÒôÀÖË÷Òý
MV_CUR_MUSIC_SHOU		= 5;						--ÊØ·½µ±Ç°±³¾°ÒôÀÖË÷Òý
MV_WAR_RESULT			= 6;						--¼ÇÂ¼Õ½³¡µÄ×îÖÕ½á¹û¡£0±íÊ¾Õ½³¡Î´¿ªÊ¼»òÎ´½áÊø£¬1±íÊ¾¹¥·½Ó®£¬2±íÊ¾ÊØ·½Ó®
MV_DEATH_GONG			= 7;						--¹¥·½ËÀÍöÈËÊý
MV_DEATH_SHOU			= 8;						--ÊØ·½ËÀÍöÈËÊý

MV_FLAG_OWN_COUNT 		= 11;						--¼ÇÂ¼¹¥·½Õ¼ÁìÁË¶àÉÙÃæÆì×Ó
MV_DESTROY_EAST_DOOR	= 12;						--¼ÇÂ¼³ÇÃÅ»ú¹Ø1ÊÇ·ñ±»´Ý»Ù£¬Ïàµ±ÓÚ³ÇÃÅÊÇ·ñÓÀ¾Ã´ò¿ª
MV_DESTROY_SOUTH_DOOR	= 13;						--¼ÇÂ¼³ÇÃÅ»ú¹Ø2ÊÇ·ñ±»´Ý»Ù
MV_DESTROY_WEST_DOOR	= 14;						--¼ÇÂ¼³ÇÃÅ»ú¹Ø3ÊÇ·ñ±»´Ý»Ù
MV_DESTROY_FLAG1		= 15;						--¼ÇÂ¼Æì×Ó1ÊÇ·ñ±»´Ý»Ù
MV_DESTROY_FLAG2		= 16;						--¼ÇÂ¼Æì×Ó2ÊÇ·ñ±»´Ý»Ù
MV_DESTROY_FLAG3		= 17;						--¼ÇÂ¼Æì×Ó3ÊÇ·ñ±»´Ý»Ù
MV_TRAP_EAST_DOOR		= 18;						--¶«ÃÅTRAPµã£¬1±íÊ¾¹¥·½¿ÉÓÃ£¬2±íÊ¾ÊØ·½¿ÉÓÃ£¬0±íÊ¾¹¥ÊØË«·½¾ù¿ÉÓÃ£¬-1±íÊ¾¹¥ÊØË«·½¾ù²»¿ÉÓÃ
MV_TRAP_SOUTH_DOOR		= 19;						--ÄÏÃÅTRAPµã
MV_TRAP_WEST_DOOR		= 20;						--Î÷ÃÅTRAPµã
MV_GRAVEYARD_A1 		= 21;						--¼ÇÂ¼10¸öÄ¹µØµÄ×´Ì¬
MV_GRAVEYARD_A2			= 22;						--1±íÊ¾¹¥·½¿ÉÓÃ
MV_GRAVEYARD_B1			= 23;						--2±íÊ¾ÊØ·½¿ÉÓÃ
MV_GRAVEYARD_B2			= 24;						--0±íÊ¾¹¥ÊØË«·½¾ù¿ÉÓÃ
MV_GRAVEYARD_C1			= 25;						-- -1±íÊ¾¹¥ÊØË«·½¾ù²»¿ÉÓÃ
MV_GRAVEYARD_C2			= 26;
MV_GRAVEYARD_11			= 27;
MV_GRAVEYARD_12			= 28;
MV_GRAVEYARD_21			= 29;
MV_GRAVEYARD_22 		= 30;
MV_EAST_DOOR_DRAW		= 31;						--¼ÇÂ¼¶«ÃÅÊØÎÀµ¥ÌôÁ¬Ðø³öÏÖÆ½ÊÖµÄ´ÎÊý
MV_SOUTH_DOOR_DRAW		= 32;						--¼ÇÂ¼ÄÏÃÅÊØÎÀµ¥ÌôÁ¬Ðø³öÏÖÆ½ÊÖµÄ´ÎÊý
MV_WEST_DOOR_DRAW		= 33;						--¼ÇÂ¼Î÷ÃÅÊØÎÀµ¥ÌôÁ¬Ðø³öÏÖÆ½ÊÖµÄ´ÎÊý
MV_GPIDX_EAST_DOOR		= 34;						--¹¥·½¶«ÃÅÊØÎÀÕßË÷Òý£¬ÓÉÕâ¸öË÷Òý¿ÉÒÔ¼ÆËã³öÆäËüMissionVµÄ±äÁ¿ºÅ£¬¹«Ê½MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1
MV_SPIDX_EAST_DOOR		= 35;						--ÊØ·½¶«ÃÅÊØÎÀÕßË÷Òý
MV_GPIDX_SOUTH_DOOR		= 36;						--¹¥·½ÄÏÃÅÊØÎÀÕßË÷Òý
MV_SPIDX_SOUTH_DOOR		= 37;						--ÊØ·½ÄÏÃÅÊØÎÀÕßË÷Òý
MV_GPIDX_WEST_DOOR		= 38;						--¹¥·½Î÷ÃÅÊØÎÀÕßË÷Òý
MV_SPIDX_WEST_DOOR		= 39;						--ÊØ·½Î÷ÃÅÊØÎÀÕßË÷Òý
MV_GET_GONG_TOKEN 		= 40;						--¹¥·½ÊÇ·ñÁìÈ¡¹ý¹¥³ÇÁî			
MV_GET_SHOU_TOKEN		= 41;						--ÊØ·½ÊÇ·ñÁìÈ¡¹ýÊØ³ÇÁî
MV_EAST_JIGUAN_INDEX	= 42;						--¶«ÃÅ»ú¹ØNPCË÷Òý
MV_SOUTH_JIGUAN_INDEX	= 43;						--ÄÏÃÅ»ú¹ØNPCË÷Òý
MV_WEST_JIGUAN_INDEX	= 44;						--Î÷ÃÅ»ú¹ØNPCË÷Òý
MV_REVIVI_FLAG1_OWNER	= 45;						--ÓÃÀ´¼ÇÂ¼7¸ö¿ÉÖØÉúÆì×Ó±»Õ¼ÁìµÄÇé¿ö
MV_REVIVI_FLAG2_OWNER	= 46;						--1±íÊ¾¹¥·½Õ¼Áì£¬2±íÊ¾ÊØ·½Õ¼Áì
MV_REVIVI_FLAG3_OWNER	= 47;
MV_REVIVI_FLAG4_OWNER	= 48;
MV_REVIVI_FLAG5_OWNER	= 49;
MV_REVIVI_FLAG6_OWNER	= 50;
MV_REVIVI_FLAG7_OWNER	= 51;
MV_NORMAL_FLAG1_OWNER	= 52;						--ÓÃÀ´¼ÇÂ¼3¸ö²»¿ÉÖØÉúÆì×Ó±»Õ¼ÁìµÄÇé¿ö
MV_NORMAL_FLAG2_OWNER	= 53;
MV_NORMAL_FLAG3_OWNER	= 54;
MV_LONGZHU_FLAG = 55;									--¼ÇÂ¼ÁúÖùÊÇ¹»±»¿³µô£¬0Î´Ë¢£¬1Ë¢ÁË£¬2±»¿³µô
--Mission×´Ì¬¼¯============================================================================
MS_STATE_IDEL 		= 0;							--³¡µØ¿ÕÏÐ
MS_STATE_READY 		= 1;							--×¼±¸½×¶Î
MS_STATE_GONGMEN 	= 2;							--¹¥ÃÅ½×¶Î
MS_STATE_GONGCHENG 	= 3;							--¹¥³Ç½×¶Î
MS_STATE_ENDING 	= 4;							--µÈ´ý½áÊø½×¶Î
--µ¥Ìô×´Ì¬¼¯===============================================================================
ROOM_STATE_IDLE = 0;								--µ¥Ìô³¡µØ×´Ì¬£º¿ÕÏÐ
ROOM_STATE_READY = 1;								--µ¥Ìô³¡µØ×´Ì¬£º×¼±¸
ROOM_STATE_FIGHT = 2;								--µ¥Ìô³¡µØ×´Ì¬£ºÕ½¶·
ROOM_STATE_END = 3;									--µ¥Ìô³¡µØ×´Ì¬£ºµÈ´ý½áÊø
--=========================================================================================