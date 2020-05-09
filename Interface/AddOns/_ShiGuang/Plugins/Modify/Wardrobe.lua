local Wardrobe = {}
Wardrobe.DB = {}

Wardrobe.DB.IconFileIDs = {
    [1] = 132624,
    [2] = 132625,
    [3] = 132626,
    [4] = 132627,
    [5] = 132628,
    [6] = 132629,
    [7] = 132630,
    [8] = 132631,
    [9] = 132632,
    [10] = 132633,
    [11] = 132634,
    [12] = 132635,
    [13] = 132636,
    [14] = 132637,
    [15] = 132638,
    [16] = 132639,
    [17] = 132642,
    [18] = 132643,
    [19] = 132644,
    [20] = 132645,
    [21] = 132646,
    [22] = 132647,
    [23] = 132648,
    [24] = 132649,
    [25] = 132650,
    [26] = 132651,
    [27] = 132652,
    [28] = 132653,
    [29] = 132654,
    [30] = 132655,
    [31] = 132656,
    [32] = 132657,
    [33] = 132658,
    [34] = 132659,
    [35] = 132660,
    [36] = 132661,
    [37] = 132662,
    [38] = 132663,
    [39] = 132664,
    [40] = 132665,
    [41] = 132666,
    [42] = 132667,
    [43] = 132668,
    [44] = 132669,
    [45] = 132670,
    [46] = 132671,
    [47] = 132672,
    [48] = 132673,
    [49] = 132674,
    [50] = 132675,
    [51] = 132676,
    [52] = 132677,
    [53] = 132678,
    [54] = 132679,
    [55] = 132680,
    [56] = 132681,
    [57] = 132682,
    [58] = 132683,
    [59] = 132684,
    [60] = 132685,
    [61] = 132686,
    [62] = 132687,
    [63] = 132688,
    [64] = 132689,

    ---TODO: add 133116-133176, 134947-134969
    
}

Wardrobe.DB.InvSlots = {
    [0] = 'AMMOSLOT',
    [1] = 'HEADSLOT',
    [2] = 'NECKSLOT',
    [3] = 'SHOULDERSLOT',
    [4] = 'SHIRTSLOT',
    [5] = 'CHESTSLOT',
    [6] = 'WAISTSLOT',
    [7] = 'LEGSSLOT',
    [8] = 'FEETSLOT',
    [9] = 'WRISTSLOT',
    [10] = 'HANDSSLOT',
    [11] = 'FINGER0SLOT',
    [12] = 'FINGER1SLOT',
    [13] = 'TRINKET0SLOT',
    [14] = 'TRINKET1SLOT',
    [15] = 'BACKSLOT',
    [16] = 'MAINHANDSLOT',
    [17] = 'SECONDARYHANDSLOT',
    [18] = 'RANGEDSLOT',
    [19] = 'TABARDSLOT',
}

Wardrobe.DB.ClassColours = {
	DEATHKNIGHT = { r = 0.77, g = 0.12, b = 0.23, fs = '|cffC41F3B' },
	DRUID = { r = 1.00, g = 0.49, b = 0.04, fs = '|cffFF7D0A' },
	HUNTER = { r = 0.67, g = 0.83, b = 0.45, fs = '|cffABD473' },
	MAGE = { r = 0.25, g = 0.78, b = 0.92, fs = '|cff40C7EB' },
	PALADIN = { r = 0.96, g = 0.55, b = 0.73, fs = '|cffF58CBA' },
	PRIEST = { r = 1.00, g = 1.00, b = 1.00, fs = '|cffFFFFFF' },
	ROGUE = { r = 1.00, g = 0.96, b = 0.41, fs = '|cffFFF569' },
	SHAMAN = { r = 0.00, g = 0.44, b = 0.87, fs = '|cff0070DE' },
	WARLOCK = { r = 0.53, g = 0.53, b =	0.93, fs = '|cff8787ED' },
	WARRIOR = { r = 0.78, g = 0.61, b = 0.43, fs = '|cffC79C6E' },
}



--[==[
Copyright ©2019 Samuel Thomas Pain

The contents of this addon, excluding third-party resources, are
copyrighted to their authors with all rights reserved.

This addon is free to use and the authors hereby grants you the following rights:

1. 	You may make modifications to this addon for private use only, you
    	may not publicize any portion of this addon.

2. 	Do not modify the name of this addon, including the addon folders.

3. 	This copyright notice shall be included in all copies or substantial
    	portions of the Software.

All rights not explicitly addressed in this license are reserved by
the copyright holders.
]==]--


--[==[

TODO
add cloak/helm toggles for sets
add info into UI regarding set count etc

]==]--

Wardrobe.UI = {}
Wardrobe.Vars = { CurrentlyEquippedOutfit = nil, SelectedOutfit = nil, TooltipLineAdded = false, BagSpaceTable = {}, BankBagSpaceTable = {}, EmptyBagSpace = 0 }
Wardrobe.QuickPanelButtons = {}


Wardrobe.EventFrame = CreateFrame("FRAME", "Wardrobe_EventFrame", UIParent)
Wardrobe.EventFrame:RegisterEvent("ADDON_LOADED")
Wardrobe.EventFrame:RegisterEvent("BANKFRAME_OPENED")
Wardrobe.EventFrame:RegisterEvent("BANKFRAME_CLOSED")

function Wardrobe.GetArgs(...)
    for i=1, select("#", ...) do
        print(i.." "..tostring(select(i, ...)))
    end
end

function Wardrobe.MakeFrameMovable(frame)
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", frame.StartMoving)
	frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
end

function Wardrobe.LockFramePos(frame)
	frame:SetMovable(false)
end

