--¾­ÂöÏµÍ³Ñ¨Î»ÌØÊâÐèÇóÄ£°å

--°ÙÀïÑ¨Î»ÌØÊâÌõ¼þ£ºÐèÒª×°±¸8¼¶Áè²¨Î¢²½¼¼ÄÜ

SZ_NEED_SKILL_NAME = "Lingbo Microstep"
N_NEED_SKILL_LEVEL = 8
N_NEED_SKILL_ID = 477

N_SAVE_TSK_ID = 2951
N_SAVE_TSK_ID_BIT = 1



--Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâÐèÇóÌõ¼þÊÇ·ñ´ï³É
--1=ÒÑ´ï³É
--0=Î´´ï³É
function CheckCondition(nNodeId, nLevel, bNotify)
	if 1 == nLevel then
		if 0 == _CheckSkillBit() then
			if GetSkillLevel(N_NEED_SKILL_ID) < N_NEED_SKILL_LEVEL then
				if 1 == bNotify then
					Msg2Player(format("B¹n ch­a kÝch ho¹t cÊp %d kü n¨ng %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME))
				end
				return 0
			end
		end
	end

	return 1;
end

--»ñÈ¡Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâÐèÇóÃèÊöÎÄ±¾
--·µ»ØszDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = ""
	if 1 == nLevel then
		str = format("CÇn ph¶i kÝch ho¹t cÊp %d kü n¨ng %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME)
	end
	return str;
end

--Ñ¨Î»Éý¼¶ºóÌØÊâÐèÇóÐèÒªÖ´ÐÐµÄ²Ù×÷
--1=²Ù×÷³É¹¦
--0=²Ù×÷Ê§°Ü
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	if 13 == nNodeId and 1 == nLevel then
		return _SetSkillBit(1)
	end
	return 1;
end

function _CheckSkillBit()
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = GetBit(nTaskVal, N_SAVE_TSK_ID_BIT)
	return nRet
end

function _SetSkillBit(nBitValue)
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = SetBit(nTaskVal, N_SAVE_TSK_ID_BIT, nBitValue)
	SetTask(N_SAVE_TSK_ID, nRet)
	return 1
end