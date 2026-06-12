Import("\\script\\ksgvn\\lib.lua")

g_szNpcName = g_szNpcName or "<color=green>Novice Token:<color> "
TASK_TEMP_WEAPONIDX = 153
_g_tbWeaponEffects = {
    [1] = "Iron Bone",
    [2] = "Falling Sunset",
    [3] = "Hundred Battles",
    [4] = "Scorching Sun",
    [5] = "Tuan Dat",
    [6] = "Peach-Plum",
    [7] = "Danh Tuc",
    [8] = "Sky-Soaring",
    [9] = "Phan Van",
    [10] = "Doan Giao",
    [11] = "Tinh Di",
    [12] = "Army Breaker",
    [13] = "Noble House",
}

_g_tbSoulPowers = {
    [1] = { 1, 1 },
    [2] = { 2, 2 },
    [3] = { 2, 2 },
    [4] = { 2, 2 },
    [5] = { 2, 2 },
    [6] = { 2, 2 },
    [7] = { 2, 2 },
    [8] = { 3, 3 },
    [9] = { 3, 3 },
    [10] = { 3, 3 },
    [11] = { 3, 3 },
    [12] = { 4, 4 },
    [13] = { 4, 4 },
}
function weaponEffect_Show()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    SetTaskTemp(TASK_TEMP_WEAPONIDX, nWeaponIndex)
    local tSay = {
        g_szNpcName .. "Please choose the type of Soul Tablet you wish to activate:<enter><color=red>Note: If the Weapon already has a Soul Tablet, the old Soul Tablet will be replaced<color>",
    }

    for nEffectId, szEffectName in _g_tbWeaponEffects do
        tinsert(tSay, format("Soul Tablet-%s /#weaponEffect_Active(%d)", szEffectName, nEffectId))
    end
    tinsert(tSay, "Not ready to activate yet/no")
    KsgNpc:SayDialog(tSay)
end

function weaponEffect_Active(nEffectId, nBuyType)
    if not _g_tbWeaponEffects[nEffectId] then
        return KsgNpc:Talk("This Soul Tablet does not exist!")
    end
    local tbTypeCfg = {
        [1] = {
            nDay = 7,
            tbCost = { tbProp = { 2, 1, 31507 }, nCount = 1 },
        },
        [2] = {
            nDay = 7,
            tbCost = { tbProp = { 2, 1, 30230 }, nCount = 400 },
        },
        [3] = {
            nDay = 30,
            tbCost = { tbProp = { 2, 1, 30230 }, nCount = 1200 },
        },
    }
    if nBuyType then
        if not tbTypeCfg[nBuyType] then
            return KsgNpc:Talk("Cannot renew this plan!")
        end
        if _weaponEffect_isWeaponChanged() then
            return
        end
        local tbCondition = {
            tbItems = {
                tbTypeCfg[nBuyType].tbCost,
            },
        }
        if not KsgLib:PayMaterial(tbCondition) then
            return
        end
        if BindWeaponEffect(_g_tbWeaponEffects[nEffectId], tbTypeCfg[nBuyType].nDay * 86400) == 1 then
            KsgNpc:Talk(g_szNpcName .. format("Congratulations, you have successfully added a special effect to the Weapon <color=yellow>%s<color>! At the <color=yellow>icon in the lower-left corner of the Weapon<color>, click the red button to swap spirit and awaken the <color=yellow>Soul Tablet<color>. Shortcut key to awaken the <color=yellow>Soul Tablet<color>: <color=red>F<color> !", _g_tbWeaponEffects[nEffectId]))
            AddGlobalNews(format("Word in the Jianghu has it that %s used innate talent to awaken the Soul Tablet of the Weapon: %s, truly worthy of the name of one accomplished in both letters and martial arts!", GetName(), _g_tbWeaponEffects[nEffectId]))
        else
            return KsgNpc:Talk("An error occurred; this type of Soul Tablet cannot be awakened on the current Weapon!")
        end
        if AddWeaponEffectAttribute(8, _g_tbSoulPowers[nEffectId][1]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Add Spirit Power #%d level %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 1, "", "Success");
        else
            gf_WriteLogEx("WeaponEffect", format("Add Spirit Power #%d level %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 0, "", "Failure");
        end
        if AddWeaponEffectAttribute(9, _g_tbSoulPowers[nEffectId][2]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Add Spirit Power #%d level %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 1, "", "Success");
            return 1
        else
            gf_WriteLogEx("WeaponEffect", format("Add Spirit Power #%d level %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 0, "", "Failure");
            return 0
        end
        return
    end
    local tSay = {
        g_szNpcName .. format("%s has chosen the Soul Tablet <color=yellow>%s<color>; how long does %s want to keep the Soul Tablet?", gf_GetPlayerSexName(), _g_tbWeaponEffects[nEffectId], gf_GetPlayerSexName())
    }
    for nType, tbCfg in tbTypeCfg do
        local tbCost = tbCfg.tbCost
        tinsert(tSay, format("%d days (Costs [%s] x %d)/#weaponEffect_Active(%d,%d)", tbCfg.nDay, KsgItem:GetName(tbCost.tbProp), tbCost.nCount, nEffectId, nType))
    end
    tinsert(tSay, "Leave/no")
    KsgNpc:SayDialog(tSay)
end

function _weaponEffect_isWeaponChanged()
    local nWeaponIndex = GetPlayerEquipIndex(2)
    local nWeaponIndexSaved = GetTaskTemp(TASK_TEMP_WEAPONIDX)
    if nWeaponIndex == 0 then
        KsgNpc:Talk(g_szNpcName .. "First, Hero, you need to equip a Weapon!")
        return 1
    end
    if nWeaponIndexSaved ~= nWeaponIndex then
        KsgNpc:Talk(g_szNpcName .. "Oh my... Hero, you swapped Weapons really fast, but it did not escape my eyes! As an upright and illustrious Hero, you should not do such things!")
        return 1
    end
    return nil
end