function Wardrobe.PrintMessage(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffFF7D0AWardrobe: |r"..msg)
end

SLASH_WARDROBE1 = '/wardrobe'
SlashCmdList['WARDROBE'] = function(msg)

    if msg == 'help' then
        print('no help!')
        Wardrobe.FixDb()
    elseif string.find(msg, 'equipset-') then
        if ShiGuangDB[UnitGUID('player')] ~= nil then
            for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
                if outfit.Name == string.sub(msg, 10) then
                    Wardrobe.Vars.SelectedOutfit = outfit.Name
                    UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, outfit.Name)
                    --Wardrobe.EquipCurrentSet()
                    Wardrobe.IterateSet(outfit.Name)
                end
            end
        end


    end

end

StaticPopupDialogs["Wardrobe_NewOutfit"] = {
	text = "新套装名", button1 = "Ok", button2 = "取消",
    hasEditBox = true, EditBoxOnTextChanged = function(self) if self:GetText() ~= '' then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end end,
	OnShow = function(self) self.editBox:SetText('') self.button1:Disable() end,
	OnAccept = function(self) Wardrobe.CreateNewOutfit(self.editBox:GetText()) end,
	timeout = 0, whileDead = true, hideOnEscape = true,	preferredIndex = 3,
}

StaticPopupDialogs["Wardrobe_CustomIconDialog"] = {
	text = "输入要使用的纹理的数字文件ID.\n\n这些可以通过wowhead找到，是一个6位数的数字.", button1 = "Ok", button2 = "取消",
    hasEditBox = true, EditBoxOnTextChanged = function(self) if self:GetText() ~= '' then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end end,
	OnShow = function(self) self.editBox:SetText('') self.button1:Disable() end,
	OnAccept = function(self) Wardrobe.SetIcon(tonumber(self.editBox:GetText())) end,
	timeout = 0, whileDead = true, hideOnEscape = true,	preferredIndex = 3,
}

--tooltip info, uses item ID which is still an issue where a player may have 2 items of the same name but with different random enchants (of the owl, of the boar) i assume the item keeps the same id but would have a different link?
function Wardrobe.OnTooltipSetItem(tooltip, ...)
    local ItemName, ItemLink = GameTooltip:GetItem()
    if ItemLink then
        local setsString = nil
        if ShiGuangDB[UnitGUID('player')] ~= nil then
            for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
                for slot, itemID in pairs(outfit) do
                    local added = false
                    if added == true then break end
                    if slot ~= 'Name' then
                        local id = select(1, GetItemInfoInstant(ItemLink))
                        if id == itemID then
                            if setsString == nil then
                                setsString = outfit.Name
                                added = true
                            else
                                setsString = tostring(setsString..', '..outfit.Name)
                                added = true
                            end
                        end
                    end
                end
            end
        end
        if setsString ~= nil then
            if not Wardrobe.Vars.TooltipLineAdded then
                tooltip:AddLine(' ') --create a line break
                tooltip:AddLine("套装", 1.00, 0.49, 0.04)
                tooltip:AddLine(setsString, 1, 1, 1)
                Wardrobe.Vars.TooltipLineAdded = true
            end
        end
    end
end

function Wardrobe.OnTooltipCleared(tooltip, ...)
    Wardrobe.Vars.TooltipLineAdded = false
end

GameTooltip:HookScript("OnTooltipSetItem", Wardrobe.OnTooltipSetItem)
GameTooltip:HookScript("OnTooltipCleared", Wardrobe.OnTooltipCleared)

Wardrobe.UI.OpenWardrobeButton = CreateFrame("BUTTON", "Wardrobe_OpenButton", PaperDollFrame) --, "UIPanelSquareButton") -- "UIPanelButtonTemplate")
Wardrobe.UI.OpenWardrobeButton:SetPoint("TOPRIGHT", -55, -15)
Wardrobe.UI.OpenWardrobeButton:SetSize(26, 21)
Wardrobe.UI.OpenWardrobeButton.Texture = Wardrobe.UI.OpenWardrobeButton:CreateTexture("$parent_Texture", "OVERLAY")
Wardrobe.UI.OpenWardrobeButton.Texture:SetAllPoints(Wardrobe.UI.OpenWardrobeButton)
Wardrobe.UI.OpenWardrobeButton.Texture:SetTexture("interface/paperdollinfoframe/ui-gearmanager-button")
Wardrobe.UI.OpenWardrobeButton:SetScript("OnEnter", function(self) self:SetAlpha(0.85) end)
Wardrobe.UI.OpenWardrobeButton:SetScript("OnLeave", function(self) self:SetAlpha(1.0) end)
Wardrobe.UI.OpenWardrobeButton:SetScript("OnMouseDown", function(self) self.Texture:SetTexture("interface/paperdollinfoframe/ui-gearmanager-button-pushed") end)
Wardrobe.UI.OpenWardrobeButton:SetScript("OnMouseUp", function(self) self.Texture:SetTexture("interface/paperdollinfoframe/ui-gearmanager-button") end)
Wardrobe.UI.OpenWardrobeButton:SetScript("OnClick", function() if Wardrobe.UI.OutfitFrame:IsVisible() then Wardrobe.UI.OutfitFrame:Hide() else Wardrobe.UI.OutfitFrame:Show() end end)

Wardrobe.UI.OutfitFrame = CreateFrame("FRAME", "Wardrobe_Outfitframe", PaperDollFrame)
Wardrobe.UI.OutfitFrame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "interface/dialogframe/ui-dialogbox-border", tile = true, tileSize = 16, edgeSize = 20, insets = { left = 4, right = 4, top = 4, bottom = 4 }});
Wardrobe.UI.OutfitFrame:SetBackdropColor(0, 0, 0, 0.9)
Wardrobe.UI.OutfitFrame:SetSize(240, 156)
Wardrobe.UI.OutfitFrame:SetPoint("TOPLEFT", Wardrobe.UI.OpenWardrobeButton, "TOPLEFT", 45, 0)
Wardrobe.UI.OutfitFrame:Hide()

