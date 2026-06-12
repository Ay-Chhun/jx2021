Import("\\script\\ksgvn\\lib.lua")

FAIR_LV_MAX = 3 --VN:Transformation Realm level cap
FAIR_LV_ROUND = 3 --VN:Rounds of activating all constellations required to level up Transformation Realm
FAIR_STAR_NUM = 10 --VN:Number of stars per round
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:Transformation Realm star level cap
g_tFairBaseNeedLingpo = { -- Soul Pill consumption baseline
    2, 4, 6--10,20,30
}
g_tFairBaseNeedHuixian = { -- Immortal Return Pill consumption baseline
    5, 10, 15
}
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510

function fair_Recall(nConfirm)
    local nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua = fair_GetRecallCount()
    if nTotalHoiTienDan == 0 then
        return KsgNpc:Talk("You have not reached Transcendence, so you cannot claim compensation.")
    end
    if not KsgLib:HasEnoughBagRoom(7) then
        return
    end
    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    if not nConfirm then
        local tSay = {
            format("Hero, you have reached Transcendence in %d meridians and will receive <color=gold>%d Hoi Tien Pills<color> and <color=gold>%d Linh Phach Pills<color> as compensation. Do you want to claim it now?", nFairLv, nTotalHoiTienDan, nTotalLinhPhachDan),
            format("I want to claim it /#fair_Recall(1)"),
            "\nNot yet/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    SetTask(TASKID_FAIR_VALUE, 0)
    SetTask(TASKID_FAIR_UP_FLAG, 0)
    KsgAward:Give({
        { tbProp = { 2, 1, 31239 }, nStack = nTotalLinhPhachDan, nStatus = 4 },
        { tbProp = { 2, 1, 30847 }, nStack = nTotalHoiTienDan, nStatus = 4 },
        { tbProp = { 2, 1, 50016 }, nStack = nTotalTuiQua, nStatus = 4 },
    }, "Transcendence closure compensation")
    KsgNpc:Talk(format("Compensation claimed successfully; recovered <color=gold>%d Hoi Tien Pills<color> and <color=gold>%d Linh Phach Pills<color>."))
end

function fair_GetRecallCount()
    if GetTask(TASKID_FAIR_UP_FLAG) == 0 then
        return 0, 0, 0
    end
    local nTotalLinhPhachDan = 0
    local nTotalHoiTienDan = 0
    local nTotalTuiQua = 0

    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    local nMaxFairLv = FAIR_LV_MAX * 30
    for i = 1, nMaxFairLv do
        if nFairLv >= i then
            local nFair = floor(i / (FAIR_LV_ROUND * FAIR_STAR_NUM))
            local nRound = mod(floor(i / FAIR_STAR_NUM), FAIR_LV_ROUND) + 1
            local nNeedLingpo = g_tFairBaseNeedLingpo[nRound] + nFair
            local nNeedHuixian = g_tFairBaseNeedHuixian[nRound] + nFair
            nTotalHoiTienDan = nTotalHoiTienDan + nNeedHuixian
            nTotalLinhPhachDan = nTotalLinhPhachDan + nNeedLingpo
            nTotalTuiQua = nTotalTuiQua + 10
        end
    end
    return nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua
end