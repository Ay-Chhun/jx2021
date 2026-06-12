Import("\\script\\ksgvn\\lib.lua")

function factionSupport_IsTodayReceived()
    local today = tonumber(date('%d'))
    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT) == today then
        return 1
    end
    return nil
end

function factionSupport_SetLimit()
    if KsgPlayer:IsAdmin() then
        return
    end
    local nDate = tonumber(date('%d'))
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT, nDate)
    KsgNpc:Talk("Sect support can only be claimed once per day; please keep it carefully and don't waste it!")
end

function factionSupport_TLT()
    if not KsgLib:HasEnoughBagRoom(2, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 4 }, nStatus = 4, nStack = 99 },
        { tbProp = { 2, 3, 12 }, nStatus = 4, nStack = 99 },
    }
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_DuongMon()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 6 }, nStatus = 4, nStack = 999 }
    }
    for i = 1, 9 do
        tinsert(tbItemSupport, {
            tbProp = { 2, 11, i }, nStatus = 4, nStack = 2000
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_NgaMiKiem()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 3, 7 }, nStatus = 4, nStack = 200 })
    factionSupport_SetLimit()
end

g_tbHorseAttribute = {
    { "Max HP +4000", 4000, 2, 486 },
    { "Ex.atk +4%", 1500, 1, 261 },
    { "Ex.atk +8%", 4, 2, 261 },
    { "Attack Speed +6%", 1, 1, 24 },
    { "Attack Speed +9%", 1, 2, 24 },
    { "Secret Manual Bonus +4%", 1, 1, 564 },
    { "Secret Manual Bonus +5%", 1, 2, 564 },
    { "Max HP +1000", 100, 1, 486 },
    { "Internal & External Defense +98", 1500, 5, 420 },
    { "MP Cost Reduction 15%", 1000, 2, 443 },
    { "10% chance to halve damage taken", 900, 1, 302 },
    { "All Resistance +10", 990, 2, 329 },
    { "Yang Family Charging Wolf Spear attack power +15%", 1, 1, 323 },
    { "Yang Family Gold-Shattering Arrow attack power +15%", 1, 1, 325 },
}

function factionSupport_DGT()
    if not KsgLib:HasEnoughBagRoom(1, 10) then
        return
    end

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        KsgAward:Give({ tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
        factionSupport_SetLimit()
    end
end

function factionSupport_DGC()
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 15, 10 }, nStack = 2000, nStatus = 4 }
    }

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        tinsert(tbItemSupport, { tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HiepDoc()
    if not KsgLib:HasEnoughBagRoom(5, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 1, 6, 34 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 46 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 84 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 153 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 154 }, nStack = 30, nStatus = 4 },
        { tbProp = { 1, 6, 150 }, nStack = 2, nStatus = 4 },
    }
    if KsgLib:GetSrvCfg("bOpenTestCard") == 1 then
        tinsert(tbItemSupport, { tbProp = { 1, 6, 150 }, nStack = 30, nStatus = 4 })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_TaDoc()
    if not KsgLib:HasEnoughBagRoom(32, 1) then
        return
    end
    local tbItemSupport = {}
    for i = 1, 31 do
        tinsert(tbItemSupport, {
            tbProp = { 2, 17, i }, nStatus = 4, nStack = 200
        })
    end
    if BigGetItemCount(2, 0, 1063) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 0, 1063 }, nStatus = 4
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_CLKT()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    local tbItemSupport = {}
    if BigGetItemCount(2, 20, 100) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 20, 100 }, nStatus = 4
        })
    end
    if BigGetItemCount(2, 201, 21) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 201, 21 }, nStatus = 4
        })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_ThuyYenLinhNu()
    local tbSay = {
        g_szTitle .. "Little Falcon Actions",
        "Receive Little Falcon/factionSupport_NhanTieuDieu",
        "Raise Little Falcon/factionSupport_NuoiTieuDieu",
        "Train Little Falcon/factionSupport_HuanLuyenTieuDieu",
        "Back/no",
    }
    KsgNpc:SayDialog(tbSay)
end

function factionSupport_NhanTieuDieu()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 20, random(1, 5) }, nStatus = 4 })
    factionSupport_SetLimit()
end

function factionSupport_NuoiTieuDieu()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {}
    for i = 6, 12 do
        if i == 11 then
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4 })
        else
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4, nStack = 100 })
        end
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HuanLuyenTieuDieu()
    local nPetItemIndex = GetPlayerEquipIndex(12)
    if (nPetItemIndex == nil or nPetItemIndex <= 0) then
        return KsgPlayer:Msg("You don't have a Pet, so training cannot be done!")
    end
    local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex)
    if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or (ItemGen ~= 2 or ItemDetail ~= 20)
    then
        return KsgPlayer:Msg("You don't have a Pet, so training cannot be done!")
    end

    for _ = 1, 84 do
        LevelUpPet(nPetItemIndex)
    end
    factionSupport_SetLimit()
end