Wardrobe.UI.OutfitFrame.NewOutfitButton = CreateFrame("BUTTON", "Wardrobe_NewOutfitButton", Wardrobe_Outfitframe, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.NewOutfitButton:SetPoint("TOPLEFT", 10, -10)
Wardrobe.UI.OutfitFrame.NewOutfitButton:SetText('新建')
Wardrobe.UI.OutfitFrame.NewOutfitButton:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.NewOutfitButton:SetScript("OnClick", function() StaticPopup_Show("Wardrobe_NewOutfit") end)

Wardrobe.UI.OutfitFrame.SaveCurrentlyEquippedButton = CreateFrame("BUTTON", "Wardrobe_SaveCurrentlyEquippedButton", Wardrobe_Outfitframe, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.SaveCurrentlyEquippedButton:SetPoint("TOPLEFT", 85, -10)
Wardrobe.UI.OutfitFrame.SaveCurrentlyEquippedButton:SetText('保存')
Wardrobe.UI.OutfitFrame.SaveCurrentlyEquippedButton:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.SaveCurrentlyEquippedButton:SetScript("OnClick", function() Wardrobe.SaveCurrentOutfit() end)

Wardrobe.UI.OutfitFrame.DeleteCurrentSet = CreateFrame("BUTTON", "Wardrobe_DeleteCurrentSet", Wardrobe_Outfitframe, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.DeleteCurrentSet:SetPoint("TOPLEFT", 160, -10)
Wardrobe.UI.OutfitFrame.DeleteCurrentSet:SetText('删除')
Wardrobe.UI.OutfitFrame.DeleteCurrentSet:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.DeleteCurrentSet:SetScript("OnClick", function() Wardrobe.DeleteCurrentSet() end)

Wardrobe.UI.OutfitFrame.EquipCurrentSet = CreateFrame("BUTTON", "Wardrobe_EquipCurrentSet", Wardrobe_Outfitframe, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.EquipCurrentSet:SetPoint("TOPLEFT", 160, -40)
Wardrobe.UI.OutfitFrame.EquipCurrentSet:SetText('装备')
Wardrobe.UI.OutfitFrame.EquipCurrentSet:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.EquipCurrentSet:SetScript("OnClick", function() Wardrobe.IterateSet(Wardrobe.Vars.SelectedOutfit) end)

Wardrobe.UI.OutfitFrame.OutfitDropDown = CreateFrame("FRAME", "GHC_PlayerRoleDropdown", Wardrobe_Outfitframe, "UIDropDownMenuTemplate")
Wardrobe.UI.OutfitFrame.OutfitDropDown:SetPoint("TOPLEFT", -5, -40)
Wardrobe.UI.OutfitFrame.OutfitDropDown.displayMode = nil --"MENU"
UIDropDownMenu_SetWidth(Wardrobe.UI.OutfitFrame.OutfitDropDown, 120)
UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, 'Outfits')
function Wardrobe.UI.OutfitFrame.OutfitDropDown_Init()
	UIDropDownMenu_Initialize(Wardrobe.UI.OutfitFrame.OutfitDropDown, function(self, level, menuList)
		local info = UIDropDownMenu_CreateInfo()
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            info.text = outfit.Name
            info.arg1 = nil
            info.arg2 = nil						
            info.func = function()
                Wardrobe.Vars.SelectedOutfit = outfit.Name
                UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, outfit.Name)
                Wardrobe.UpdateOutfitFrame()
                Wardrobe.UpdateQuickPanel()
                --Wardrobe.EquipCurrentSet()
            end
            info.isNotRadio = true
            --info.hasArrow = true
            --info.menuList = class.MenuList
            UIDropDownMenu_AddButton(info)
        end
	end)
end

Wardrobe.UI.HelmCheckbox = CreateFrame("CheckButton", 'WardrobeUIHelmCheckbox', Wardrobe_Outfitframe, "ChatConfigCheckButtonTemplate")
Wardrobe.UI.HelmCheckbox:SetPoint('TOPLEFT', 10, -70)
WardrobeUIHelmCheckboxText:SetText('头盔')
WardrobeUIHelmCheckboxText:SetSize(50, 20)
Wardrobe.UI.HelmCheckbox:SetScript('OnClick', function(self) ShowHelm(self:GetChecked()) Wardrobe.EditCurrentOutfit(Wardrobe.Vars.SelectedOutfit, 'helm', self:GetChecked()) end)
Wardrobe.UI.HelmCheckbox.tooltip = '展示这个套装的头盔'

Wardrobe.UI.CloakCheckbox = CreateFrame("CheckButton", 'WardrobeUICloakCheckbox', Wardrobe_Outfitframe, "ChatConfigCheckButtonTemplate")
Wardrobe.UI.CloakCheckbox:SetPoint('TOPLEFT', 10, -95)
WardrobeUICloakCheckboxText:SetText('披风')
WardrobeUICloakCheckboxText:SetSize(50, 20)
Wardrobe.UI.CloakCheckbox:SetScript('OnClick', function(self) ShowCloak(self:GetChecked()) Wardrobe.EditCurrentOutfit(Wardrobe.Vars.SelectedOutfit, 'cloak', self:GetChecked()) end)
Wardrobe.UI.CloakCheckbox.tooltip = '展示这个套装的披风'

Wardrobe.UI.OutfitIsOnHUDCheckbox = CreateFrame("CheckButton", 'WardrobeUIOutfitIsOnHUDCheckbox', Wardrobe_Outfitframe, "ChatConfigCheckButtonTemplate")
Wardrobe.UI.OutfitIsOnHUDCheckbox:SetPoint('TOPLEFT', 10, -120)
WardrobeUIOutfitIsOnHUDCheckboxText:SetText('在快速面板上显示')
WardrobeUIOutfitIsOnHUDCheckboxText:SetSize(60, 40)
Wardrobe.UI.OutfitIsOnHUDCheckbox:SetScript('OnClick', function(self) 
    Wardrobe.EditCurrentOutfit(Wardrobe.Vars.SelectedOutfit, 'quickPanel', self:GetChecked())
    if self:GetChecked() == true then
        Wardrobe.AddToQuickPanel(Wardrobe.Vars.SelectedOutfit)
        if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
            if ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit] ~= nil then
                if ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['icon'] ~= nil then
                    Wardrobe.UI.IconTexture:SetTexture(tonumber(ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['icon']))
                end
            end
        end
    else
        Wardrobe.RemoveFromQuickPanel(Wardrobe.Vars.SelectedOutfit)
    end
    Wardrobe.UpdateQuickPanel()
end)
Wardrobe.UI.OutfitIsOnHUDCheckbox.tooltip = '在快速面板上包括装备'

Wardrobe.UI.OutfitFrame.IconPickerButton = CreateFrame("BUTTON", "Wardrobe_EquipCurrentSet", Wardrobe_Outfitframe, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.IconPickerButton:SetPoint("TOPLEFT", 160, -70)
Wardrobe.UI.OutfitFrame.IconPickerButton:SetText('图标')
Wardrobe.UI.OutfitFrame.IconPickerButton:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.IconPickerButton:SetScript("OnClick", function() if Wardrobe.UI.IconPickerFrame:IsVisible() then Wardrobe.UI.IconPickerFrame:Hide() else Wardrobe.UI.IconPickerFrame:Show() end end)

Wardrobe.UI.IconPickerFrame = CreateFrame("FRAME", "Wardrobe_IconPickerFrame", Wardrobe_Outfitframe)
Wardrobe.UI.IconPickerFrame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "interface/dialogframe/ui-dialogbox-border", tile = true, tileSize = 16, edgeSize = 20, insets = { left = 4, right = 4, top = 4, bottom = 4 }});
Wardrobe.UI.IconPickerFrame:SetBackdropColor(0, 0, 0, 0.9)
Wardrobe.UI.IconPickerFrame:SetSize(290, 288)
Wardrobe.UI.IconPickerFrame:SetPoint("TOPLEFT", 250, 0)
Wardrobe.UI.IconPickerFrame:Hide()

