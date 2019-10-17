--## Version: 0.1.2
local LockboxMailer = CreateFrame("Frame")
local tooltip = CreateFrame("GameTooltip","LockboxMailerTooltip", UIParent, "GameTooltipTemplate");
tooltip:SetOwner(LockboxMailer, "ANCHOR_NONE");
function LockboxMailer:FindLockboxes()
    wipe(self.LockboxTable)
    for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                tooltip:SetBagItem(bag, slot)
                if tooltip:IsShown() then
                    for i = 1, tooltip:NumLines() do
                        local line = _G["LockboxMailerTooltipTextLeft"..i]:GetText()
                        if line == LOCKED then
                            tinsert(self.LockboxTable, { bag, slot } )
                        end
                    end
                end
            end
        end
    end
end
function LockboxMailer:ProcessMailing(click)
        --ClearSendMail()
        --SendMailNameEditBox:SetText("¿√ø¬»À")
    local attachmentIndex = 0
    for i = 1, ATTACHMENTS_MAX_SEND do
        if GetSendMailItem(i) then
            attachmentIndex = attachmentIndex + 1
        end
    end
    if click then
        if attachmentIndex < ATTACHMENTS_MAX_SEND then
            self:FindLockboxes()
        end
        local quantity = #self.LockboxTable
        if next(self.LockboxTable) then
            attachmentIndex = (attachmentIndex == 0 and 1 or attachmentIndex + 1)
            for i = 1, quantity do
                local item = tremove(self.LockboxTable)
                if attachmentIndex == ATTACHMENTS_MAX_SEND then
                    UIErrorsFrame:AddMessage(ERR_MAIL_INVALID_ATTACHMENT_SLOT, 1.0, 0.1, 0.1, 1.0)
                    return
                end
                ClearCursor()
                PickupContainerItem(item[1], item[2])
                ClickSendMailItemButton()
                attachmentIndex = attachmentIndex + 1
            end
            SendMailSubjectEditBox:SetText("["..quantity.."]")
        end
    end
end
do
    local LockBoxButton = CreateFrame("Button", "LockBoxMailButton", SendMailFrame, "ActionButtonTemplate")
    LockBoxButton:ClearAllPoints()
    LockBoxButton:SetPoint("BOTTOMRIGHT", SendMailFrame, "BOTTOMRIGHT", -66, 123)
    LockBoxButton:SetSize(26,26)
    LockBoxButton:RegisterForClicks("AnyUp")
    LockBoxButton:SetScript("OnClick", function(_,btn) LockboxMailer:ProcessMailing(true) end)
    LockBoxButton.icon:SetTexture(134344)
    LockBoxButton.NormalTexture:ClearAllPoints()
end
function LockboxMailer:OnLoad()
    self:SetScript("OnEvent", function(event, ...) self.LockboxTable = {} end)
    self:RegisterEvent("PLAYER_LOGIN")
end
LockboxMailer:OnLoad()