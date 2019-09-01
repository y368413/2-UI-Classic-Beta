local _, ns = ...
local M, R, U, I = unpack(ns)
local A = M:GetModule("Auras")

--------------------------Class recoure Place ---by y368413 ----
local function yInvertTexture(Texture)
	local Left, Top, _, Bottom, Right = Texture:GetTexCoord()
	Texture:SetTexCoord(Left, Right, Bottom, Top) -- Swapping parameters 3 & 4 (top & bottom)
end
local function yInvertAllTextures(Frame)
	for _, Region in pairs({ Frame:GetRegions() }) do
		if Region:IsObjectType("Texture") then yInvertTexture(Region) end
	end
end

local function ClassRecourePlace()
  if (I.MyClass == "DRUID" and GetSpecialization() == 2) then
    ComboPointPlayerFrame.Combo1:SetAlpha(1)
    ComboPointPlayerFrame.Background:Hide()
    ComboPointPlayerFrame.Combo1:SetScale(1.4)
    ComboPointPlayerFrame.Combo2:SetScale(1.4)
    ComboPointPlayerFrame.Combo3:SetScale(1.4)
    ComboPointPlayerFrame.Combo4:SetScale(1.4)
    ComboPointPlayerFrame.Combo5:SetScale(1.6)
    M.Mover(ComboPointPlayerFrame.Combo1, "ComboPointPlayerFrame", "ComboPointPlayerFrame", R.Auras.ComboPointPos, 180, 43)
   elseif I.MyClass == "ROGUE" then
    PlayerFrame.classPowerBar.Combo1:SetAlpha(1)
    PlayerFrame.classPowerBar.Background:Hide()
    PlayerFrame.classPowerBar.Combo1:SetScale(1.4)
    PlayerFrame.classPowerBar.Combo2:SetScale(1.4)
    PlayerFrame.classPowerBar.Combo3:SetScale(1.4)
    PlayerFrame.classPowerBar.Combo4:SetScale(1.4)
    PlayerFrame.classPowerBar.Combo5:SetScale(1.6)
    PlayerFrame.classPowerBar.Combo6:SetScale(1.6)
    M.Mover(PlayerFrame.classPowerBar.Combo1, "ComboPointPlayerFrame", "ComboPointPlayerFrame", R.Auras.ComboPointPos, 180, 43)
  elseif I.MyClass == "WARLOCK" then
    --yInvertAllTextures(WarlockPowerFrame)
    WarlockPowerFrame:SetAlpha(1)
    WarlockPowerFrame:SetScale(1.2)
    M.Mover(WarlockPowerFrame, "WarlockPowerFrame", "WarlockPowerFrame", R.Auras.WarlockPowerPos, 120, 36)
  elseif I.MyClass == "PALADIN" then
    PaladinPowerBarFrame:SetAlpha(1)
    PaladinPowerBarFrameBG:Hide()
    PaladinPowerBarFrameGlowBG:Hide()
    PaladinPowerBarFrame:SetScale(1.5)
    M.Mover(PaladinPowerBarFrame, "PaladinPowerBarFrame", "PaladinPowerBarFrame", R.Auras.PaladinPowerPos, 180, 43)
  elseif I.MyClass == "DEATHKNIGHT"  and GetSpecialization() ~= 1 then
    RuneFrame:SetAlpha(1)
    RuneFrame:SetScale(1.5)
    M.Mover(RuneFrame, "RuneFrame", "RuneFrame", R.Auras.RunePos, 160, 36)
  elseif I.MyClass == "MONK" then
    MonkHarmonyBarFrame:SetAlpha(1)
    yInvertAllTextures(MonkHarmonyBarFrame)
    MonkHarmonyBarFrame:SetScale(1.2)
    M.Mover(MonkHarmonyBarFrame, "MonkHarmonyBarFrame", "MonkHarmonyBarFrame", R.Auras.MonkHarmonyPos, 180, 43)
  elseif I.MyClass == "MAGE" then
    MageArcaneChargesFrame:SetAlpha(1)
    MageArcaneChargesFrame.Background:Hide()
    MageArcaneChargesFrame:SetScale(1.5)
    M.Mover(MageArcaneChargesFrame, "MageArcaneChargesFrame", "MageArcaneChargesFrame", R.Auras.MageArcaneChargesPos, 170, 43)
  end
end
function A:ClassRecoure()
	if not MaoRUISettingDB["Auras"]["ClassRecourePlace"] then return end
	ClassRecourePlace()
end