Wardrobe.UI.OutfitFrame.CustomIconPickerButton = CreateFrame("BUTTON", "Wardrobe_EquipCurrentSet", Wardrobe.UI.IconPickerFrame, "UIPanelButtonTemplate")
Wardrobe.UI.OutfitFrame.CustomIconPickerButton:SetPoint("TOPRIGHT", -10, -10)
Wardrobe.UI.OutfitFrame.CustomIconPickerButton:SetText('自定义')
Wardrobe.UI.OutfitFrame.CustomIconPickerButton:SetSize(70, 22)
Wardrobe.UI.OutfitFrame.CustomIconPickerButton:SetScript("OnClick", function() StaticPopup_Show("Wardrobe_CustomIconDialog") end)

Wardrobe.UI.IconPickerTextures = {}
function Wardrobe.DrawIconPickerIcons()
    local test = 236575
    local k = 1
    for i = 1, 8 do
        for j = 1, 8 do
            local f = CreateFrame("FRAME", tostring("$parent_IconFrame_"..i..'_'..j), Wardrobe.UI.IconPickerFrame)
            f:SetSize(30, 30)
            f:SetPoint("TOPLEFT", ((j - 1) * 30) + 10, (((i - 1) * 30) + 40) * -1 )
            f.t = f:CreateTexture("$parent_Texture", "ARTWORK")
            --f.t:SetAllPoints(f)
            f.t:SetPoint("TOPLEFT", 1, -1)
            f.t:SetPoint("BOTTOMRIGHT", -1, 1)

            ---use this to find new icons            
            --f.t:SetTexture(tonumber(test) +  k)
            --f.textureID = tonumber(test) +  k

            ---use this in release
            f.t:SetTexture(Wardrobe.DB.IconFileIDs[k])
            f.textureID = Wardrobe.DB.IconFileIDs[k]

            f:SetScript("OnMouseDown", function(self) 

                Wardrobe.SetIcon(self.textureID)
                --[==[
                Wardrobe.UI.IconTexture:SetTexture(self.textureID) 
                if ShiGuangDB[UnitGUID('player')] ~= nil then
                    if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits ~= nil then
                        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[Wardrobe.Vars.SelectedOutfit] ~= nil then
                            ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[Wardrobe.Vars.SelectedOutfit] = { Name = Wardrobe.Vars.SelectedOutfit, Icon = self.textureID }
                        end
                    end
                    if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
                        if ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit] ~= nil then
                            ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['icon'] = self.textureID
                        end
                    end
                end
                Wardrobe.UpdateQuickPanel()

                Wardrobe.UI.IconPickerFrame:Hide()
                ]==]--
            end)

            Wardrobe.UI.IconPickerTextures[k] = f
            k = k + 1
        end
    end
end

Wardrobe.UI.IconTexture = Wardrobe.UI.OutfitFrame:CreateTexture("$parent_SetIconTexture", "ARTWORK")
Wardrobe.UI.IconTexture:SetSize(40,40)
Wardrobe.UI.IconTexture:SetPoint("TOPLEFT", 175, -100)

