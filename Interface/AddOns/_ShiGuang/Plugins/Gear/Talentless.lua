local Talentless = CreateFrame('Frame', 'Talentless', UIParent)
Talentless:RegisterEvent('ADDON_LOADED')
Talentless:RegisterUnitEvent('PLAYER_SPECIALIZATION_CHANGED', 'player')
Talentless:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)
function Talentless:PLAYER_LEVEL_UP(level)
	if(level == 101) then table.remove(self.Items[1].items, 1)
	elseif(level == 120) then table.remove(self.Items[2].items, 1) self:UnregisterEvent('PLAYER_LEVEL_UP')
	end
	if(self:IsShown()) then self:UpdateItems() end
end

function Talentless:UNIT_AURA()
	if(self:IsShown()) then
		for _, Button in next, self.Items do
			local itemName = Button.itemName
			if(itemName) then
				local exists, name, duration, expiration, _
				for index = 1, 40 do
					name, _, _, _, duration, expiration = UnitAura('player', index)
					exists = name == itemName
					if(not name or exists) then
						break
					end
				end

				if(exists) then
					if(expiration > 0) then
						Button.Cooldown:SetCooldown(expiration - duration, duration)
					end

					ActionButton_ShowOverlayGlow(Button)
				else
					ActionButton_HideOverlayGlow(Button)
					Button.Cooldown:SetCooldown(0, 0)
				end
			end
		end
	end
end

function Talentless:BAG_UPDATE_DELAYED() self:UpdateItems() end

function Talentless:PLAYER_SPECIALIZATION_CHANGED()
	if(self.Specs) then
		local spec = GetSpecialization()
		for index, Button in next, self.Specs do
			Button:SetChecked(index == spec)
		end
	end
end
function Talentless.OnShow()
	Talentless:RegisterUnitEvent('UNIT_AURA', 'player')
	Talentless:RegisterEvent('BAG_UPDATE_DELAYED')
	Talentless:UpdateItems()
end

function Talentless.OnHide()
	Talentless:UnregisterEvent('UNIT_AURA')
	Talentless:UnregisterEvent('BAG_UPDATE_DELAYED')
end

function Talentless:CreateItemButtons()
	self.Items = {}

	local OnEnter = function(self)
		if(self.itemID) then
			GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
			GameTooltip:SetItemByID(self.itemID)
			GameTooltip:Show()
		end
	end

	local OnEvent = function(self, event)
		if(event == 'PLAYER_REGEN_ENABLED') then
			self:UnregisterEvent(event)
			self:SetAttribute('item', 'item:' .. self.itemID)
		else
			local itemName = GetItemInfo(self.itemID)
			if(itemName) then
				self.itemName = itemName
				self:UnregisterEvent(event)

				Talentless:UNIT_AURA()
			end
		end
	end

	local items = {
		{
			141641, -- Codex of the Clear Mind (Pre-Legion)
			141333, -- Codex of the Tranquil Mind (Legion)
			153646, -- Codex of the Quiet Mind (BfA)
		}, {
			141640, -- Tome of the Clear Mind (Pre-Legion)
			143785, -- Tome of the Tranquil Mind (BoP version)
			141446, -- Tome of the Tranquil Mind (Legion)
			153647, -- Tome of the Quiet Mind (BfA)
		}
	}

	if(UnitLevel('player') > 100) then table.remove(items[1], 1)
	if(UnitLevel('player') > 109) then table.remove(items[2], 1) end
	end

	for index, items in next, items do
		local Button = CreateFrame('Button', '$parentItemButton' .. index, self, 'SecureActionButtonTemplate, ActionBarButtonSpellActivationAlert')
		Button:SetPoint('TOPLEFT', PlayerTalentFrame, -20 + (40 * (index + 1)), -23.5)
		Button:SetSize(35, 35)
		Button:SetAttribute('type', 'item')
		Button:SetScript('OnEnter', OnEnter)
		Button:SetScript('OnEvent', OnEvent)
		Button:SetScript('OnLeave', GameTooltip_Hide)
		Button.items = items

		local Icon = Button:CreateTexture('$parentIcon', 'BACKGROUND')
		Icon:SetAllPoints()
		Icon:SetTexture(index == 1 and 1495827 or 134915)
		Icon:SetTexCoord(4/64, 60/64, 4/64, 60/64)

		local Normal = Button:CreateTexture('$parentNormalTexture')
		Normal:SetPoint('CENTER')
		Normal:SetSize(60, 60)
		Normal:SetTexture([[Interface\Buttons\UI-Quickslot2]])

		Button:SetNormalTexture(Normal)
		Button:SetPushedTexture([[Interface\Buttons\UI-Quickslot-Depress]])
		Button:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]])

		local Count = Button:CreateFontString('$parentCount', 'OVERLAY')
		Count:SetPoint('BOTTOMRIGHT', -1, -1)
		Count:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 16, 'OUTLINE')
		Button.Count = Count

		local Cooldown = CreateFrame('Cooldown', '$parentCooldown', Button, 'CooldownFrameTemplate')
		Cooldown:SetAllPoints()
		Button.Cooldown = Cooldown

		table.insert(self.Items, Button)
	end
end

function Talentless:GetAvailableItemInfo(index)
	for _, itemID in next, self.Items[index].items do
		local itemCount = GetItemCount(itemID)
		if(itemCount > 0) then
			return itemID, itemCount
		end
	end

	return self.Items[index].items[1], 0
end

function Talentless:UpdateItems()
	for index, Button in next, self.Items do
		local itemID, itemCount = self:GetAvailableItemInfo(index)
		if(Button.itemID ~= itemID) then
			Button.itemID = itemID

			local itemName = GetItemInfo(itemID)
			if(not itemName) then
				Button.itemName = nil
				Button:RegisterEvent('GET_ITEM_INFO_RECEIVED')
			else
				Button.itemName = itemName
			end

			if(InCombatLockdown()) then
				Button:RegisterEvent('PLAYER_REGEN_ENABLED')
			else
				Button:SetAttribute('item', 'item:' .. itemID)
			end
		end

		Button.Count:SetText(itemCount)
	end

	self:UNIT_AURA()
end

function Talentless:SetSpecialization(index)
	if(GetNumSpecializations() >= index) then
		if(InCombatLockdown()) then
			UIErrorsFrame:TryDisplayMessage(50, ERR_AFFECTING_COMBAT, 1, 0.1, 0.1)
		elseif(GetSpecialization() ~= index) then
			SetSpecialization(index)
		end
	end
end

function Talentless:ADDON_LOADED(addon)
	if(addon == 'Blizzard_TalentUI') then
		self:SetParent(PlayerTalentFrameTalents)
		PlayerTalentFrame:HookScript('OnShow', self.OnShow)
		PlayerTalentFrame:HookScript('OnHide', self.OnHide)
		PlayerTalentFrameTalentsTutorialButton:Hide()
		PlayerTalentFrameTalentsTutorialButton.Show = function() end
		PlayerTalentFrameTalents.unspentText:ClearAllPoints()
		PlayerTalentFrameTalents.unspentText:SetPoint('TOP', 0, 24)
		self:CreateItemButtons()
		if(UnitLevel('player') < 120 and not (IsTrialAccount() or IsVeteranTrialAccount())) then self:RegisterEvent('PLAYER_LEVEL_UP') end
		self:UnregisterEvent('ADDON_LOADED')
		self:OnShow()
	end
end