-------------------------------------------------------------------------------------------------- RiphieEnergy
local function RiphieEnergy()
  local EnergyBar = CreateFrame("StatusBar", "EnergyBar", UIParent)
  EnergyBar:SetHeight(6)
  EnergyBar:SetWidth(180)
  M.CreateSB(EnergyBar, true)
  EnergyBar:SetStatusBarTexture(I.EnergyTex)
  EnergyBar:SetStatusBarColor(246/255, 222/255, 32/255, 1)    --黄红渐变
    --mana       = {   0/255, 190/255, 230/255, 1 },  --天蓝色
    --rage       = {  65/255,  65/255,  65/255, 1 },  --暗紫色
    --focus      = { 230/255, 140/255,  60/255, 1 },  --深红色
    --maelstrom  = {   0/255, 127/255, 255/255, 1 },  --深蓝色
  EnergyBar.Count = M.CreateFS(EnergyBar, 12, "")
  EnergyBar.Count:ClearAllPoints()
  EnergyBar.Count:SetPoint("CENTER", EnergyBar, "CENTER", 0, 3)
  M.Mover(EnergyBar, "EnergyBar", "EnergyBar", R.Auras.EnergyPos, 180, 8)
end

local function updateEnergy()
  cur, maxPower = UnitPower("player"), UnitPowerMax("player")
  EnergyBar:SetMinMaxValues(0, maxPower)
  EnergyBar:SetValue(cur)
  M.SmoothBar(EnergyBar)
  if (cur == maxPower) or (cur == 0) then EnergyBar.Count:SetText("") else EnergyBar.Count:SetText(M.Numb(cur)) end
  if C_PetBattles.IsInBattle() then EnergyBar:Hide() return else EnergyBar:Show() end
end

function A:Energy()
	if not MaoRUISettingDB["Auras"]["EnergyBar"] then return end
	RiphieEnergy()
	M:RegisterEvent("UNIT_AURA", updateEnergy)
	M:RegisterEvent("UNIT_POWER_UPDATE", updateEnergy)
	M:RegisterEvent("UNIT_POWER_FREQUENT", updateEnergy)
	M:RegisterEvent("SPELL_UPDATE_COOLDOWN", updateEnergy)
	M:RegisterEvent("PET_BATTLE_CLOSE", updateEnergy)
	M:RegisterEvent("PET_BATTLE_OPENING_START", updateEnergy)
	M:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED", updateEnergy)
end

--[[--------------------------------------------------------------------  Mod Name : BlinkComboHelper 1.03 --  Author   : Blink
local BlinkComboHelper = {}
local animations = {}
local BASE_FONT_SIZE = 66
local fadeSide = -1 -- 사라지는 방향

local function updateFunc(frame, alpha, size, x, y)
	frame:SetAlpha(alpha);
	frame.combo:SetTextHeight(size);
	frame:SetPoint("CENTER", "UIParent", "CENTER", x, y );
end

function animations:pop()
	SetUpAnimation(BlinkComboHelperFrame, {
		totalTime = 1.0,
		updateFunc = updateFunc,
		getPosFunc = function (self, fraction)
			if fraction < 0.15 then
				local f = fraction / 0.15
				return f, BASE_FONT_SIZE * f + 1, 0, BASE_FONT_SIZE*f
			elseif fraction < 0.5 then
				return 1.0, BASE_FONT_SIZE + 1, 0, BASE_FONT_SIZE
			else
				local f = (fraction-0.5) / 0.5
				local alpha = 1.0-f;
				if alpha<0 then
					alpha = 0
				end
				return alpha, BASE_FONT_SIZE * alpha + 1, f*fadeSide*20, BASE_FONT_SIZE
			end
		end,
	},function(self)
		fadeSide = fadeSide * -1
	end)
end

function BlinkComboHelper:updateCombo()
	local combo = 0
	if select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID" then
		combo = GetComboPoints("player", "target")
	elseif select(2, UnitClass("player")) == "PALADIN" then
		combo = UnitPower( "player", Enum.PowerType.HolyPower );
	elseif select(2, UnitClass("player")) == "MAGE" then
		combo = UnitPower("player", Enum.PowerType.ArcaneCharges, true)
	elseif select(2, UnitClass("player")) == "MONK" and GetSpecialization()==3 then
		combo = UnitPower( "player", Enum.PowerType.Chi )
	elseif select(2, UnitClass("player")) == "WARLOCK" then
		combo = UnitPower( "player", Enum.PowerType.SoulShards )
	elseif select(2, UnitClass("player")) == "DEATHKNIGHT" and GetSpecialization()==1 then
		local name, _ = GetSpellInfo(195181) -- Bone Shield
		combo, _ = select(3, AuraUtil.FindAuraByName(name, 'player', 'HELPFUL|PLAYER')) or 0
	else
		self.lastCombo = combo
		return
	end
	if combo > 0 and combo~=self.lastCombo then
		BlinkComboHelperFrame.combo:SetText(combo)
		animations:pop()
	end
	self.lastCombo = combo
end

BlinkComboHelperFrame = CreateFrame("Frame")
BlinkComboHelperFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
BlinkComboHelperFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
BlinkComboHelperFrame:RegisterEvent("PLAYER_LOGIN")
BlinkComboHelperFrame:SetScript("OnEvent", function(self, event, ...)
  if not MaoRUISettingDB["Auras"]["BlinkComboHelper"] then return end
	if ( event == "PLAYER_LOGIN" ) then		--self:UnregisterEvent("PLAYER_LOGIN");
		self:Hide();
		self.delayedUpdate = 0
		BlinkComboHelperFrame:ClearAllPoints()
	    BlinkComboHelperFrame:SetPoint("CENTER", 0, 60)
	    BlinkComboHelperFrame:SetFrameStrata("BACKGROUND")
	    BlinkComboHelperFrame:SetFrameLevel(0)
	    BlinkComboHelperFrame.combo = BlinkComboHelperFrame:CreateFontString(nil, "OVERLAY")
	    BlinkComboHelperFrame.combo:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Eggo.ttf", BASE_FONT_SIZE, "THICKOUTLINE")
	    BlinkComboHelperFrame.combo:SetPoint("CENTER", BlinkComboHelperFrame)
	    BlinkComboHelperFrame.combo:SetAlpha(1.0)
	    BlinkComboHelperFrame.combo:SetJustifyH("CENTER")
	    BlinkComboHelperFrame.combo:SetTextColor(0.1, 1.0, 0.1);
	    BlinkComboHelperFrame:SetHeight(BlinkComboHelperFrame.combo:GetHeight())
	    BlinkComboHelperFrame:SetWidth(50)
	elseif event == "PLAYER_REGEN_DISABLED" then
		self.inCombat = true
		self:Show();
		self:SetScript("OnUpdate", function(self, elapsed)
	    self.delayedUpdate = self.delayedUpdate + elapsed
	      if self.delayedUpdate > 0.1 then
		     self.delayedUpdate = 0
		     BlinkComboHelper:updateCombo();
	      end
        end)
	elseif event == "PLAYER_REGEN_ENABLED" then
		self.inCombat = false
		self:Hide();
		self:SetScript("OnUpdate", nil)
	end
end)]]