Wardrobe.DrawIconPickerIcons()

Wardrobe.UI.QuickPanelConfig = {
    outfitButtonSize = 30.0,
    outfitIconSize = 30.0,
    outfitButtonMargin = 10.0,
    tooltipOffsetX = 30.0,
    tooltipOffsetY = 30.0,
}

Wardrobe.UI.QuickPanel = CreateFrame("FRAME", "WardrobeQuickPanel", UIParent)
Wardrobe.UI.QuickPanel:SetPoint("CENTER", 0, 0)
Wardrobe.UI.QuickPanel:SetSize(tonumber((Wardrobe.UI.QuickPanelConfig.outfitButtonMargin * 2) + Wardrobe.UI.QuickPanelConfig.outfitButtonSize), tonumber((Wardrobe.UI.QuickPanelConfig.outfitButtonMargin * 2) + Wardrobe.UI.QuickPanelConfig.outfitButtonSize))
Wardrobe.UI.QuickPanel:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "interface/dialogframe/ui-dialogbox-border", tile = true, tileSize = 16, edgeSize = 20, insets = { left = 4, right = 4, top = 4, bottom = 4 }});
Wardrobe.UI.QuickPanel:SetBackdropColor(0, 0, 0, 0.9)

Wardrobe.UI.QuickPanel.tooltip = CreateFrame("FRAME", "WardrobeQuickPanelTooltip", Wardrobe.UI.QuickPanel, "TooltipBorderedFrameTemplate")
Wardrobe.UI.QuickPanel.tooltip:SetSize(100, 30)
Wardrobe.UI.QuickPanel.tooltip:SetPoint("BOTTOMLEFT", Wardrobe.UI.QuickPanelConfig.outfitButtonSize, Wardrobe.UI.QuickPanelConfig.outfitButtonSize)
Wardrobe.UI.QuickPanel.tooltip.SetName = Wardrobe.UI.QuickPanel.tooltip:CreateFontString(nil, "OVERLAY", "GameFontNormal_NoShadow")
Wardrobe.UI.QuickPanel.tooltip.SetName:SetPoint("CENTER", 0, 0)
Wardrobe.UI.QuickPanel.tooltip.SetName:SetFont("Fonts\\ARHei.TTF", 13)
Wardrobe.UI.QuickPanel.tooltip.SetName:SetTextColor(1,1,1,1)
Wardrobe.UI.QuickPanel.tooltip.SetName:SetText('套装名')
Wardrobe.UI.QuickPanel.tooltip:Hide()

Wardrobe.MakeFrameMovable(Wardrobe.UI.QuickPanel)

function Wardrobe.CreateQuickPanelButton(set, xPosIter, setIcon)
    local f = CreateFrame("FRAME", tostring("WardrobeQuickPanelButton_"..(xPosIter-1)), Wardrobe.UI.QuickPanel)
    f:SetSize(Wardrobe.UI.QuickPanelConfig.outfitButtonSize, Wardrobe.UI.QuickPanelConfig.outfitButtonSize)
    --f.border = f:CreateTexture("$parent_BorderTexture", "BACKGROUND")
    --f.border:SetAllPoints(f)
    --f.border:SetColorTexture(0,0,0,0)
    f.icon = f:CreateTexture("$parent_IconTexture", "ARTWORK")
    f.icon:SetPoint("CENTER", 0, 0)
    f.icon:SetSize(Wardrobe.UI.QuickPanelConfig.outfitIconSize, Wardrobe.UI.QuickPanelConfig.outfitIconSize)
    if setIcon == nil then
        f.icon:SetTexture(130773)
    else
        f.icon:SetTexture(setIcon)
    end

    f.set = set

    xPosIter = xPosIter - 1
    local xPos = tonumber(Wardrobe.UI.QuickPanelConfig.outfitButtonMargin + (xPosIter * (Wardrobe.UI.QuickPanelConfig.outfitButtonSize + Wardrobe.UI.QuickPanelConfig.outfitButtonMargin)))

    f:SetPoint("LEFT", xPos, 0)

    f:SetScript("OnEnter", function(self)
        --self.border:SetColorTexture(Wardrobe.DB.ClassColours[string.upper(UnitClass('player'))].r, Wardrobe.DB.ClassColours[string.upper(UnitClass('player'))].g, Wardrobe.DB.ClassColours[string.upper(UnitClass('player'))].b, 0.85)
        f.icon:SetAlpha(0.65)
        Wardrobe.UI.QuickPanel.tooltip.SetName:SetText(self.set)
        Wardrobe.UI.QuickPanel.tooltip:SetParent(self)
        Wardrobe.UI.QuickPanel.tooltip:SetPoint("TOPLEFT", Wardrobe.UI.QuickPanelConfig.tooltipOffsetX, Wardrobe.UI.QuickPanelConfig.tooltipOffsetY)
        Wardrobe.UI.QuickPanel.tooltip:SetSize(Wardrobe.UI.QuickPanel.tooltip.SetName:GetWidth() + 20, Wardrobe.UI.QuickPanel.tooltip.SetName:GetHeight() + 5)
        Wardrobe.UI.QuickPanel.tooltip:Show()
    end)
    f:SetScript("OnLeave", function(self) 
        --self.border:SetColorTexture(0,0,0,0)
        f.icon:SetAlpha(1.0)
        Wardrobe.UI.QuickPanel.tooltip:Hide()
    end)
    f:SetScript("OnMouseDown", function(self)
        Wardrobe.IterateSet(self.set)
    end)

    return f
    --Wardrobe.QuickPanelButtons[xPosIter] = f
end

