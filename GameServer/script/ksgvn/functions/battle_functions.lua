Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\newbattles\\head.lua")
Include("\\script\\ksgvn\\functions\\battle_head.lua")
Import("\\script\\vng\\lib\\vnglib_textdata.lua")

g_szTitle = "<color=green>Recruitment Officer: <color>"

function battle_OpenMenu()
    local tSay = {
        g_szTitle .. "Choose the battlefield type to open.",
        "Yanmen Pass - Sub Battlefield/battle_OpenNMQ_Sub",
        "Yanmen Pass - Main Campaign/battle_OpenNMQ",
        "Jade Gate Pass - Main Campaign/battle_OpenNMQ_1",
        "Clear battlefield entry limit/battle_Before_ClearSignUp",
        "\nEnd conversation/no",
    }
    KsgNpc:SayDialog(tSay)
end

function battle_Before_ClearSignUp(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "Confirm opening the Yanmen Pass - Main Campaign battlefield?",
            "Confirm/#battle_Before_ClearSignUp(1)",
            "Back/battle_OpenMenu",
            "\nEnd conversation/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    battle_ClearSignUp()
    KsgPlayer:Talk("Cleared the battlefield limit data for the current or upcoming match.")
end

function battle_OpenNMQ(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "Confirm opening the Yanmen Pass - Main Campaign battlefield?",
            "Confirm/#battle_OpenNMQ(1)",
            "Back/battle_OpenMenu",
            "\nEnd conversation/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Main-Battle")
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nHour = tonumber(date("%H"))
        if SubWorldID2Idx(200) >= 0 then
            AddLocalNews("Scouts report: the Yanmen Pass - main campaign is about to begin. Heroes, register quickly.")
            Msg2Global("Scouts report: the Yanmen Pass - main campaign is about to begin. Heroes, register quickly.")
        end
        battle_ClearSignUp()
        local nOldSubWorld = SubWorld
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3)    --Set to XX3 (note: this XX may differ from the sub-battlefield XX)
        SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2])
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1))
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Opening Main-Battle")
            OpenMission(tBTMSInfo[MAINBATTLE_ID][1])
        else
            WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
        end
        SubWorld = nOldSubWorld
    end
end

function battle_OpenNMQ_1(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "Confirm opening the Jade Gate Pass - Main Campaign battlefield?",
            "Confirm/#battle_OpenNMQ_1(1)",
            "Back/battle_OpenMenu",
            "\nEnd conversation/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Main-Battle")
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nHour = tonumber(date("%H"))
        if SubWorldID2Idx(500) >= 0 then
            AddLocalNews("Scouts report: the Jade Gate Pass - main campaign is about to begin. Heroes, register quickly.")
            Msg2Global("Scouts report: the Jade Gate Pass - main campaign is about to begin. Heroes, register quickly.")
        end
        battle_ClearSignUp()
        local nOldSubWorld = SubWorld
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3)    --Set to XX3 (note: this XX may differ from the sub-battlefield XX)
        SubWorld = SubWorldID2Idx(tBTMSInfo[PRIMARY_MAINBATTLE_ID][2])
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1))
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Opening Main-Battle")
            OpenMission(tBTMSInfo[PRIMARY_MAINBATTLE_ID][1])
        else
            WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[PRIMARY_MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
        end
        SubWorld = nOldSubWorld
    end
end

function battle_OpenNMQ_Sub(nConfirm)
    if not nConfirm then
        local tSay = {
            g_szTitle .. "Confirm opening the Yanmen Pass - Sub Battlefield?",
            "Confirm/#battle_OpenNMQ_Sub(1)",
            "Back/OnUse",
            "Close/no",
        }
        KsgNpc:SayDialog(tSay)
        return
    end
    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return 0
    end
    WriteLog("[NewBattle]:Initialize Sub-Battle")
    SetGlbValue(GLB_VILLAGE, 0)    --Clear the battlefield result no matter what
    SetGlbValue(GLB_RESOURCE, 0)
    SetGlbValue(GLB_EMPLACEMENT, 0)
    SetGlbValue(GLB_MAINBATTLE, 0)
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE)
        local nHour = tonumber(date("%H"))
        if nGlobalState == 0 then
            if SubWorldID2Idx(200) >= 0 then
                AddGlobalNews("The Yanmen Pass battlefield is about to begin. Heroes, register quickly.")
                Msg2Global("The Yanmen Pass battlefield is about to begin. Heroes, register quickly.")
            end
            battle_ClearSignUp()
            local nOldSubWorld = SubWorld
            SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 1)    --Set to XX1
            if RANDOM_CAMP_PLACE == 1 then
                SetGlbValue(GLB_RANDOM_PLACE_VILL, random(0, 1))
                SetGlbValue(GLB_RANDOM_PLACE_RESO, random(0, 1))
                SetGlbValue(GLB_RANDOM_PLACE_EMPL, random(0, 1))
            end
            for i = 1, 3 do
                SubWorld = SubWorldID2Idx(tBTMSInfo[i][2])
                if SubWorld >= 0 then
                    WriteLog("[NewBattle]:Opening Sub-Battle")
                    OpenMission(tBTMSInfo[i][1])
                else
                    WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld))
                end
            end
            SubWorld = nOldSubWorld
        else
            WriteLog("[NewBattle]:Global state error,value:" .. tostring(nGlobalState))
        end
    end
