if WOW_PROJECT_ID ~= WOW_PROJECT_CLASSIC then return end
local C_Map = C_Map
local CreateFrame = CreateFrame
local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME
local ENTER_BATTLE = ENTER_BATTLE
local GetBattlefieldPortExpiration = GetBattlefieldPortExpiration
local GetBattlefieldStatus = GetBattlefieldStatus
local GetBattlefieldTimeWaited = GetBattlefieldTimeWaited
local GetMaxBattlefieldID = GetMaxBattlefieldID
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local MiniMapBattlefieldDropDown = MiniMapBattlefieldDropDown
local PLAYER = PLAYER
local SecondsToTime = SecondsToTime
local StaticPopup_Visible = StaticPopup_Visible
local UnitInBattleground = UnitInBattleground
local hooksecurefunc = hooksecurefunc

local SAFEQUEUE_NUMPOPUPS = 3
local TOOLTIP_UPDATE_TIME = TOOLTIP_UPDATE_TIME
local EXPIRES_FORMAT = "SafeQueue expires in |cf%s%s|r"
local ANNOUNCE_FORMAT = "Queue popped %s"
local ALTERAC_VALLEY = C_Map.GetMapInfo(1459).name
local WARSONG_GULCH = C_Map.GetMapInfo(1460).name
local ARATHI_BASIN = C_Map.GetMapInfo(1461).name
local COLORS = {
    [ALTERAC_VALLEY] = { r = 0, g = 0.5, b = 1 },
    [WARSONG_GULCH] = { r = 0, g = 1, b = 0 },
    [ARATHI_BASIN] = { r = 1, g = 0.82, b = 0 },
}

local SafeQueue = CreateFrame("Frame", "SafeQueue")
SafeQueue:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
SafeQueue:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
SafeQueue:RegisterEvent("PLAYER_REGEN_ENABLED")
SafeQueue.buttons = {}
SafeQueue.queues = {}
SafeQueue.createQueue = {}

function SafeQueue:Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99SafeQueue|r: " .. message)
end

function SafeQueue:UPDATE_BATTLEFIELD_STATUS()
    for i = 1, GetMaxBattlefieldID() do
        local popup = SafeQueue_FindPopup(i)
        local status = GetBattlefieldStatus(i)
        if status == "confirm" then
            if self.queues[i] then
                local secs = GetTime() - self.queues[i]
                local message
                if secs <= 0 then
                    message = "instantly!"
                else
                    message = "after " .. SecondsToTime(secs)
                end
                self:Print(ANNOUNCE_FORMAT:format(message))
                self.queues[i] = nil
            end
            if (not popup) then
                self:Create(i)
            end
        else
            if status == "queued" then
                self.queues[i] = self.queues[i] or GetTime() - (GetBattlefieldTimeWaited(i) / 1000)
            end
            if popup then
                SafeQueue_Hide(popup)
            end
        end
    end
end

function SafeQueue:RefreshDropdown()
    if (not self.dropdownActive) then return end
    for i = 1, 10 do
        local button = _G["DropDownList1Button" .. i]
        if (not button) then break end
        if button:GetText() == ENTER_BATTLE then
            local battleground = _G["DropDownList1Button" .. i - 1]:GetText()
            SafeQueue.buttons[battleground] = button
        end
    end
end

function SafeQueue_Hide(self)
    if self.battleground then SafeQueue.buttons[self.battleground] = nil end
    self.battleground = nil
    self.battlegroundId = nil
    self:Hide()
end

function SafeQueue:Create(battlegroundId)
    local status, battleground = GetBattlefieldStatus(battlegroundId)
    if status ~= "confirm" then return end
    if InCombatLockdown() then
        self.createQueue[battlegroundId] = true
        return
    end
    for i = 1, SAFEQUEUE_NUMPOPUPS do
        local popup = _G["SafeQueuePopup" .. i]
        if (not popup:IsVisible()) then
            if StaticPopup_Visible("CONFIRM_BATTLEFIELD_ENTRY") then
                StaticPopup_Hide("CONFIRM_BATTLEFIELD_ENTRY")
            end
            popup.battleground = battleground
            popup.battlegroundId = battlegroundId
            popup:Show()
            break
        end
    end
end

function SafeQueue:PLAYER_REGEN_ENABLED()
    for battlegroundId, _ in pairs(self.createQueue) do
        self.createQueue[battlegroundId] = nil
        if (not SafeQueue_FindPopup(battlegroundId)) then self:Create(battlegroundId) end
    end
end

function SafeQueue_OnShow(self)
    SafeQueue_UpdateTimer(self)
    self.SubText:SetText(self.battleground)
    local color = COLORS[self.battleground]
    if color then self.SubText:SetTextColor(color.r, color.g, color.b) end
end

function SafeQueue_FindPopup(battlegroundId)
    for i = 1, SAFEQUEUE_NUMPOPUPS do
        local popup = _G["SafeQueuePopup" .. i]
        if popup:IsVisible() and popup.battlegroundId == battlegroundId then
            return popup
        end
    end
end

function SafeQueue_UpdateTimer(self)
    if (not self.battlegroundId) then return end
    local secs = GetBattlefieldPortExpiration(self.battlegroundId)
    if secs <= 0 then secs = 1 end
    local color
    if secs > 20 then
        color = "f20ff20"
    elseif secs > 10 then
        color = "fffff00"
    else
        color = "fff0000"
    end
    self.text:SetText(EXPIRES_FORMAT:format(color, SecondsToTime(secs)))
end

function SafeQueue_OnUpdate(self, elapsed)
    if (not self:IsVisible()) then return end
    local timer = self.timer
    timer = timer - elapsed
    if timer <= 0 then
        if (not self.battlegroundId) or GetBattlefieldStatus(self.battlegroundId) ~= "confirm" then
            SafeQueue_Hide(self)
            return
        end
        SafeQueue_UpdateTimer(self)
    end
    self.timer = timer
end

function SafeQueue:GetButton(battleground)
    if (not self.dropdownActive) then return end
    return self.buttons[battleground]
end

function SafeQueue_PreClick(self)
    SafeQueue:RefreshDropdown()

    if InCombatLockdown() then return end

    self:SetAttribute("macrotext", "")

    if UnitInBattleground(PLAYER) then return end

    local button = SafeQueue:GetButton(self:GetParent().battleground)

    if (not button) then
        self:SetAttribute("macrotext", "/click MiniMapBattlefieldFrame RightButton\n" ..
            "/click MiniMapBattlefieldFrame RightButton"
        )
        return
    end

    self:SetAttribute("macrotext", "/click " .. button:GetName())
end

hooksecurefunc("ToggleDropDownMenu", function(_, _, dropDownFrame)
    SafeQueue.dropdownActive = dropDownFrame == MiniMapBattlefieldDropDown
    SafeQueue:RefreshDropdown()
end)

hooksecurefunc("StaticPopup_Show", function(name)
    if name == "CONFIRM_BATTLEFIELD_ENTRY" and (not InCombatLockdown()) then
        StaticPopup_Hide(name)
    end
end)