function Wardrobe.SetIcon(texture)
    Wardrobe.UI.IconTexture:SetTexture(texture) 
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits ~= nil then
            if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[Wardrobe.Vars.SelectedOutfit] ~= nil then
                ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[Wardrobe.Vars.SelectedOutfit] = { Name = Wardrobe.Vars.SelectedOutfit, Icon = texture }
            end
        end
        if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
            if ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit] ~= nil then
                ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['icon'] = texture
            end
        end
    end
    Wardrobe.UpdateQuickPanel()

    Wardrobe.UI.IconPickerFrame:Hide()
end

function Wardrobe.UpdateOutfitFrame()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
            --update character wardrobe extension panel
            if ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit] ~= nil then
                Wardrobe.UI.HelmCheckbox:SetChecked(ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['helm'])
                Wardrobe.UI.CloakCheckbox:SetChecked(ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['cloak'])
                Wardrobe.UI.OutfitIsOnHUDCheckbox:SetChecked(ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['quickPanel'])
                Wardrobe.UI.IconTexture:SetTexture(ShiGuangDB[UnitGUID('player')].OutfitSettings[Wardrobe.Vars.SelectedOutfit]['icon'])
            end
        end
    end
end

function Wardrobe.AddToQuickPanel(set)
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits ~= nil then
            ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[set] = { Name = set, Icon = 130773 }
        end
    end
end

function Wardrobe.RemoveFromQuickPanel(set)
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits ~= nil then
            ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[set] = {}
            ShiGuangDB[UnitGUID('player')].QuickPanelOutfits[set] = nil
        end
    end
end

function Wardrobe.UpdateQuickPanel()
    local qpCount = 0
    if Wardrobe.QuickPanelButtons ~= nil then
        for k, f in ipairs(Wardrobe.QuickPanelButtons) do
            f:Hide()
            --f.set = nil
            --f.icon = nil
        end
    end
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits ~= nil then
            local k = 1
            for n, outfit in pairs(ShiGuangDB[UnitGUID('player')].QuickPanelOutfits) do
                if Wardrobe.QuickPanelButtons[k] == nil then
                    Wardrobe.QuickPanelButtons[k] = Wardrobe.CreateQuickPanelButton(outfit.Name, k, tonumber(outfit.Icon))
                    --Wardrobe.CreateQuickPanelButton(outfit.Name, k, outfit.Icon)
                else
                    local xPos = tonumber(Wardrobe.UI.QuickPanelConfig.outfitButtonMargin + ((k-1) * (Wardrobe.UI.QuickPanelConfig.outfitButtonSize + Wardrobe.UI.QuickPanelConfig.outfitButtonMargin)))
                    Wardrobe.QuickPanelButtons[k]:SetPoint("LEFT", xPos, 0)
                    Wardrobe.QuickPanelButtons[k].set = outfit.Name
                    --Wardrobe.QuickPanelButtons[k].set = outfitName
                    --Wardrobe.QuickPanelButtons[k].icon:SetTexture(tonumber(outfit.Icon))
                    Wardrobe.QuickPanelButtons[k]:Show()
                end
                if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
                    if ShiGuangDB[UnitGUID('player')].OutfitSettings[outfit.Name] ~= nil then
                        if ShiGuangDB[UnitGUID('player')].OutfitSettings[outfit.Name]['icon'] ~= nil then
                            Wardrobe.QuickPanelButtons[k].icon:SetTexture(tonumber(ShiGuangDB[UnitGUID('player')].OutfitSettings[outfit.Name]['icon']))
                        end
                    end
                end
                local width = tonumber(Wardrobe.UI.QuickPanelConfig.outfitButtonMargin + (k * (Wardrobe.UI.QuickPanelConfig.outfitButtonSize + Wardrobe.UI.QuickPanelConfig.outfitButtonMargin)))
                Wardrobe.UI.QuickPanel:SetSize(width, Wardrobe.UI.QuickPanelConfig.outfitButtonSize + Wardrobe.UI.QuickPanelConfig.outfitButtonMargin + Wardrobe.UI.QuickPanelConfig.outfitButtonMargin)
                k = k + 1
                qpCount = qpCount + 1
            end
        end
    end
    if qpCount == 0 then
        Wardrobe.UI.QuickPanel:Hide()
    else
        Wardrobe.UI.QuickPanel:Show()
    end
end

--- returns info about the outfit and what changes TODO: keep testing to make this perfect, counts seem 1 out ?
function Wardrobe.GetSetItemData(outfit)
    local toRemove, toAdd, toSwap, toKeep, totalSetItems = 0, 0, 0, 0, 0
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        for slot, item in pairs(outfit) do
            if slot ~= 'Name' then
                local slotId, textureName = GetInventorySlotInfo(slot)
                if item ~= 'empty' then
                    totalSetItems = totalSetItems + 1
                end
                local slotItemId = GetInventoryItemID("player", slotId)

                if slotItemId == item then -- slot and outfit match so no change
                    toKeep = toKeep + 1
                elseif slotItemId == nil and item ~= 'empty' then --slot is empty and outfit has item so we add
                    toAdd = toAdd + 1
                elseif slotItemId ~= nil and item == 'empty' then -- slot has item and outfit is empty so remove
                    toRemove = toRemove + 1
                elseif slotItemId ~= nil and item ~= 'empty' and slotItemId ~= item then
                    toSwap = toSwap + 1 --slot has item and outfit has item but dont match so its swap
                end
            end
        end
    end
    return toRemove, toAdd, toSwap, toKeep, totalSetItems
end

