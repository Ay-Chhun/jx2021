Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\phutu_head.lua")

function phutu_Main(szTalkHead)
    szTalkHead = szTalkHead or g_szTalkHead
    if KsgPlayer:GetBigLevel() < PHUTU_REQUIRE_MIN_LEVEL then
        return KsgNpc:Talk(szTalkHead .. "Your ability is still limited; you cannot yet master the martial arts of other Sects. Keep training harder.")
    end
    local tSay = {
        szTalkHead .. "A disciple of our Sect who wishes to be renowned across the land must master many kinds of martial arts. If you have enough ability, come to me and I will recommend you to other great Sects to continue your training.",
    }
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if KsgPlayer:GetBigLevel() >= tbCfg.nRequireLevel and nRoute == 0 then
            tinsert(tSay, format("I want to take up Phu Tu in the %s Sect /#phutu_JoinFaction(%d)", tbCfg.szName, nRouteNum))
        end
        if KsgPlayer:GetRoute() ~= nRoute and nRoute > 0 then
            tinsert(tSay, format("Change to %s /#phutu_ChangeFactionRoute(%d)", KsgPlayer:GetRouteName(nRoute), nRouteNum))
        end
    end
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and KsgPlayer:GetRoute() ~= nOriginRoute then
        tinsert(tSay, format("\nChange to %s (Main Sect)/phutu_ChangeFactionRoute", KsgPlayer:GetRouteName(nOriginRoute)))
    end
    tinsert(tSay, "\nAbout Phu Tu/phutu_Intro")
    tinsert(tSay, "\nEnd conversation/no")
    KsgNpc:SayDialog(tSay)
end

function phutu_Intro()
    local talk1 = g_szTalkHead .. "A disciple of our Sect who reaches <color=yellow>Rebirth 8 Level 90 or above<color> may come to the Sect Leader to choose a Phu Tu Sect."
    talk1 = talk1 .. "<enter><enter>Each disciple may <color=gold>take up Phu Tu in at most 3 additional Sects<color>.<enter>- Reaching Rebirth 8 Level 90 allows Phu Tu in the first Sect."
    talk1 = talk1 .. "<enter>- Reaching Rebirth 9 Level 90 allows Phu Tu in the second Sect.<enter>- Reaching Rebirth 10 Level 90 or above allows Phu Tu in a third Sect."
    local talk2 = g_szTalkHead .. "You may find me or use the <color=red>Cultivation Bead<color> to switch to a Phu Tu Sect."
    talk2 = talk2 .. "<enter>Each time you switch to another Sect, you must wait <color=red>30 minutes<color> before acting again. After switching you will receive the <color=yellow>Registered Disciple status<color> and the <color=green>corresponding Registered Title<color>"
    talk2 = talk2 .. "<enter>When doing this you must <color=red>remove the equipment, weapons and manuals<color> you are wearing.<enter><color=gray>(Weapons include the secondary weapon; equipment includes: Hat, robe, pants and 2 jade pendants)<color>"
    Talk(2, "", talk1, talk2)
end

function phutu_JoinFaction(nRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "This feature is not available yet")
    end

    local tbCfg = g_tbPhuTuCfg[nRouteNum]
    if nSelectRoute and KsgLib:IsInTable(nSelectRoute, g_tbFactionRoutes) then
        if not phutu_CanJoinRoute(nSelectRoute) then
            return KsgNpc:Talk(g_szTalkHead .. "You cannot take up Phu Tu in this Sect; please choose another Sect.")
        end
        local tSay = {
            g_szTalkHead .. format("Do you confirm you want to choose <color=gold>%s<color> as your <color=red>%s<color> Phu Tu Sect?", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName),
            format("That's right/#phutu_JoinFaction_Confirm(%d, %d)", nRouteNum, nSelectRoute),
            "\nLet me think it over carefully first/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nPhuTuRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
    if nPhuTuRoute > 0 then
        -- Phu Tu already chosen
        return KsgNpc:Talk(g_szTalkHead .. format("You have already chosen your %s Phu Tu Sect; you cannot choose again!", tbCfg.szName))
    end
    local tSay = {
        g_szTalkHead .. "Choose the Sect you want to take up Phu Tu in:"
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        if phutu_CanJoinRoute(nFactionRoute) then
            tinsert(tSay, format("I want to take up Phu Tu in %s/#phutu_JoinFaction(%d, %d)", KsgPlayer:GetRouteName(nFactionRoute), nRouteNum, nFactionRoute))
        end
    end
    tinsert(tSay, "\nLet me think it over for a moment/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function phutu_JoinFaction_Confirm(nSelectRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nSelectRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "This feature is not available yet")
    end
    if KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE) == 0 then
        KsgTask:SetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE, KsgPlayer:GetRoute())
    end
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        if nRouteNum == nSelectRouteNum then
            KsgTask:SetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte, nSelectRoute)
            KsgNpc:Talk(g_szTalkHead .. format("Chosen <color=gold>%s<color> as your <color=green>%s<color> Phu Tu Sect<enter>You can use the <color=red>Cultivation Bead<color> or return to me to switch to a new Sect", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName))
        end
    end
