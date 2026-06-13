Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\guild_functions.lua")
Include("\\script\\ksgvn\\functions\\meridian_functions.lua")
Include("\\script\\ksgvn\\functions\\book_functions.lua")
Include("\\script\\ksgvn\\functions\\battle_functions.lua")
Include("\\script\\ksgvn\\functions\\pet_functions.lua")
Include("\\script\\ksgvn\\functions\\faction_support_functions.lua")
Include("\\script\\ksgvn\\functions\\weapon_effect_functions.lua")
Include("\\script\\ksgvn\\functions\\fair_functions.lua")
Include("\\script\\ksgvn\\functions\\phutu_functions.lua")

function kgm_ShowMenuEquip()
    local tSay = {
        "Choose the type of Equipment to receive:",
        "Main Equipment/kgm_ShowMenuNewItem",
        "Upgradable Equipment/kgm_ShowMenuUpgradableItem",
        "Battlefield Equipment/kgm_ShowMenuBattleItem",
        "Golden Snake Equipment/kgm_ShowMenuKimXaItem",
        "Adornment Equipment/kgm_ShowMenuVanSucItem",
        "Tournament Equipment/kgm_ShowMenuVipItem",
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuHorse()
    local tSay = { "Choose a favorite mount:" }
    for i = 30100, 30203 do
        tinsert(tSay, format("I want to receive %s/#kgm_AddHorse(%d)", KsgItem:GetName(0, 105, i), i))
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function kgm_ShowMenuSupport()
    local tSay = {
        "Choose support:",
        "Change military rank/battle_ChangeTitle",
        "Receive 100 billion experience/#KsgPlayer:BigAddExp(100e9)",
        "Receive 100,000 Gold/#KsgPlayer:AddGold(100000)",
        "Receive enhancement materials and Demon Blade Stone/kgm_AddNLCuongHoa",
        "Receive gems/kgm_AddGem",
        "\nReceive Golden Snake feeding materials/kgm_AddKimXaFeed",
        "Receive Golden Snake attribute Refine stones/kgm_AddKimXaGem",
        "Receive Golden Snake attribute lock stones/kgm_AddLockKimXaGem",
        "\nReceive Immortal Return Pill and Soul Pill/kgm_AddLinhDon",
        "\nReceive Spirit Soul and Moon Soul/#kgm_AddLinhDon(1)"
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPet()
    local tSay = {
        "Pet/Companion operations",
        "Receive spirit power points/pet_AddLinhLuc",
        "Learn Spirit Summoning Art/#pet_Active(8)",
    }
    for i = 1, 8 do
        tinsert(tSay, "\n")
        tinsert(tSay, format("Receive level %d Pet/#pet_AddRandom(%d)", i, i))
        tinsert(tSay, format("Receive level %d skill book\n/#pet_AddBookByNum(%d, 10)", i, i))
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_AddGem()
    local nMax = 8
    if not KsgLib:HasEnoughBagRoom(nMax * 4) then
        return
    end
    for i = 1, nMax do
        KsgAward:ReceiveGem(i, 100)
    end
end

function kgm_AddHorse(nId)
    if not KsgLib:HasEnoughBagRoom(1) then
        return
    end
    local tbAward = {
        { tbProp = { 0, 105, nId }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, 'Receive Mount')
end

function kgm_AddKimXaFeed()
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30612 }, nStack = 500 },
    }
    KsgAward:Give(tbAward, 'Receive Iron Essence 4')
end

function kgm_AddKimXaGem()
    if not KsgLib:HasEnoughBagRoom(15) then
        return
    end
    local tbAward = {}
    for i = 1, 12 do
        tinsert(tbAward, { tbProp = { 2, 1, 30520 + i }, nStack = 100 }) -- Heart-Cleansing Furnace Stone
    end
    tinsert(tbAward, { tbProp = { 2, 1, 31401 }, nStack = 50 }) -- Heart-Cleansing Furnace Stone 7
    tinsert(tbAward, { tbProp = { 2, 1, 31402 }, nStack = 50 }) -- Heart-Cleansing Furnace Stone 7
    tinsert(tbAward, { tbProp = { 2, 1, 31614 }, nStack = 50 }) -- Heart-Cleansing Furnace Stone 8
    tinsert(tbAward, { tbProp = { 2, 1, 31615 }, nStack = 50 }) -- Heart-Cleansing Furnace Stone 8
    KsgAward:Give(tbAward, "Receive Golden Snake Refine Stone")
