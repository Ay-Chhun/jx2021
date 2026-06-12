Import("\\script\\ksgvn\\lib.lua")

function guild_ShowCreateDialog()
    if IsTongMember() ~= 0 then
        return KsgNpc:Talk("You already have a Guild!")
    end
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    if GetItemCount(2, 0, 555) < 1 then
        AddItem(2, 0, 555, 1)
    end
    if GetItemCount(2, 0, 125) < 1 then
        AddItem(2, 0, 125, 1)
    end
    if GetReputation() < 2000 then
        ModifyReputation(2000 - GetReputation(), 0)
    end
    if GetCash() < 5000000 then
        Earn(5000000 - GetCash())
    end
    CreateTongDialog()
end

function guild_LevelUp()
    if GetTongLevel() < 5 then
        AddTongLevel()
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    else
        KsgNpc:Talk("The Guild level has reached the maximum, it cannot be upgraded further.")
    end
end

function guild_AddGxd()
    if IsTongMember() == 0 and 1 == 2 then
        return KsgNpc:Talk("You must join or create a Guild before performing this action!")
    end
    add_tong_gxd(10000)
    KsgPlayer:Msg("Received 10,000 Guild contribution points!")
end

function guild_ShowAddTitle()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("You must join or create a Guild before performing this action!")
    end
    local tSay = {
        "Receive Guild title",
    }

    for i = 1, 10 do
        if i > get_tong_title_max_lv() then
            tinsert(tSay, i + 1, format("Receive Guild title level %s/#guild_AddTitle(%d)", i, i))
        else
            tinsert(tSay, i + 1, format("Receive Guild title level %s (already received)/no", i))
        end
    end
    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function guild_ShowAddGangToken()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("You must join or create a Guild before performing this action!")
    end
    local tSay = {
        "Receive Guild token: ",
    }

    for i = 1, 20 do
        tinsert(tSay, i + 1, format("Receive token level %s/#guild_AddGangToken(%d)", i, i))
    end

    tinsert(tSay, "\nLeave/no")
    KsgNpc:SayDialog(tSay)
end

function guild_AddGangToken(nLevel)
    nLevel = tonumber(nLevel)
    if nLevel < 1 or nLevel > 20 then
        return
    end
    if KsgItem:CountAll(0, 155, nLevel) == 0 then
        AddItem(0, 155, nLevel, 1)
        KsgNpc:Talk(format("Successfully received Guild token level %d", nLevel))
    else
        KsgNpc:Talk(format("You already have a Guild token level %d, you cannot receive more!", nLevel))
    end
end

function guild_AddTitle(nLevel)
    nLevel = tonumber(nLevel)
    if get_tong_title_max_lv() < nLevel then
        set_tong_title_lv(nLevel)
        set_tong_title_max_lv(nLevel)
        for i = 1, 10 do
            RemoveTitle(72, i)
        end
        AddTitle(72, nLevel)
        SetCurTitle(72, nLevel)
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
        KsgNpc:Talk(format("Successfully received Guild title level %d", nLevel))
    end
end