end

function phutu_ChangeFactionRoute(nRouteNum)
    local nLastChange = KsgTask:Get(TASKID_PHUTU_LAST_CHANGE_ROUTE)
    local _, _, nMinDiff = KsgDate:DateDiff(GetTime(), nLastChange + PHUTU_WAIT_TIME)
    if nLastChange + PHUTU_WAIT_TIME > GetTime() then
        return KsgNpc:Talk(g_szTalkHead .. format("You must wait <color=yellow>%d more minutes<color> before you can switch Phu Tu Sect again or return to your original Sect. Please wait patiently!", nMinDiff))
    end
    if nRouteNum then
        if not g_tbPhuTuCfg[nRouteNum] then
            return KsgNpc:Talk(g_szTalkHead .. "This feature is not available yet")
        end
        local tbCfg = g_tbPhuTuCfg[nRouteNum]
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        local tSay = {
            g_szTalkHead .. format("Do you confirm you want to become a disciple of the <color=gold>%s<color> Sect?", KsgPlayer:GetRouteName(nRoute)),
            format("Confirm/#phutu_ChangeFactionRoute_Confirm(%d)", nRoute),
            "\nNo/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    local tSay = {
        g_szTalkHead .. format("Confirm return to <color=gold>%s<color>?", KsgPlayer:GetRouteName(nOriginRoute)),
        format("Confirm/#phutu_ChangeFactionRoute_Confirm(%d)", nOriginRoute),
        "\nNo/no"
    }
    return KsgNpc:SayDialog(tSay)
end

function phutu_ChangeFactionRoute_Confirm(nRoute)
    if KsgLib:IsInTable(nRoute, g_tbFactionRoutes) then
        if not phutu_CheckItem(nRoute) then
            return
        end
        if GetFightState() == 1 then
            return KsgNpc:Talk(g_szTalkHead .. "You cannot perform this action while in combat!")
        end
        local nOldRoute = KsgPlayer:GetRoute()
        if nOldRoute == nRoute then
            return KsgNpc:Talk(g_szTalkHead .. format("You are currently already in the <color=green>%s<color> Sect; no need to switch.", KsgPlayer:GetRouteName(nRoute)))
        end
        --Clear current skill states
        for i = 1, 4096 do
            RemoveState(i);
        end
        phutu_SaveSuperSkill(nOldRoute)
        phutu_RemoveSkills(nOldRoute)
        phutu_ResetAllPoints()
        -- New Route
        SetPlayerRoute(nRoute)
        phutu_FixFactionTask()
        phutu_LearnSkills(nRoute)
        -- Set default move to the monster-attack skill
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
        -- Remove the Five Poisons corpse
        RemoveRevivals()
        phutu_AddTitle(nRoute)
        -- Save the most recent Sect-change time
        KsgTask:Set(TASKID_PHUTU_LAST_CHANGE_ROUTE, GetTime())
        return KsgNpc:Talk(g_szTalkHead .. format("Switched to the <color=gold>%s<color> Sect.", KsgPlayer:GetRouteName(nRoute)))
    end
    return KsgNpc:Talk(g_szTalkHead .. "This feature is not available yet")
end

function phutu_CheckMap()
    local nMapID = GetWorldPos()
    if nMapID == 200 then
        return 1
    end

    return nil
end

function phutu_SaveSuperSkill(nRoute)
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if not tbSkillCfg then
        return
    end
    local nSuperSkillLevel = GetSkillLevel(tbSkillCfg.nTranPhai)

    KsgTask:SetByte(TASKID_PHUTU_TRANPHAI, phutu_GetByteTranPhaiByRoute(nRoute), nSuperSkillLevel) -- Save current Sect-Guardian skill level
end

function phutu_FixFactionTask()
    if KsgPlayer:GetFaction() == ROUTE_DUONGMON and GetTask(1005) < 8 then
        -- fix the early Tang Sect quest
        SetTask(1005, 8)
    end
end

function phutu_AddTitle(nRoute)
    local nFaction = KsgPlayer:GetFaction()
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if IsTitleExist(PHUTU_TITLE_GROUP, nFaction) ~= 1 and nRoute ~= nOriginRoute then
        AddTitle(PHUTU_TITLE_GROUP, nFaction)
        SetCurTitle(PHUTU_TITLE_GROUP, nFaction)
    end
