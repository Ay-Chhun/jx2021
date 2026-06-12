Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")
g_szTitle = "<color=green>GM RAGE: <color>"

function OnUse(nItemIndex)
    local nCurDate = KsgDate:Today()
    local tSay = { g_szTitle .. format("<color=white>Welcome to <color=fire>JX GM RAGE 2026 Edition<color>!<enter>Shared for free by <color=gold>DiaSabKdor<color>. Facebook: <color=cyan>facebook.com/jx2achjkea<color><enter>Have fun playing!<enter>Please select a feature:", KsgDate:CurrentTestDay(), KsgDate:TestRemainingDays()) }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "+ Join a Sect/kgm_ChangeRoute")
    else
        tinsert(tSay, "\n+ Receive Equipment/kgm_ShowMenuEquip")
        tinsert(tSay, "\n+ Receive Secret Manuals/kgm_ShowMenuBook")
        tinsert(tSay, "\n+ Receive Costumes & Mounts/kgm_ShowMenuHorseAndCoat")
        tinsert(tSay, "\n+ Reincarnation/kgm_ShowMenuReborn")
        tinsert(tSay, "\n+ Scenery Transformation/kgm_ShowMenuFair")
        tinsert(tSay, "\n+ Upgrade Meridians/kgm_ShowMenuMeridian")
        tinsert(tSay, "\n+ Sea Pearl (Thuong Hai Di Chau)/kgm_ShowMenuPear")
        tinsert(tSay, "\n+ Guild Functions/kgm_ShowMenuBang")
        tinsert(tSay, "\n+ Receive Pet/kgm_ShowMenuPet")
        tinsert(tSay, "\n+ Receive Other Support/kgm_ShowMenuSupport")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "\n+ Receive Heavenly Buddha Beads and Demon-Breaking Pestle/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "\n+ Receive Hidden Weapons and Mechanisms/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "\n+ Receive Sarira Golden Pill/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "\n+ Receive War Horse/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "\n+ Receive War Horse and Arrows/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "\n+ Receive Corpse-Sealing Powder/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "\n+ Receive Gu Poison/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "\n+ Receive Falcon/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "\n+ Receive Spirit Sword/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "\n+ Clear Bag Items/kgm_ClearBagItems")
    tinsert(tSay, "\nEnd Dialogue/no")
    KsgNpc:SayDialog(tSay)
end