end

function battle_CanSignUp(nBattleType)
    if TONGLIEU_LIMIT_OPEN == 0 then
        return 1
    end
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    local nCurMacAddress = GetCurrentMacAddress()
    local nMacIdx = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        print(LIB_txtData.tbTextData[i][1])
        if "MAC_" .. nCurMacAddress == LIB_txtData.tbTextData[i][1] then
            nMacIdx = i
            break
        end
    end
    if nMacIdx == 0 then
        local szLog = "MAC_" .. nCurMacAddress .. "	" .. GetAccount() .. "	" .. nBattleType .. "	0"
        LIB_txtData:AddLine(szLog)
        return 1
    end
    if tonumber(LIB_txtData.tbTextData[nMacIdx][4]) >= TONGLIEU_MAX_PLAYER_SIGNUP then
        KsgNpc:Talk(format(g_szTitle .. "Each match currently allows only <color=gold>%d characters<color> to register for Song-Liao. Please join the next match instead.", TONGLIEU_MAX_PLAYER_SIGNUP))
        return nil
    end
    return 1
end

function battle_LogSignUp(nBattleType, nCamp)
    if TONGLIEU_LIMIT_OPEN == 0 then
        return 1
    end
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    local nCurMacAddress = GetCurrentMacAddress()
    local nMaxIdx = 0
    for i = 1, getn(LIB_txtData.tbTextData) do
        if "MAC_" .. nCurMacAddress == LIB_txtData.tbTextData[i][1] then
            nMaxIdx = i
            break
        end
    end
    if nMaxIdx == 0 then
        local szLog = "MAC_" .. nCurMacAddress .. "	" .. GetAccount() .. "	" .. nBattleType .. "	0"
        LIB_txtData:AddLine(szLog)
        return 1
    end
    if tonumber(LIB_txtData.tbTextData[nMaxIdx][4]) >= 3 then
        return 0
    end
    LIB_txtData.tbTextData[nMaxIdx][4] = LIB_txtData.tbTextData[nMaxIdx][4] + 1
    LIB_txtData:SaveMultiColumn()
    return 1
end

function battle_ClearSignUp()
    LIB_txtData:Init(TONGLIEU_LIMIT_FILENAME)
    LIB_txtData:LoadMultiColumn()
    for i = 1, getn(LIB_txtData.tbTextData) do
        LIB_txtData.tbTextData[i][4] = 0
    end
    LIB_txtData:SaveMultiColumn()
end

