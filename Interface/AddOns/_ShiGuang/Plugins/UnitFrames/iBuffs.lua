SetCVar("showCastableBuffs", 1)			-- GetCVarDefault : 0
SetCVar("showDispelDebuffs", 1)			-- GetCVarDefault : 1
local iMAX_PARTY_BUFFS, iMAX_PARTY_DEBUFFS = 12, 8
local PLAYER_UNITS = {player = true, vehicle = true, pet = true,}
for i = 1, 4 do
	local str = "PartyMemberFrame"..i
	for j = 1, iMAX_PARTY_BUFFS do
		PartyBuff = CreateFrame("Button", str.."Buff"..j, _G[str], "PartyBuffFrameTemplate")
		PartyBuff:SetID(j)
		if j == 1 then
			PartyBuff:SetPoint("TOPLEFT", str, "TOPLEFT", 48, -32)
		else
			PartyBuff:SetPoint("LEFT", str.."Buff"..j-1, "RIGHT", 2, 0)
		end
	end
	_G["PartyMemberFrame"..i.."Debuff1"]:ClearAllPoints()
	_G["PartyMemberFrame"..i.."Debuff1"]:SetPoint("TOPLEFT", "PartyMemberFrame"..i, "TOPLEFT", 48, -32)
	for j = 5, iMAX_PARTY_DEBUFFS do
		PartyDebuff = CreateFrame("Button", str.."Debuff"..j, _G[str], "PartyDebuffFrameTemplate")
		PartyDebuff:SetID(j)
		if j == 6 then
			PartyDebuff:SetPoint("TOP", str.."Debuff"..1, "BOTTOM", 0, -2)
		else
			PartyDebuff:SetPoint("LEFT", str.."Debuff"..j-1, "RIGHT", 2, 0)
		end
	end
end
PartyMemberBuffTooltip_Update = function(self) return end
hooksecurefunc("RefreshBuffs", function(frame, unit, numBuffs, suffix, checkCVar)
	numBuffs = numBuffs or MAX_PARTY_BUFFS
	suffix = suffix or "Buff"
	if checkCVar and SHOW_CASTABLE_BUFFS == "1" and UnitCanAssist("player", unit) then filter = "RAID" end
	for i = 1, numBuffs do
		buffName = frame:GetName()..suffix..i
		if _G[buffName]:IsShown() then
			caster = select(7, UnitBuff(unit, i, filter))
				if UnitCanAssist("player", unit) and not PLAYER_UNITS[caster] then
					_G[buffName.."Icon"]:SetDesaturated(true)
				else
					_G[buffName.."Icon"]:SetDesaturated(false)
				end
		end
	end
end)

hooksecurefunc("RefreshDebuffs", function(frame, unit, numDebuffs, suffix, checkCVar)
	local numBuffs = nil
	if string.find(unit, "party") and string.len(unit) == 6 then
		numBuffs, numDebuffs = iMAX_PARTY_BUFFS, iMAX_PARTY_DEBUFFS
	else
		numDebuffs = numDebuffs or MAX_PARTY_DEBUFFS
	end
	suffix = suffix or "Debuff"
	if numBuffs then RefreshBuffs(frame, unit, numBuffs, nil, true) end
	if checkCVar and SHOW_DISPELLABLE_DEBUFFS == "1" and UnitCanAssist("player", unit) then filter = "RAID" end
	for i = 1, numDebuffs do
		debuffName = frame:GetName()..suffix..i
		if _G[debuffName]:IsShown() then
			caster = select(7, UnitDebuff(unit, i, filter))
				if not UnitCanAssist("player", unit) and not PLAYER_UNITS[caster] then
					_G[debuffName.."Icon"]:SetDesaturated(true)
					_G[debuffName.."Border"]:Hide()
				else
					_G[debuffName.."Icon"]:SetDesaturated(false)
					_G[debuffName.."Border"]:Show()
				end
		end
	end
end)

hooksecurefunc("TargetFrame_UpdateAuras", function(self)
	for i = 1, MAX_TARGET_BUFFS do
		frameName = self:GetName().."Buff"..(i)
		caster = select(7, UnitBuff(self.unit, i, nil))
		if _G[frameName] and _G[frameName]:IsShown() then
			if UnitCanAssist("player", self.unit) and not PLAYER_UNITS[caster] then
				_G[frameName.."Icon"]:SetDesaturated(true)
			else
				_G[frameName.."Icon"]:SetDesaturated(false)
			end
		end
	end
	for i = 1, MAX_TARGET_DEBUFFS do
		frameName = self:GetName().."Debuff"..i
		caster = select(7, UnitDebuff(self.unit, i, "INCLUDE_NAME_PLATE_ONLY"))
		if _G[frameName] and _G[frameName]:IsShown() then
			if not UnitCanAssist("player", self.unit) and not PLAYER_UNITS[caster] then
				_G[frameName.."Icon"]:SetDesaturated(true)
				_G[frameName.."Border"]:Hide()
			else
				_G[frameName.."Icon"]:SetDesaturated(false)
				_G[frameName.."Border"]:Show()
			end
		end
	end
end)