end

function kgm_AddLockKimXaGem()
    if not KsgLib:HasEnoughBagRoom(18) then
        return
    end
    local tbAward = {}
    for i = 30904, 30909 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- Golden Snake lock stone 5
    end
    for i = 31249, 31254 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- Golden Snake lock stone 6
    end
    for i = 31391, 31396 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- Golden Snake lock stone 7
    end  
    for i = 31604, 31609 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- Golden Snake lock stone 8
    end
    KsgAward:Give(tbAward, "Receive Golden Snake Lock Stone")
end

function kgm_AddLinhDon(bNewItem)
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30847 }, nStack = 500 },
        { tbProp = { 2, 1, 31239 }, nStack = 500 },
    }
    if bNewItem then
        tbAward = {
            { tbProp = { 2, 95, 3855 }, nStack = 500 },
            { tbProp = { 2, 102, 232 }, nStack = 500 },
        }
    end
    KsgAward:Give(tbAward, 'Receive Spirit Pill')
end

function kgm_AddNLCuongHoa()
    if not KsgLib:HasEnoughBagRoom(10, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 1067 } }, --  Soul Anchor Stone level 7
        { tbProp = { 2, 1, 1113 } }, --  Soul Anchor Stone level 10
        { tbProp = { 2, 1, 1068 } }, -- Meteorite Spirit Stone +7
        { tbProp = { 2, 1, 1009 }, nStack = 100 }, -- Meteorite Essence Stone
        { tbProp = { 2, 1, 30424 }, nStack = 50 },
        { tbProp = { 2, 1, 30425 }, nStack = 50 },
        { tbProp = { 2, 1, 30426 }, nStack = 50 },
        { tbProp = { 2, 1, 30427 }, nStack = 50 },
        { tbProp = { 2, 1, 30428 }, nStack = 20 },
        { tbProp = { 2, 1, 30429 }, nStack = 20 },
        { tbProp = { 2, 1, 30430 }, nStack = 20 },
    }
    KsgAward:Give(tbAward, "Receive Enhancement Materials")
end

function kgm_ShowMenuHorseAndCoat()
    EarnCollectionCoin(100000)
    if BigGetItemCount(2, 1, 30494) <= 0 then
        AddItem(2, 1, 30494, 1, 4)
        KsgNpc:Talk("Hero, you received the Thien Bien Tieu Wardrobe")
    end
    if GetPlayerCollectionData(2, 1) == 0 then
        SetPlayerCollectionData(2, 1, 1)
        SetPlayerCollectionData(2, 2, 1)
        SetPlayerCollectionData(2, 3, 1)
    end
    if KsgPlayer:GetPhongHoa() < 1e6 then
        KsgPlayer:ModifyPhongHoaPoint(300000)
    end
    local tbAward = {
        { tbProp = { 2, 1, 30230 }, nStack = 1000 },
    }
    KsgAward:Give(tbAward, "Receive Costume exchange vouchers and tickets")
end