function battle_ChangeTitle()
    local tSay = { "Change military rank" }
    local nMax = 5
    if KsgPlayer:IsGM() then
        nMax = 6
    end
    for i = 3, nMax do
        local nBattleTitle = KsgLib:BattleRank2Title(i)
        if nBattleTitle then
            tinsert(tSay, format("Change military rank to %s/#battle_ChangeTitle_SelectCamp(%d)", nBattleTitle, i))
        end
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function battle_ChangeBattleRank(nCamp, nLevel, nConfirm)
    if nConfirm then
        nLevel = nLevel or 3
        local levelMap = {
            [3] = 50000,
            [4] = 80000,
            [5] = 120000,
            [6] = 240000,
        }
        local nPoint = levelMap[nLevel]
        local nTitle = KsgLib:BattleRank2Title(nLevel)
        if not nPoint or not nTitle then
            return
        end
        if (nCamp == 1) then
            --Join Song
            SetTask(701, nPoint)    --Set military merit points for the Song side
            SetTask(704, nLevel)    --Set military rank
            SetTask(745, nLevel)    --Set highest military rank
            SetTask(702, nPoint)    --Set highest Song-side military merit
            KsgPlayer:Msg("Received Song military rank " .. nTitle)
        elseif (nCamp == 2) then
            --Join Liao
            SetTask(701, -nPoint)    --Set military merit points for the Liao side
            SetTask(704, -nLevel)    --Set military rank
            SetTask(746, -nLevel)    --Set highest military rank
            SetTask(703, nPoint)    --Set highest Liao-side military merit
            KsgPlayer:Msg("Received Liao military rank " .. nTitle)
        end
        return
    end
    local nTitle = KsgLib:BattleRank2Title(nLevel)
    if not nTitle then
        return KsgNpc:Talk("The selected military rank is invalid.")
    end
    local szMsg = 'Liao '
    if nCamp == 1 then
        szMsg = "Song "
    end
    szMsg = szMsg .. nTitle
    local tSay = {
        format("Confirm changing military rank to %s?", szMsg, nLevel),
        format("Confirm/#battle_ChangeBattleRank(%d, %d, 1)", nCamp, nLevel),
        "Let me reconsider/no"
    }
    return KsgNpc:SayDialog(tSay)
end

function battle_ChangeTitle_SelectCamp(nLevel)
    local nTitle = KsgLib:BattleRank2Title(nLevel)
    if nTitle then
        local tSay = {
            "Choose the side to join:",
            format("%s Song side/#battle_ChangeBattleRank(%d,%d)", nTitle, 1, nLevel),
            format("%s Liao side/#battle_ChangeBattleRank(%d,%d)", nTitle, 2, nLevel),
            "\nLeave/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    KsgNpc:Talk("The selected military rank is invalid.")
end

function battle_CheckBattleEquipState(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx)
    local nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx = battle_GetBattleEquipInfo(nGenre, nDetail, nParticular)
    return battle_CheckBattleEquip(nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx)
end

function battle_GetBattleEquipInfo(nGenre, nDetail, nParticular)
    for nCamp, tbCampEquipCfg in g_tbBattleEquip do
        for nIndex, tbEquipCfg in tbCampEquipCfg do
            if nGenre == 0 and KsgLib:IsInTable(nDetail, tbEquipCfg.tbDetail) then
                for k = 1, getn(tbEquipCfg.tbRange) do
                    local nStartId = tbEquipCfg.tbRange[k][1]
                    local nEndId = tbEquipCfg.tbRange[k][2]
                    if nParticular >= nStartId and nParticular <= nEndId then
                        return nCamp, tbEquipCfg.nRequireQuanHam, tbEquipCfg.nRequireCongTrang, PackItemId(nGenre, nDetail, nParticular)
                    end
                end
            end
        end
    end
    return 0, 0, 0, 0
end

function battle_CheckBattleEquip(nEquipCamp, nRequireQuanHam, nRequireCongTrang, nEquipIdx)
    local nCurRank = KsgPlayer:GetBattleRank(1)
    local nCurRankPoint = KsgPlayer:GetHonor(1)
    local nPlayerCamp = 0
    if nEquipCamp == 0 then
        return -1
    end
    local szEquipName = GetItemName(UnPackItemId(nEquipIdx))
    if nCurRank < 0 then
        nPlayerCamp = LIAO_ID
    elseif nCurRank > 0 then
        nPlayerCamp = SONG_ID
    end
    if nPlayerCamp == ALL_ID then
        Msg2Player("Your military rank is still only Soldier, you cannot wear the Equipment " .. szEquipName)
        return 0
    end
    if (nEquipCamp ~= nPlayerCamp) then
        if nPlayerCamp == SONG_ID then
            Msg2Player("You are on the Song side, you cannot wear Liao-side Equipment")
        else
            Msg2Player("You are on the Liao side, you cannot wear Song-side Equipment")
        end
        return 0
    end
    local nEverRank = 0
    if GetTask(765) >= 15 then
        nEverRank = 6
    elseif GetTask(766) + GetTask(765) >= 10 then
        nEverRank = 5
    elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
        nEverRank = 4
    end
    nCurRank = abs(nCurRank)
    nCurRankPoint = abs(nCurRankPoint)

    if nCurRank < nEverRank then
        nCurRank = nEverRank
    end
    if nCurRank >= nRequireQuanHam or nCurRankPoint >= nRequireCongTrang then
        return 1
    end

    Msg2Player("Your military rank is too low, you cannot wear " .. szEquipName)
    return 0
end