--- old function ?
function Wardrobe.GetEmptyBagSlotCount()
    Wardrobe.Vars.EmptyBagSpace = 0
	for bag = 4, 0, -1 do
        for slot = 1, GetContainerNumSlots(bag) do
            --local item = GetContainerItemID(bag, slot)
            local link = GetContainerItemLink(bag, slot)
            if link == nil then
                Wardrobe.Vars.EmptyBagSpace = Wardrobe.Vars.EmptyBagSpace + 1
            end
        end
    end
    return Wardrobe.Vars.EmptyBagSpace
end

--- scans character bags and creates a table of ID's for bags with empty slots, each empty slot will cause its bag ID to be entered into table
function Wardrobe.MapBagSlots()
    Wardrobe.Vars.BagSpaceTable = {}
	for bag = 4, 0, -1 do
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link == nil then
                table.insert(Wardrobe.Vars.BagSpaceTable, bag)
            end
        end
    end
end

--- TODO: test this function to be used in enable wardrobe to move items into bank
function Wardrobe.MapBankBagSlots()
    Wardrobe.Vars.BankBagSpaceTable = {}
	for bag = BANK_CONTAINER, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link == nil then
                table.insert(Wardrobe.Vars.BagSpaceTable, bag)
            end
        end
    end
end

--- returns true or false if backpack has an empty slot, old function no longer used
function Wardrobe.EmptyBackpackSlot()
	local bag = 0
    for slot = 1, GetContainerNumSlots(bag) do
        local item = GetContainerItemID(bag, slot)
        if item == nil then
            return true
        end
    end
end

--- will unequip items and put in character bags regardless of available slots @outfit=table of outfit items, @slot=string of inv slot(key used in outfit table), @itemID=interger id of item(value used in outfit table), @i=iter count used in bag checks
---TODO: can the slot and itemID be removed if the outfit table is passed in OR if outfit table is only used for name in debug just pass in name?
function Wardrobe.UnequipSlot(outfit, slot, itemID, i)
    local slotId, textureName = GetInventorySlotInfo(slot)
    local itemLink = select(2, GetItemInfo(itemID))
    if Wardrobe.Vars.BagSpaceTable[i] > 0 then
        PickupInventoryItem(slotId)
        local bagID = Wardrobe.Vars.BagSpaceTable[i] + 19
        local bagLink = GetInventoryItemLink('player', bagID)
        PutItemInBag(bagID)
    elseif Wardrobe.Vars.BagSpaceTable[i] == 0 then
        PickupInventoryItem(slotId)
        PutItemInBackpack()
    else
    end
end

--- taken from gamepedia, will auto equip items from the bank TODO: create a custom function to move items into bags and use the better EquipItemByName api
function Wardrobe.EquipItemByID(id)
	for bag = BANK_CONTAINER, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		for slot = 1,GetContainerNumSlots(bag) do
            local item = GetContainerItemID(bag, slot)
            if item and item == id then
				if CursorHasItem() or CursorHasMoney() or CursorHasSpell() then ClearCursor() end
				PickupContainerItem(bag, slot)
				AutoEquipCursorItem()
				return true
			end
		end
	end
end

function Wardrobe.IterateSet(set)
    Wardrobe.MapBagSlots()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        ShiGuangDB[UnitGUID('player')].CurrentOutfit = set
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            if outfit.Name == set then

                --apply settings
                if ShiGuangDB[UnitGUID('player')] ~= nil then
                    if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
                        if ShiGuangDB[UnitGUID('player')].OutfitSettings[set] ~= nil then
                            ShowHelm(ShiGuangDB[UnitGUID('player')].OutfitSettings[set]['helm'])
                            ShowCloak(ShiGuangDB[UnitGUID('player')].OutfitSettings[set]['cloak'])
                        end
                    end
                end



                local toRemove, toAdd, toSwap, toKeep, total = Wardrobe.GetSetItemData(outfit)

                if CursorHasItem() or CursorHasMoney() or CursorHasSpell() then ClearCursor() end
                local i = 1
                for slot, itemID in pairs(outfit) do
                    if slot ~= 'Name' then
                        local slotId, textureName = GetInventorySlotInfo(slot)
                        if itemID == 'empty' then --unequip slot
                            if i <= (#Wardrobe.Vars.BagSpaceTable - 1) then
                                local slotLink = GetInventoryItemLink('player', slotId)
                                if slotLink then
                                    Wardrobe.UnequipSlot(outfit, slot, itemID, i)
                                    i = i + 1
                                end
                            end
                            
                        end

                        if itemID ~= 'empty' then --equip slot, either add or swap
                            local itemLink = select(2, GetItemInfo(itemID))
                            if Wardrobe.Vars.BankOpen == true then
                                Wardrobe.EquipItemByID(itemID)
                            else
                                EquipItemByName(itemID, slotId)
                            end

                        end

                    end
                  
                    
                    
                    --Wardrobe.HandleSlot(outfit, slot, itemID)
                    --local t = C_Timer.After(i * 0.25, function() Wardrobe.HandleSlot(outfit, slot, itemID, i) end)
                    
                    --[==[
                    if slot ~= 'Name' then
                        local slotId, textureName = GetInventorySlotInfo(slot)
                        local itemLink = select(2, GetItemInfo(itemID))
                        if itemID == 'empty' then                        
                            if Wardrobe.GetEmptyBagSlot() ~= nil then
                                PickupInventoryItem(slotId)
                                local bagID = Wardrobe.GetEmptyBagSlot() + 19
                                local bagLink = GetInventoryItemLink('player', bagID)
                                PutItemInBag(bagID)
                            elseif Wardrobe.GetEmptyBackpackSlot() ~= nil then
                                PickupInventoryItem(slotId)
                                PutItemInBackpack()
                            else
                            end
                        else
                            if Wardrobe.Vars.BankOpen == true then
                                Wardrobe.EquipItemByID(itemID)
                            else
                                EquipItemByName(itemID, slotId)
                            end
                        end
                    end
                    ]==]--

                end
                Wardrobe.Vars.CurrentlyEquippedOutfit = set
            end
        end
    end
end



function Wardrobe.LoadCharacter()
    if ShiGuangDB[UnitGUID('player')] == nil then
        ShiGuangDB[UnitGUID('player')] = { Outfits = {}, OutfitSettings = {}, QuickPanelSettings = {}, CurrentOutfit = nil }
    else
        --Wardrobe.FixDb()
        Wardrobe.CreateOutfitSettingsDb()
        Wardrobe.CreateQuickPanelDb()
    end

    Wardrobe.UI.OutfitFrame.OutfitDropDown_Init()
    if ShiGuangDB[UnitGUID('player')].CurrentOutfit ~= nil then
        Wardrobe.Vars.SelectedOutfit = ShiGuangDB[UnitGUID('player')].CurrentOutfit
        UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, ShiGuangDB[UnitGUID('player')].CurrentOutfit)
    end
    Wardrobe.UpdateQuickPanel()
    Wardrobe.UpdateOutfitFrame()
