-- init
local _, class = UnitClass("player")
local r, g, b = RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b
local mult = 1
local function SetupPixelFix()
    local screenHeight = select(2, GetPhysicalScreenSize())
    local bestScale = max(.4, min(1.15, 768 / screenHeight))
    local pixelScale = 768 / screenHeight
    local scale = UIParent:GetScale()
    mult = (bestScale / scale) - ((bestScale - pixelScale) / scale)
end

-- Create Button and Menu
local LAB = CreateFrame("Button", "LootAnnounceButton", LootFrame)
local LA = CreateFrame("Frame", "LootAnnounce", LootFrame, "UIDropDownMenuTemplate")

local function textureOnEnter(self)
    if self:IsEnabled() then
        self.bgTex:SetVertexColor(r, g, b)
    end
end

local function textureOnLeave(self)
    self.bgTex:SetVertexColor(1, 1, 1)
end

local function OnLinkClick(self)
    ToggleDropDownMenu(1, nil, LA, LAB, 0, 0)
end

local function LDD_OnClick(self)
    local val = self.value
    Announce(val)
end

function Announce(chn)
    local nums = GetNumLootItems()
    if(nums == 0) then return end
    if UnitIsPlayer("target") or not UnitExists("target") then -- Chests are hard to identify!
        SendChatMessage(">> 战利品 <<", chn)
    else
        SendChatMessage(">> 拾取自 "..UnitName("target").." <<", chn)
    end
    for i = 1, GetNumLootItems() do
        if GetLootSlotType(i) == 1 then
            local link = GetLootSlotLink(i)
            SendChatMessage(link, chn)
        end
    end
end

local function LA_Initialize()
    local info = {}

    info.text = "通告至"
    info.notCheckable = true
    info.isTitle = true
    UIDropDownMenu_AddButton(info)

    --announce chanels
    if IsInRaid() then
        info = {}
        info.text = "  团队"
        info.value = "raid"
        info.notCheckable = 1
        info.func = LDD_OnClick
        UIDropDownMenu_AddButton(info)
    end

    if IsInGuild() then
        info = {}
        info.text = "  工会"
        info.value = "guild"
        info.notCheckable = 1
        info.func = LDD_OnClick
        UIDropDownMenu_AddButton(info)
    end

    if IsInGroup() then
        info = {}
        info.text = "  小队"
        info.value = "party"
        info.notCheckable = 1
        info.func = LDD_OnClick
        UIDropDownMenu_AddButton(info)
    end

    info = {}
    info.text = "  说"
    info.value = "say"
    info.notCheckable = 1
    info.func = LDD_OnClick
    UIDropDownMenu_AddButton(info)

    info = nil
end

LAB:ClearAllPoints()
LAB:SetWidth(17)
LAB:SetHeight(17)
LAB:SetPoint("RIGHT", LootFrameCloseButton, "LEFT", - 5, 0)
LAB:SetFrameStrata("TOOLTIP")
LAB:SetBackdrop({
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeSize = mult,
})
LAB:SetBackdropColor(0, 0, 0, 0)
LAB:SetBackdropBorderColor(0, 0, 0)
LAB:SetDisabledTexture("Interface\\ChatFrame\\ChatFrameBackground")
local dis = LAB:GetDisabledTexture()
dis:SetVertexColor(0, 0, 0, .3)
dis:SetDrawLayer("OVERLAY")
local tex = LAB:CreateTexture(nil, "ARTWORK")
tex:SetTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\zhuan_push_frame")
tex:SetSize(8, 8)
tex:SetPoint("CENTER")
LAB.bgTex = tex
LAB:RegisterForClicks("RightButtonUp", "LeftButtonUp")
LAB:SetScript("OnClick", OnLinkClick)
LAB:SetScript("OnEnter", textureOnEnter)
LAB:SetScript("OnLeave", textureOnLeave)
LAB:Hide()
UIDropDownMenu_Initialize(LA, LA_Initialize, "MENU")

-- Run it
local Lframe = CreateFrame("Frame", "Lframe", UIParent)
Lframe:SetScript("OnEvent", function(self, event, ...)
    if event == "LOOT_OPENED" then
    LAB:Show()
elseif event == "LOOT_CLOSED" then
    LAB:Hide()
end
end)
Lframe:RegisterEvent"LOOT_OPENED"
Lframe:RegisterEvent"LOOT_CLOSED"