end

function phutu_ResetAllPoints()
    local nCurStrength = GetStrength()
    local nCurVitality = GetVitality()
    local nCurDexterity = GetDexterity()
    local nCurEnergy = GetEnergy()
    local nCurObserve = GetObserve()

    if ((nCurStrength <= 1) and
            (nCurVitality <= 1) and
            (nCurDexterity <= 1) and
            (nCurEnergy <= 1) and
            (nCurObserve <= 1)) then
        return
    end

    SetStrength(1 - nCurStrength);
    SetVitality(1 - nCurVitality);
    SetDexterity(1 - nCurDexterity);
    SetEnergy(1 - nCurEnergy);
    SetObserve(1 - nCurObserve);
end

function phutu_RemoveSkills(nRoute)
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if 1 == HaveLearnedSkill(tbSkillCfg.nTranPhai) then
        RemoveSkill(tbSkillCfg.nTranPhai);
    end
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- Basic skills
        if 1 == HaveLearnedSkill(i) then
            RemoveSkill(i);
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Normal-attack skills
        if 1 == HaveLearnedSkill(nSkillId) then
            RemoveSkill(nSkillId);
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Monster-attack skills
        if 1 == HaveLearnedSkill(nSkillId) then
            RemoveSkill(nSkillId);
        end
    end
end

function phutu_LearnSkills(nRoute)
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if not tbSkillCfg then
        return
    end
    if HaveLearnedSkill(20) == 0 then
        LearnSkill(20) -- Lightness skill
    end
    LearnSkill(tbSkillCfg.nTranPhai) -- Sect Guardian
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- Basic skills
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
            KsgPlayer:Msg("Skill leveled up successfully")
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Normal-attack skills
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Monster-attack skills
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
    local nByteTranPhai = phutu_GetByteTranPhaiByRoute(nRoute)
    local nSaveTranPhaiLevel = KsgTask:GetByte(TASKID_PHUTU_TRANPHAI, nByteTranPhai)
    if nSaveTranPhaiLevel > 0 then
        for _ = 1, nSaveTranPhaiLevel - 1 do
            LevelUpSkill(tbSkillCfg.nTranPhai)
        end
    end
end

function phutu_GetByteTranPhaiByRoute(nCheckRoute)
    for _, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if nCheckRoute == nRoute then
            return tbCfg.nByteTranPhai
        end
    end
    return TASKID_PHUTU_BYTE_ORIGIN_ROUTE
end

function phutu_CheckItem(nRoute)
    local tbPunish = {
        [EQUIP_POS_CAP] = 'Hat',
        [EQUIP_POS_BODY] = 'Robe',
        [EQUIP_POS_PANTS] = 'Pants',
        [EQUIP_POS_RING1] = 'Upper Ring',
        [EQUIP_POS_RING2] = 'Lower Ring',
        [EQUIP_POS_BOOK] = 'Manual',
        [EQUIP_POS_EXTEND_BOOK] = 'Secondary Manual',
        [EQUIP_POS_WEAPON] = 'Weapon',
        [EQUIP_POS_EXTEND_WEAPON] = 'Secondary Weapon',
    }
    local nPass = 1
    local szItem = ''
    for nEquipPos, szName in tbPunish do
        local nEquipIdx = GetPlayerEquipIndex(nEquipPos)
        if nEquipIdx ~= 0 then
            if nEquipPos == EQUIP_POS_WEAPON then
                KsgNpc:Talk(g_szTalkHead .. format("To switch Sect you must remove your <color=red>Weapon<color> first."))
                return nil
            end
            local nEquipRoute = GetEquipRoute(nEquipIdx)
            if nEquipRoute ~= 0 and nEquipRoute ~= nRoute then
                szItem = szItem .. szName .. ", "
                nPass = nil
            end
        end
    end
    if not nPass then
        local szTalk = g_szTalkHead .. format("The <color=red>%s<color>you are wearing is not suitable for the <color=yellow>%s<color> Sect; please remove this equipment.", szItem, KsgPlayer:GetRouteName(nRoute))
        KsgNpc:Talk(szTalk)
    end
    return nPass
end

function phutu_CanJoinRoute(nFactionRoute)
    local nCurrentRoute = KsgPlayer:GetRoute()
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    local tbRoutes = {}
    tbRoutes[nCurrentRoute] = 1
    tbRoutes[nOriginRoute] = 1
    for _, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        tbRoutes[nRoute] = 1
    end
    if g_tbFactionRoute_Gender[nFactionRoute] ~= 0 then
        if g_tbFactionRoute_Gender[nFactionRoute] ~= GetSex() then
            return nil
        end
    end

    return tbRoutes[nFactionRoute] == nil
end