end

function Wardrobe.CreateNewOutfit(outfitName)
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        local add = true
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            if outfit.Name == outfitName then
                add = false
                Wardrobe.PrintMessage('outfit already exists, choose a new name!')
            end
        end
        if add == true then
            table.insert(ShiGuangDB[UnitGUID('player')].Outfits, { Name = outfitName, } )
            Wardrobe.Vars.SelectedOutfit = outfitName
            UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, outfitName)
            Wardrobe.PrintMessage('created '..outfitName)
        end
    end
end

function Wardrobe.DeleteCurrentSet()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            if outfit.Name == Wardrobe.Vars.SelectedOutfit then
                Wardrobe.PrintMessage('deleted '..outfit.Name)
                table.remove(ShiGuangDB[UnitGUID('player')].Outfits, k) --change this as its a terrible idea - create a better remove function
                UIDropDownMenu_SetText(Wardrobe.UI.OutfitFrame.OutfitDropDown, '')
            end
        end
    end
end

function Wardrobe.SaveCurrentOutfit()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            if outfit.Name == Wardrobe.Vars.SelectedOutfit then
                for i = 1, 19 do
                    local itemId = GetInventoryItemID("player", i)
                    if itemId then
                        outfit[Wardrobe.DB.InvSlots[i]] = itemId
                    else
                        outfit[Wardrobe.DB.InvSlots[i]] = 'empty'
                    end
                end
                Wardrobe.PrintMessage('saved current items to '..outfit.Name)
            end
        end
    end
end

--- updates the outfit setting @name=outfit name, @setting=string for setting, @value=seting value
function Wardrobe.EditCurrentOutfit(name, setting, value)
    --print(name, setting, value)
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].OutfitSettings ~= nil then
            if ShiGuangDB[UnitGUID('player')].OutfitSettings[name] ~= nil then
                ShiGuangDB[UnitGUID('player')].OutfitSettings[name][setting] = value
            else
                ShiGuangDB[UnitGUID('player')].OutfitSettings[name] = {}
                ShiGuangDB[UnitGUID('player')].OutfitSettings[name][setting] = value
            end
        end
    end
end

function Wardrobe.CreateQuickPanelDb()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].QuickPanelOutfits == nil then
            ShiGuangDB[UnitGUID('player')].QuickPanelOutfits = {}
        end
    end
end

--- create a db to contain outfit settings, this keeps the outfit item data clean
function Wardrobe.CreateOutfitSettingsDb()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        if ShiGuangDB[UnitGUID('player')].Outfits ~= nil then
            for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
                if ShiGuangDB[UnitGUID('player')].OutfitSettings == nil then
                    ShiGuangDB[UnitGUID('player')].OutfitSettings = {}
                    ShiGuangDB[UnitGUID('player')].OutfitSettings[outfit.Name] = { helm = true, cloak = true, quickPanel = false, quickPanelPos = -1 }
                end
            end
        end
    end
end

---first version used INVSLOT_HEAD rather than HEADSLOT so this should update any old databases, can be removed in future
function Wardrobe.FixDb()
    if ShiGuangDB[UnitGUID('player')] ~= nil then
        for k, outfit in ipairs(ShiGuangDB[UnitGUID('player')].Outfits) do
            for slot, itemId in pairs(outfit) do
                local newSlot = nil
                if string.find(slot, 'INVSLOT') then
                    if string.find(slot, '1') then
                        local oneZero = tostring(string.sub(slot, 1, -2)..'0')
                        newSlot = tostring(string.sub(oneZero, 9)..'SLOT')
                    elseif string.find(slot, '2') then
                        local twoOne = tostring(string.sub(slot, 1, -2)..'1')
                        newSlot = tostring(string.sub(twoOne, 9)..'SLOT')
                    elseif string.find(slot, 'OFFHAND') then
                        newSlot = 'SECONDARYHANDSLOT'
                    elseif string.find(slot, '_HAND') then
                        newSlot = 'HANDSSLOT'
                    elseif string.find(slot, 'BODY') then
                        newSlot = 'SHIRTSLOT'
                    else
                        newSlot = tostring(string.sub(slot, 9)..'SLOT')
                    end
                    outfit[newSlot] = itemId
                    outfit[slot] = nil
                end
            end
        end
    end
end

Wardrobe.EventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and select(1, ...) == '_ShiGuang' then C_Timer.After(1, function() Wardrobe.LoadCharacter() end) end
    if event == 'BANKFRAME_OPENED' then Wardrobe.Vars.BankOpen = true end
    if event == 'BANKFRAME_CLOSED' then Wardrobe.Vars.BankOpen = false end
end)