function kgm_ShowMenuBook()
    local tSay = {
        "Receive Secret Manuals and formulas:",
        "Receive Beginner Secret Manual/#book_AddBookByType(2,1)",
        "Receive Intermediate Secret Manual/#book_AddBookByType(2,2)",
        "Receive Advanced Secret Manual/#book_AddBookByType(2,3)",
        "Receive Top-grade Secret Manual 15%/#book_AddBookByType(2,4)",
        "Receive Super Secret Manual/#book_AddBookByType(2,5)",
        "Receive Secret Codex Manual/#book_AddBookByType(2,6)",
        "Receive Sect Guardian Secret Manual/book_AddMasterBook",
        "Receive Formula/book_AddYeuQuyet",
        "Receive Ancient Manual/book_AddCoPho",
        "Receive Mac Gia mechanism fragments/book_AddManhCoQuan",
        "\nReceive common Secret Manuals/book_ShowCommonMenu",
        "\nReceive Wavetreading Steps/book_AddLangBa",
        "Receive Tieu Dao Secret Manual/book_AddTieuDao",
        "\nReceive practice points and practice EXP/book_AddPopur",
        "\nQuickly practice Secret Manual/book_FastPractice",
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuMeridian()
    local tSay = {
        "Meridian operations:",
        "Receive Genuine Qi/meridian_AddChanKhi",
        "Receive Dong Nhan Meridian/#meridian_AddKinhMachDongNhan(25)",
        "Receive Ngan Nhan Meridian/#meridian_AddKinhMachNganNhan(25)",
        "Reset Meridian points/meridian_ResetPoint",
    }
    local nMax = 6
    for i = 1, nMax do
        if i > MeridianGetLevel() then
            tinsert(tSay, i + 1, format("Advance to realm %s/#meridian_LevelUp(%d)", KsgPlayer:GetMeridianName(i), i))
        else
            tinsert(tSay, i + 1, format("Advance to realm %s (already activated)/no", KsgPlayer:GetMeridianName(i)))
        end
    end

    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuFair()
    local tSay = {
        "Transformation Realm operations:",
        --"Open Transformation Realm/#KsgPlayer:OpenFair()",
        "Increase Transformation Realm by 1 level/#kgm_UpFair(1)",
        "Increase Transformation Realm by 10 levels/#kgm_UpFair(10)",
        "Advance to Transformation Realm floor 10/#KsgPlayer:LevelUpFair(10)",
        "Advance to Transformation Realm floor 25/#KsgPlayer:LevelUpFair(25)",
        "Advance to Transformation Realm floor 50/#KsgPlayer:LevelUpFair(50)",
        "Advance to Transformation Realm floor 75/#KsgPlayer:LevelUpFair(75)",
        "Advance to Transformation Realm floor 100/#KsgPlayer:LevelUpFair(100)",
    }
    if KsgPlayer:IsAdmin() then
        tinsert(tSay, "Advance to Transformation Realm floor 200/#KsgPlayer:LevelUpFair(200)")
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_UpFair(nLevel)
    nLevel = nLevel or 1
    for _ = 1, nLevel do
        KsgPlayer:LevelUpFair()
    end
end

function kgm_ShowMenuUpgradableItem()
    local tSay = {
        "Choose the type of Equipment to receive:",
        "Receive Radiant Sun set /#KsgAward:SetDieuDuong(15)",
        "Receive War Frenzy set /#KsgAward:SetChienCuong(15)",
        "Receive Gallant set /kgm_SetHaoHiep",
        "Receive Peerless Gallant set /kgm_SetHaoHiepVoHa",
        "Receive Blood Drinker set /kgm_SetAmHuyet",
        "Receive Killing Star set /kgm_SetSatTinh",
        "Receive Soul Breaker set/kgm_SetPhaHon",
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuNewItem()
    local tSay = {
        "Choose the type of Equipment to receive:",
        "Receive Hidden Sword set /kgm_SetTangKiem",
        "Receive Heaven's Will Hidden Sword set /kgm_SetThienChiTangKiem",
        "Receive Flame Emperor set /#KsgItem:AddSuitByBody(8001, 15)",
        "Receive Heaven's Will Flame Emperor set  /#KsgItem:AddSuitByBody(8055, 15)",
        "Receive Platinum Flame Emperor set   /#KsgItem:AddSuitByBody(30013, 15)",
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBang()
    local tSay = {
        "Choose Guild operation",
        "I want to create a Guild/guild_ShowCreateDialog",
        "I want to level up the Guild/guild_LevelUp",
        "Receive Guild title/guild_ShowAddTitle",
        "Receive Guild token/guild_ShowAddGangToken",
        "Receive Guild contribution points/guild_AddGxd",
    }
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVipItem()
    local tSay = {
        "Choose the type of Equipment to receive:",
        "Receive Peerless War God set /#KsgItem:AddSuitByBody(30651, 15)",
        "Receive Peerless Under Heaven set /#KsgItem:AddSuitByBody(30207, 15)",
        "Receive Limitless Star set/#KsgItem:AddJewelry(31130, 2)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "Receive Black-White Peerless set /#KsgItem:AddSuitByBody(50006, 15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuKimXaItem()
    local tSay = {
        "Choose the type of Equipment to receive:",
    }
    for i = 1, 8 do
        tinsert(tSay, format("Receive level %d Golden Snake /#kgm_NhanKimXa(%d, 15)", i, i))
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuReborn()
    local tSay = {
        "Reincarnation operations:",
    }
    for i = 1, MAX_REBORN_LEVEL do
        local nBigLevel = tonumber(i .. 90)
        if i > KsgPlayer:GetRebornCount() then
            tinsert(tSay, format("Advance to Reincarnation %d/#KsgPlayer:Reborn(%d)", i, nBigLevel))
        end
    end
    tinsert(tSay, "\nReceive Reincarnation seal and Costume /#KsgReborn:ReceiveCoatAndSeal()")
    tinsert(tSay, "Change Reincarnation path/kgm_ShowMenuChangeRebornRoute")
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuChangeRebornRoute()
    local tSay = {
        "Choose new Reincarnation path:",
    }
    for nRoute, szRouteName in KsgPlayer:GetRebornRouteName() do
        tinsert(tSay, format("Reincarnate along path %s/#KsgReborn:ChangeRoute(%d)", szRouteName, nRoute))
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPear()
    local tSay = {
        "Choose the Sea Pearl level to receive:",
    }
    local nMax = 7
    for i = 1, nMax do
        tinsert(tSay, format("Receive 200 level %d Sea Pearl/#kgm_ThuongHaiChau(%d)", i, i))
    end
    tinsert(tSay, "Receive Pearl Powder/kgm_AddBotTranChau")
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVanSucItem()
    local tSay = {
        "Choose the Adornment type to receive:",
    }
    for i = 1, 4 do
        tinsert(tSay, format("Receive level %d Adornment /#KsgAward:SetVanSuc(%d)", i, i))
    end

    tinsert(tSay, "\nReceive Adornment enhancement materials/kgm_NhanNLVanSuc")
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBattleItem()
    local tSay = {
        g_szTitle .. "Receive Advanced Equipment",
        "\nReceive Heaven's Will General set/#KsgItem:AddBattleSuit_ThienChi_Tuong(15)",
        "\nReceive Imperial Dragon General set/#KsgItem:AddBattleSuit_NguLong_Tuong(15)",
        "Receive Goshawk General set/#KsgItem:AddBattleSuit_ThuongUng_Tuong(15)",
        "Receive Thunder Tiger General set/#KsgItem:AddBattleSuit_LoiHo_Tuong(15)",
        "Receive Fire Phoenix General set/#KsgItem:AddBattleSuit_HoaPhung_Tuong(15)",
        "Receive Azure Dragon General set/#KsgItem:AddBattleSuit_ThanhLong_Tuong(15)",
        "Receive Mighty Tiger General set/#KsgItem:AddBattleSuit_UyHo_Tuong(15)",
        "Receive Vermilion Bird General set/#KsgItem:AddBattleSuit_ChuTuoc_Tuong(15)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "Receive General/Marshal Equipment upgrade materials/kgm_nhanNLTuongSoai",
            "Receive Goshawk Marshal set/#KsgItem:AddBattleSuit_ThuongUng_Soai(15)",
            "Receive Thunder Tiger Marshal set/#KsgItem:AddBattleSuit_LoiHo_Soai(15)",
            "Receive Fire Phoenix Marshal set/#KsgItem:AddBattleSuit_HoaPhung_Soai(15)",
            "Receive Azure Dragon Marshal set/#KsgItem:AddBattleSuit_ThanhLong_Soai(15)",
            "Receive Mighty Tiger Marshal set/#KsgItem:AddBattleSuit_UyHo_Soai(15)",
            "Receive Vermilion Bird Marshal set/#KsgItem:AddBattleSuit_ChuTuoc_Soai(15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_NhanKimXa(nLevel, nUpgradeLevel)
    nUpgradeLevel = nUpgradeLevel or 8
    if nLevel > 3 then
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_KHANGTATCA)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NOICONG)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NGOAICONG)
    else
        KsgAward:AddKimXa(nLevel, nUpgradeLevel)
    end
end

function kgm_NhanNLVanSuc()
    local tbAward = {
        { tbProp = { 2, 1, 31096 }, nStack = 100 }, -- Flowing Gold
        { tbProp = { 2, 201, 13 }, nStack = 100 }, -- Astral Stone
        { tbProp = { 2, 201, 14 }, nStack = 5 }, --  Ancient-Gold Stone
        { tbProp = { 2, 201, 16 }, nStack = 5 }, --  Star-Dot Jade-Small
    }
    KsgAward:Give(tbAward, "Receive Adornment Enhancement Materials")
end

function kgm_AddBotTranChau()
    local tbAward = {
        { tbProp = { 2, 102, 215 }, nStack = 1000 }, -- Astral Stone
    }
    KsgAward:Give(tbAward, "Receive Pearl Powder Materials")
end

function kgm_SetHaoHiep(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30568)
    KsgItem:AddJewelry(31126, 2, 'Receive HH Jewelry')
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32162,
        [ROUTE_CONLON_KIEMTON] = 32190,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'Receive HH Weapon')
    end
    KsgItem:AddWeaponByRouteIndex(30724, 4, nLevel, 'Receive HH Weapon')
end

function kgm_ThuongHaiChau(nLevel)
    KsgAward:ThuongHaiChau(nLevel, 200)
    KsgTask:SetBit(TASKID_LIMIT_SERVER_TEST, TASKID_LIMIT_SERVER_TEST_BIT_THDC, 1)
end

function kgm_SetLietVu(nLevel)
    nLevel = nLevel or 0
    local nRouteIndex = KsgPlayer:GetRouteIndex()
    KsgItem:AddSuitByRouteOffset(22270, nLevel, "Receive Fierce Dance set")
    KsgItem:AddJewelry(8092 + nRouteIndex * 2 - 2, 2, 'Receive Fierce Dance Jewelry')
    KsgItem:AddWeaponByRouteOffset(22270, nLevel, 'Receive Fierce Dance Weapon')
end

function kgm_SetHaoHiepVoHa()
    local tbAward = {
        { tbProp = { 2, 1, 30944 } },
        { tbProp = { 2, 1, 30945 } },
        { tbProp = { 2, 1, 30946 } },
        { tbProp = { 2, 1, 30973 } },
        { tbProp = { 2, 1, 30974 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Receive HHVH set')
end

function kgm_SetSatTinh()
    local tbAward = {
        { tbProp = { 2, 1, 31313 } },
        { tbProp = { 2, 1, 31314 } },
        { tbProp = { 2, 1, 31315 } },
        { tbProp = { 2, 1, 31316 } },
        { tbProp = { 2, 1, 31317 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Receive Killing Star set')
end

function kgm_SetPhaHon()
    local tbAward = {
        { tbProp = { 2, 1, 31529 } },
        { tbProp = { 2, 1, 31530 } },
        { tbProp = { 2, 1, 31531 } },
        { tbProp = { 2, 1, 31532 } },
        { tbProp = { 2, 1, 31533 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Receive Soul Breaker set')
end

function kgm_SetAmHuyet(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30610)
    KsgItem:AddJewelry(31272, 2, 'Receive AH Jewelry')
    KsgItem:AddJewelry(31414, 2, 'Receive AH Jewelry')
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32164,
        [ROUTE_CONLON_KIEMTON] = 32192,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'Receive Blood Drinker Weapon')
    end
    KsgItem:AddWeaponByRouteIndex(30884, 4, nLevel, 'Receive Blood Drinker Weapon')
end

function kgm_SetTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(95, nLevel, 'Receive Hidden Sword Set')
    KsgItem:AddJewelry(36, 5, 'Receive Hidden Sword Set_Jewelry')
end

function kgm_SetThienChiTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(30001, nLevel, 'Receive Heaven\'s Will Hidden Sword Set')
    KsgItem:AddJewelry(30001, 3, 'Receive Heaven\'s Will Hidden Sword Set_Jewelry')
end

function kgm_nhanNLTuongSoai()
    local tbAward = {
        { szName = "Heaven's Gate Gold Token", tbProp = { 2, 1, 30370 }, nStack = 100 },
        { szName = "Heavenly Gang Token", tbProp = { 2, 95, 204 }, nStack = 100 },
        { tbProp = { 2, 1, 31194 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31195 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31294 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31295 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31241 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30769 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30770 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31122 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30687 }, nStack = 2000, nStatus = 1 },
    }
    KsgAward:Give(tbAward)
end

function kgm_ChangeRoute()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("You have already joined a Sect, I cannot help you.")
    end
    local tSay = {
        "Which Sect do you want to join?",
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        tinsert(tSay, format("I want to join %s/#kgm_JoinRoute(%d)", KsgPlayer:GetRouteName(nFactionRoute), nFactionRoute))
    end
    tinsert(tSay, "Leave/no")
    KsgNpc:PageSay(tSay, 2, 8)
end

function kgm_JoinRoute(nRoute)
    local nSex = GetSex()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsAdmin() then
        return KsgNpc:Talk("You have already joined a Sect, I cannot help you.")
    end
    kgm_RemoveCurrentRouteSkill()
    if g_tbFactionRoute_Gender[nRoute] ~= 0 then
        if g_tbFactionRoute_Gender[nRoute] ~= nSex then
            local tbSexName = {
                [1] = "Male",
                [2] = "Female",
            }
            return KsgNpc:Talk(format("Sect %s does not accept %s disciples", KsgPlayer:GetRouteName(nRoute), tbSexName[nSex]))
        end
    end
    SetPlayerRoute(nRoute)
    kgm_FixFactionTask()
    SetTask(336, 10000)
    ModifyReputation(10000, 0)
    kgm_LearnRouteSkill(nRoute)
    -- Set default skill as monster-attack skill
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    if KsgPlayer:GetBigLevel() < 55 then
        AddLevelUp(55 - GetLevel())
    end
    if KsgItem:Count(2, 1, 50264) == 0 then
        KsgAward:Give({ tbProp = { 2, 1, 50264 }, nStack = 1, nStatus = 4 }, "Receive Newbie Gift Bag")
    end
end

function kgm_FixFactionTask()
    if KsgPlayer:GetFaction() == ROUTE_DUONGMON and GetTask(1005) < 8 then
        -- fix Duong Mon initial join quest
        SetTask(1005, 8)
    end
end

function kgm_RemoveCurrentRouteSkill()
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    RemoveSkill(20)
    RemoveSkill(tbSkillCfg.nTranPhai) -- Sect Guardian
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- Basic skills
        RemoveSkill(i)
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Normal attack skill
        RemoveSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Monster-attack skill
        RemoveSkill(nSkillId)
    end
end

function kgm_LearnRouteSkill(nRoute)
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]

    LearnSkill(20) -- Lightness skill
    LearnSkill(tbSkillCfg.nTranPhai) -- Sect Guardian

    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- Basic skills
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Normal attack skill
        LearnSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Monster-attack skill
        LearnSkill(nSkillId)
    end
end

function kgm_ClearBagItems(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        KsgNpc:SayDialog({
            g_szTitle .. "Confirm deleting all Items in the bag?",
            "Agree/#kgm_ClearBagItems(1)",
            "Cancel/no",
        })
        return
    end
    ClearItemInPos()
    for _, cfg in g_tbLoginCfg do
        local nHaveItemCount = KsgItem:CountAll(cfg.tbProp)
        local bOtherRule = 1
        if cfg.szRequireRule == 'admin' then
            bOtherRule = KsgPlayer:IsAdmin()
        end
        if cfg.szRequireRule == 'gm' then
            bOtherRule = KsgPlayer:IsGM()
        end
        if KsgLib:GetSrvCfg(cfg.bCondition) == 1 and bOtherRule == 1 then
            if nHaveItemCount < 1 and GetFreeItemRoom() > 0 then
                KsgAward:Give({ { tbProp = cfg.tbProp } }, "onKsgPlayerLogin received card, type = " .. cfg.szRequireRule)
                if type(cfg.szMsg) == "string" then
                    KsgNpc:Talk(cfg.szMsg)
                end
            end
        else
            -- Admin items are not deleted
            if nHaveItemCount > 0 and not KsgPlayer:IsAdmin() then
                KsgItem:DeleteAll(cfg.tbProp)
                KsgNpc:Talk(format("Lost %s due to expiration or being banned from use!", KsgItem:GetName(cfg.tbProp)))
            end
        end
    end
end
