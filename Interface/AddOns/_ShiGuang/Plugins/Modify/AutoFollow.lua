--## Author: warbaby

local AutoFollow = CreateFrame("Frame", "AutoFollowFrame")
AutoFollow:EnableKeyboard(true)
AutoFollow:SetPropagateKeyboardInput(true);

AutoFollow.CHAT_INTERVAL = 3
AutoFollow.AFTER_MANUAL = 1
AutoFollow.START_MESSAGE = "121"
AutoFollow.START_MESSAGE_ALWAYS = "af121"
AutoFollow.STOP_MESSAGE = "1"

-- 记录最后一次手动操作的时间
function AutoFollow:OnManual()
    AutoFollow.manual = GetTime()
end

-- 按下任意键和按了鼠标
AutoFollow:SetScript("OnKeyDown", AutoFollow.OnManual)
WorldFrame:HookScript("OnMouseDown", AutoFollow.OnManual)
function AutoFollow:TryFollow()
    local now = GetTime()
    -- 施法中
    if AutoFollow.casting and now - AutoFollow.casting < 10 then return end
    -- 操作之后的N秒不动作
    if AutoFollow.manual and now - AutoFollow.manual < AutoFollow.AFTER_MANUAL then return end

    if UnitOnTaxi("player") then return end

    --if UnitHasVehicleUI("player") or UnitHasVehicleUI(AutoFollow.target) then return end
    if IsMouseButtonDown() or IsModifierKeyDown() or IsPlayerMoving() or UnitCastingInfo("player") or UnitChannelInfo("player") then
        return AutoFollow:OnManual()
    end

    if not InCombatLockdown() and not IsIndoors() and not IsMounted() then
        if LBIntelliMountSummon then LBIntelliMountSummon("surface") else C_MountJournal.SummonByID(0) end
    end

    if AutoFollow.following then return end
    -- 刚跟随就取消得间隔2秒
    if AutoFollow.lastFollowTime and now - AutoFollow.lastFollowTime < 2 then return end
    if CheckInteractDistance(AutoFollow.target, 1) then
        FollowUnit(AutoFollow.target)
        AutoFollow.lastFollowTime = GetTime()
    end
end

local function FullName(unit)
    local name, realm = UnitName(unit)
    return name and name .. "-" .. (realm and realm~="" and realm or GetRealmName())
end

AutoFollow:RegisterEvent("CHAT_MSG_PARTY")
AutoFollow:RegisterEvent("CHAT_MSG_PARTY_LEADER")

function AutoFollow:Enable(target)
    AutoFollow:RegisterEvent("AUTOFOLLOW_BEGIN")
    AutoFollow:RegisterEvent("AUTOFOLLOW_END")
    AutoFollow:RegisterEvent("UNIT_SPELLCAST_SENT")
    AutoFollow:RegisterEvent("UNIT_SPELLCAST_STOP")
    AutoFollow:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    AutoFollow:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
    AutoFollow:RegisterEvent("UNIT_ENTERING_VEHICLE")
    AutoFollow:RegisterEvent("UNIT_EXITED_VEHICLE")
    AutoFollow:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
    AutoFollow:RegisterEvent("LOOT_OPENED")
    AutoFollow:RegisterEvent("LOOT_CLOSED")

    AutoFollow.target = target
    AutoFollow.targetName = FullName(target)
    AutoFollow.casting = nil
    AutoFollow.manual = nil
    AutoFollow.followStopAt = nil
    AutoFollow.following = nil
    AutoFollow.timer = AutoFollow.timer or C_Timer.NewTicker(0.5, AutoFollow.TryFollow)
end

function AutoFollow:Disable()
    AutoFollow:UnregisterAllEvents()
    AutoFollow:RegisterEvent("CHAT_MSG_PARTY")
    AutoFollow:RegisterEvent("CHAT_MSG_PARTY_LEADER")
    if AutoFollow.timer and not AutoFollow.timer:IsCancelled() then
        AutoFollow.timer:Cancel()
    end
        AutoFollow.timer = nil
end

AutoFollow:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
    if event == "AUTOFOLLOW_BEGIN" then
        AutoFollow.following = GetTime()
        SendChatMessage(format(AUTOFOLLOWSTART, AutoFollow.target), "PARTY")
    elseif event == "AUTOFOLLOW_END" then
        AutoFollow.followStopAt = GetTime()
        if (not AutoFollow.following and GetTime() - AutoFollow.manual > 0.5) or AutoFollow.followStopAt - AutoFollow.following > AutoFollow.CHAT_INTERVAL then
            SendChatMessage(format(AUTOFOLLOWSTOP, AutoFollow.target), "WHISPER", nil, AutoFollow.targetName)
        end
        AutoFollow.following = nil

    elseif (arg1 == "player" and (event == "UNIT_SPELLCAST_SENT" or event == "UNIT_ENTERING_VEHICLE")) or event == "LOOT_OPENED" then
        AutoFollow.casting = GetTime()
        AutoFollow:OnManual()
    elseif (arg1 == "player" and (event == "UNIT_SPELLCAST_STOP" or event == "UNIT_SPELLCAST_CHANNEL_STOP" or event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_EXITED_VEHICLE")) or event == "LOOT_CLOSED" then
        AutoFollow.casting = nil
        AutoFollow:OnManual()
    elseif event == "PLAYER_MOUNT_DISPLAY_CHANGED" then
        AutoFollow:OnManual()

    elseif event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER" then
        if arg1 == AutoFollow.START_MESSAGE_ALWAYS then
            local _, _, arg5 = ...
            AutoFollow:Enable(arg5)
            SendChatMessage(AutoFollow.timer and "开始自动跟随" or "停止自动跟随", "PARTY")
        elseif arg2 == AutoFollow.targetName then
            if arg1 == AutoFollow.START_MESSAGE then
                if not AutoFollow.timer then
                    AutoFollow:Enable(addon.target)
                    SendChatMessage("开始自动跟随", "PARTY")
                end
            elseif arg1 == AutoFollow.STOP_MESSAGE then
                if AutoFollow.timer then
                    AutoFollow:Disable()
                    SendChatMessage("停止自动跟随", "PARTY")
                end
            end
        end
    end
end)

_G.SLASH_AUTOFOLLOW1="/autofollow"
_G.SLASH_AUTOFOLLOW2="/autofo"
SlashCmdList['AUTOFOLLOW'] = function(message)
    if not message or message == "stop" then
        AutoFollow:Disable()
    else
        AutoFollow:Enable(message)
    end
end