--------------Fivecombo-----------------------------------------------
local OverlayedSpellID = {};

-- 盗贼
OverlayedSpellID["ROGUE"] = {
	408,   --肾击
	1943,  --割裂
	2098,  --刺骨
	5171,  --切割
	8647,  --破甲
	26679, --致命投掷
	32645, --毒伤
	73651, --恢复
	193316,
	195452,
	196819,
	199804,
	206237,
};
-- 德鲁伊
OverlayedSpellID["DRUID"] = {
	1079,   --割裂
	22568,  --割碎
	22570,  --凶猛撕咬
	52610,  --野蛮咆哮
};

local function IsOverlayedSpell(spellID)
	local _, class = UnitClass("player");
	if (not OverlayedSpellID[class]) then return false end
	for i, id in ipairs(OverlayedSpellID[class]) do
		if (id == spellID) then
			return true;
		end
	end
	return false;
end
local function comboEventFrame_OnUpdate(self, elapsed)
	local countTime = self.countTime - elapsed;
	if (countTime <= 0) then
		local parent = self:GetParent();
		local points = UnitPower("player", Enum.PowerType.ComboPoints)
		local maxPoints = UnitPowerMax("player", Enum.PowerType.ComboPoints)
		if (self.isAlert and points ~= maxPoints) then
			self:SetScript("OnUpdate", nil);
			ActionButton_HideOverlayGlow(parent);
			self.countTime = 0;
		end
		self.countTime = TOOLTIP_UPDATE_TIME;
	end
end

hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
	if (self.comboEventFrame) then return end
	self.comboEventFrame = CreateFrame("Frame", nil, self);
	self.comboEventFrame.countTime = 0;
	self.comboEventFrame:RegisterEvent("UNIT_POWER_UPDATE");
	self.comboEventFrame:RegisterEvent('UNIT_POWER_FREQUENT')
	self.comboEventFrame:RegisterEvent('UNIT_MAXPOWER')
	self.comboEventFrame:SetScript("OnEvent", function(self, event, ...)
	local parent = self:GetParent();
	local spellType, id, subType  = GetActionInfo(parent.action);
	-- 如果是系统自身的提示，就不再处理
	if ( spellType == "spell" and IsSpellOverlayed(id) ) then
		return;
	elseif (spellType == "macro") then
		local _, _, spellId = GetMacroSpell(id);
		if ( spellId and IsSpellOverlayed(spellId) ) then
			return;
		end		
	end
	if UnitPower("player", Enum.PowerType.ComboPoints) >= 5 then		
		if ( spellType == "spell" and IsOverlayedSpell(id) ) then
			ActionButton_ShowOverlayGlow(parent);
			self.isAlert = true;
			self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
		elseif ( spellType == "macro" ) then
			local _, _, spellId = GetMacroSpell(id);
			if ( spellId and IsOverlayedSpell(spellId) ) then
				ActionButton_ShowOverlayGlow(parent);
				self.isAlert = true;
				self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
			else
				ActionButton_HideOverlayGlow(parent);
			end
		else
			ActionButton_HideOverlayGlow(parent);
		end
	else
		ActionButton_HideOverlayGlow(parent);
	end	
  end);
end)