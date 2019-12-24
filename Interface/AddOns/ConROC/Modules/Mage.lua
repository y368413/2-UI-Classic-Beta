if select(2, UnitClass("player")) ~= "MAGE" then return end
local ConROC_Mage, ids = ...;

--General
	ids.Racial = {
		EscapeArtist = 20589,
	}
	ids.Spec = {
		Arcane = 1,
		Fire = 2,
		Frost = 3,
	}
	ids.Caster = {
		Shoot = 5019,
	}	
--Arcane
	ids.Arc_Ability = {
		AmplifyMagicRank1 = 1008,
		AmplifyMagicRank2 = 8455,
		AmplifyMagicRank3 = 10169,
		AmplifyMagicRank4 = 10170,
		ArcaneBrilliance = 23028,
		ArcaneExplosionRank1 = 1449,
		ArcaneExplosionRank2 = 8437,
		ArcaneExplosionRank3 = 8438,
		ArcaneExplosionRank4 = 8439,
		ArcaneExplosionRank5 = 10201,
		ArcaneExplosionRank6 = 10202,
		ArcaneIntellectRank1 = 1459,
		ArcaneIntellectRank2 = 1460,
		ArcaneIntellectRank3 = 1461,
		ArcaneIntellectRank4 = 10156,
		ArcaneIntellectRank5 = 10157,
		ArcaneMissilesRank1 = 5143,
		ArcaneMissilesRank2 = 5144,
		ArcaneMissilesRank3 = 5145,
		ArcaneMissilesRank4 = 8416,
		ArcaneMissilesRank5 = 8417,
		ArcaneMissilesRank6 = 10211,
		ArcaneMissilesRank7 = 10212,
		ArcanePower = 12042,
		Blink = 1953,
		ConjureFoodRank1 = 587,
		ConjureFoodRank2 = 597,
		ConjureFoodRank3 = 990,
		ConjureFoodRank4 = 6129,
		ConjureFoodRank5 = 10144,
		ConjureFoodRank6 = 10145,
		ConjureManaAgate = 759,
		ConjureManaJade = 3552,
		ConjureManaCitrine = 10053,
		ConjureManaRuby = 10054,
		ConjureWaterRank1 = 5504,
		ConjureWaterRank2 = 5505,
		ConjureWaterRank3 = 5506,
		ConjureWaterRank4 = 6127,
		ConjureWaterRank5 = 10138,
		ConjureWaterRank6 = 10139,
		Counterspell = 2139,
		DampenMagicRank1 = 604,
		DampenMagicRank2 = 8450,
		DampenMagicRank3 = 8451,
		DampenMagicRank4 = 10173,
		DampenMagicRank5 = 10174,
		DetectMagic = 2855,
		Evocation = 12051,
		MageArmorRank1 = 6117,
		MageArmorRank2 = 22782,
		MageArmorRank3 = 22783,
		ManaShieldRank1 = 1463,
		ManaShieldRank2 = 8494,
		ManaShieldRank3 = 8495,
		ManaShieldRank4 = 10191,
		ManaShieldRank5 = 10192,
		ManaShieldRank6 = 10193,
		RemoveLesserCurse = 475,
		SlowFall = 130,
		PolymorphRank1 = 118,
		PolymorphRank2 = 12824,
		PolymorphRank3 = 12825,
		PolymorphRank4 = 12826,
		PresenceofMind = 12043,
	}
	ids.Arc_Talent = {
		ArcaneSubtlety = 1,
		ArcaneFocus = 2,
		ImprovedArcaneMissiles = 3,
		 
		WandSpecialization = 4,
		MagicAbsorption = 5,
		ArcaneConcentration = 6,
		 
		MagicAttunement = 7,
		ImprovedArcaneExplosion = 8,
		ArcaneResilience = 9,
		 
		ImprovedManaShield = 10,
		ImprovedCounterspell = 11,
		ArcaneMeditation = 12,
		 
		PresenceofMind = 13,
		ArcaneMind = 14,
		 
		ArcaneInstability = 15,
		 
		ArcanePower = 16,
	}	
--Fire
	ids.Fire_Ability = {
		BlastWaveRank1 = 11113,
		BlastWaveRank2 = 13018,
		BlastWaveRank3 = 13019,
		BlastWaveRank4 = 13020,
		BlastWaveRank5 = 13021,
		Combustion = 11129,
		FireBlastRank1 = 2136,
		FireBlastRank2 = 2137,
		FireBlastRank3 = 2138,
		FireBlastRank4 = 8412,
		FireBlastRank5 = 8413,
		FireBlastRank6 = 10197,
		FireBlastRank7 = 10199,
		FireWardRank1 = 543,
		FireWardRank2 = 8457,
		FireWardRank3 = 8458,
		FireWardRank4 = 10223,
		FireWardRank5 = 10225,
		FireballRank1 = 133,
		FireballRank2 = 143,
		FireballRank3 = 145,
		FireballRank4 = 3140,
		FireballRank5 = 8400,
		FireballRank6 = 8401,
		FireballRank7 = 8402,
		FireballRank8 = 10148,
		FireballRank9 = 10149,
		FireballRank10 = 10150,
		FireballRank11 = 10151,
		FlamestrikeRank1 = 2120,
		FlamestrikeRank2 = 2121,
		FlamestrikeRank3 = 8422,
		FlamestrikeRank4 = 8423,
		FlamestrikeRank5 = 10215,
		FlamestrikeRank6 = 10216,
		PyroblastRank1 = 11366,
		PyroblastRank2 = 12505,
		PyroblastRank3 = 12522,
		PyroblastRank4 = 12523,
		PyroblastRank5 = 12524,
		PyroblastRank6 = 12525,
		PyroblastRank7 = 12526,
		PyroblastRank8 = 18809,
		ScorchRank1 = 2948,
		ScorchRank2 = 8444,
		ScorchRank3 = 8445,
		ScorchRank4 = 8446,
		ScorchRank5 = 10205,
		ScorchRank6 = 10206,
		ScorchRank7 = 10207,
	}
	ids.Fire_Talent = {
		ImprovedFireball = 1,
		Impact = 2,
		 
		Ignite = 3,
		FlameThrowing = 4,
		ImprovedFireBlast = 5,
		 
		Incinerate = 6,
		ImprovedFlamestrike = 7,
		Pyroblast = 8,
		BurningSoul = 9,
		 
		ImprovedScorch = 10,
		ImprovedFireWard = 11,
		MasterofElements = 12,
		 
		CriticalMass = 13,
		BlastWave = 14,
		 
		FirePower = 15,
		 
		Combustion = 16,
	}
--Frost
	ids.Frost_Ability = {
		BlizzardRank1 = 10,
		BlizzardRank2 = 6141,
		BlizzardRank3 = 8427,
		BlizzardRank4 = 10185,
		BlizzardRank5 = 10186,
		BlizzardRank6 = 10187,
		ColdSnap = 12472,
		ConeofColdRank1 = 120,
		ConeofColdRank2 = 8492,
		ConeofColdRank3 = 10159,
		ConeofColdRank4 = 10160,
		ConeofColdRank5 = 10161,
		IceBarrierRank1 = 11426,
		IceBarrierRank2 = 13031,
		IceBarrierRank3 = 13032,
		IceBarrierRank4 = 13033,
		IceBlock = 11958,
		FrostArmorRank1 = 168,
		FrostArmorRank2 = 7300,
		FrostArmorRank3 = 7301,
		IceArmorRank1 = 7302,
		IceArmorRank2 = 7320,
		IceArmorRank3 = 10219,
		IceArmorRank4 = 10220,		
		FrostNovaRank1 = 122,
		FrostNovaRank2 = 865,
		FrostNovaRank3 = 6131,
		FrostNovaRank4 = 10230,
		FrostWardRank1 = 6143,
		FrostWardRank2 = 8461,
		FrostWardRank3 = 8462,
		FrostWardRank4 = 10177,
		FrostboltRank1 = 116,
		FrostboltRank2 = 205,
		FrostboltRank3 = 837,
		FrostboltRank4 = 7322,
		FrostboltRank5 = 8406,
		FrostboltRank6 = 8407,
		FrostboltRank7 = 8408,
		FrostboltRank8 = 10179,
		FrostboltRank9 = 10180,
		FrostboltRank10 = 10181,
	}
	ids.Frost_Talent = {
		FrostWarding = 1,
		ImprovedFrostbolt = 2,
		ElementalPrecision = 3,
		 
		IceShards = 4,
		Frostbite = 5,
		ImprovedFrostNova = 6,
		Permafrost = 7,
		 
		PiercingIce = 8,
		ColdSnap = 9,
		ImprovedBlizzard = 10,
		 
		ArcticReach = 11,
		FrostChanneling = 12,
		Shatter = 13,
		 
		IceBlock = 14,
		ImprovedConeofCold = 15,
		 
		WintersChill = 16,
		 
		IceBarrier = 17,
	}
-- Auras
	ids.Player_Buff = {

	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
		Chilled = 6136,
		FireVulnerability = 22959,
		WintersChill = 12579,		
	}	

local lastFrame = 0;
local lastArmor = 0;
local lastFiller = 0;
local lastAoE = 0;
local lastOption = 0;


local plvl = UnitLevel('player');

local defaults = {
	["ConROC_SM_Role_Caster"] = true,

	["ConROC_Caster_Armor_Ice"] = true,
	["ConROC_Caster_Filler_Fireball"] = true,
	["ConROC_Caster_AoE_ArcaneExplosion"] = true,
	["ConROC_Caster_AoE_Flamestrike"] = true,
	["ConROC_Caster_AoE_Blizzard"] = true,
	["ConROC_Caster_Option_UseWand"] = true,
	["ConROC_Caster_Option_AoE"] = true,
}


ConROCMageSpells = ConROCMageSpells or defaults;

function ConROC:SpellmenuClass()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCSpellmenuClass", ConROCSpellmenuFrame2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 30)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCSpellmenuFrame_Title", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		
	--Caster
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Role_Caster", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontRedSmall");
			radio1:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -10);
			radio1:SetChecked(ConROCMageSpells.ConROC_SM_Role_Caster);
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Role_Caster:SetChecked(true);
					ConROC_SM_Role_PvP:SetChecked(false);
					ConROCMageSpells.ConROC_SM_Role_Caster = ConROC_SM_Role_Caster:GetChecked();
					ConROCMageSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile();
					ConROC:SpellMenuUpdate();
				end
			);
			radio1text:SetText("Caster");
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('Spellmenu_radio1_Texture', 'ARTWORK');
				r1t:SetTexture('Interface\\AddOns\\ConROC\\images\\magiccircle');
				r1t:SetBlendMode('BLEND');
				local color = ConROC.db.profile.purgeOverlayColor;
				r1t:SetVertexColor(color.r, color.g, color.b);				
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("CENTER", radio1, "CENTER", 0, 0);
			radio1text:SetPoint("BOTTOM", radio1, "TOP", 0, 5);
		
	--PvP
		local radio4 = CreateFrame("CheckButton", "ConROC_SM_Role_PvP", frame, "UIRadioButtonTemplate");
		local radio4text = frame:CreateFontString(nil, "ARTWORK", "GameFontRedSmall");
			radio4:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -15, -10);
			radio4:SetChecked(ConROCMageSpells.ConROC_SM_Role_PvP);
			radio4:SetScript("OnClick", 
			  function()
					ConROC_SM_Role_Caster:SetChecked(false);
					ConROC_SM_Role_PvP:SetChecked(true);
					ConROCMageSpells.ConROC_SM_Role_Caster = ConROC_SM_Role_Caster:GetChecked();
					ConROCMageSpells.ConROC_SM_Role_PvP = ConROC_SM_Role_PvP:GetChecked();
					ConROC:RoleProfile();
					ConROC:SpellMenuUpdate();
				end
			);
			radio4text:SetText("PvP");					
		local r4t = radio4.texture;

			if not r4t then
				r4t = radio4:CreateTexture('Spellmenu_radio4_Texture', 'ARTWORK');
				r4t:SetTexture('Interface\\AddOns\\ConROC\\images\\lightning-interrupt');
				r4t:SetBlendMode('BLEND');				
				radio4.texture = r4t;
			end			
			r4t:SetScale(0.2);
			r4t:SetPoint("CENTER", radio4, "CENTER", 0, 0);
			radio4text:SetPoint("BOTTOM", radio4, "TOP", 0, 5);
			

		frame:Hide()
		lastFrame = frame;
	
	ConROC:RadioHeader1();
	ConROC:RadioHeader2();
	ConROC:CheckHeader1();
	ConROC:CheckHeader2();
end

function ConROC:RadioHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontArmors = frame:CreateFontString("ConROC_Spellmenu_RadioHeader1", "ARTWORK", "GameFontGreenSmall");
			fontArmors:SetText("Armors");
			fontArmors:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame1:Show();
					ConROC_RadioFrame1_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame1_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame1:Hide();
					ConROC_RadioFrame1_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame1();
end

function ConROC:RadioFrame1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame1", ConROCRadioHeader1)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader1", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastArmor = frame;
		lastFrame = frame;
		
	--Ice
		local r1tspellName, _, r1tspell = GetSpellInfo(ids.Frost_Ability.IceArmorRank1);	
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Armor_Ice", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio1:SetPoint("TOP", ConROCRadioFrame1, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio1:SetChecked(ConROCMageSpells.ConROC_Caster_Armor_Ice);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCMageSpells.ConROC_PvP_Armor_Ice);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Armor_Ice:SetChecked(true);
					ConROC_SM_Armor_Mage:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Armor_Ice = ConROC_SM_Armor_Ice:GetChecked();
						ConROCMageSpells.ConROC_Caster_Armor_Mage = ConROC_SM_Armor_Mage:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Armor_Ice = ConROC_SM_Armor_Ice:GetChecked();
						ConROCMageSpells.ConROC_PvP_Armor_Mage = ConROC_SM_Armor_Mage:GetChecked();
					end
				end
			);
			radio1text:SetText(r1tspellName);
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame1_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastArmor = radio1;
		lastFrame = radio1;
		
	--Mage
		local r2tspellName, _, r2tspell = GetSpellInfo(ids.Arc_Ability.MageArmorRank1);	
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Armor_Mage", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio2:SetPoint("TOP", lastArmor, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio2:SetChecked(ConROCMageSpells.ConROC_Caster_Armor_Mage);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCMageSpells.ConROC_PvP_Armor_Mage);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Armor_Ice:SetChecked(false);
					ConROC_SM_Armor_Mage:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Armor_Ice = ConROC_SM_Armor_Ice:GetChecked();
						ConROCMageSpells.ConROC_Caster_Armor_Mage = ConROC_SM_Armor_Mage:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Armor_Ice = ConROC_SM_Armor_Ice:GetChecked();
						ConROCMageSpells.ConROC_PvP_Armor_Mage = ConROC_SM_Armor_Mage:GetChecked();
					end
				end
			);
			radio2text:SetText(r2tspellName);					
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame1_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastArmor = radio2;
		lastFrame = radio2;
		
		frame:Show()
end

function ConROC:RadioHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontFillers = frame:CreateFontString("ConROC_Spellmenu_RadioHeader2", "ARTWORK", "GameFontGreenSmall");
			fontFillers:SetText("Filler");
			fontFillers:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_RadioFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontFillers, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCRadioFrame2:Show();
					ConROC_RadioFrame2_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_RadioFrame2_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontFillers, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCRadioFrame2:Hide();
					ConROC_RadioFrame2_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:RadioFrame2();
end

function ConROC:RadioFrame2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCRadioFrame2", ConROCRadioHeader2)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCRadioHeader2", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastFiller = frame;
		lastFrame = frame;
		
	--Fireball
		local r0tspellName, _, r0tspell = GetSpellInfo(ids.Fire_Ability.FireballRank1);
		local radio0 = CreateFrame("CheckButton", "ConROC_SM_Filler_Fireball", frame, "UIRadioButtonTemplate");
		local radio0text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio0:SetPoint("TOP", ConROCRadioFrame2, "BOTTOM", -75, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio0:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_Fireball);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio0:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_Fireball);	
			end
			radio0:SetScript("OnClick",
				function()
					ConROC_SM_Filler_Fireball:SetChecked(true);
					ConROC_SM_Filler_Frostbolt:SetChecked(false);
					ConROC_SM_Filler_ArcaneMissiles:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					end
				end
			);
			radio0text:SetText(r0tspellName);				
		local r0t = radio0.texture;
			if not r0t then
				r0t = radio0:CreateTexture('RadioFrame2_radio0_Texture', 'ARTWORK');
				r0t:SetTexture(r0tspell);
				r0t:SetBlendMode('BLEND');
				radio0.texture = r0t;
			end			
			r0t:SetScale(0.2);
			r0t:SetPoint("LEFT", radio0, "RIGHT", 8, 0);
			radio0text:SetPoint('LEFT', r0t, 'RIGHT', 5, 0);
		
		lastFiller = radio0;
		lastFrame = radio0;
		
	--Frostbolt
		local r1tspellName, _, r1tspell = GetSpellInfo(ids.Frost_Ability.FrostboltRank1);
		local radio1 = CreateFrame("CheckButton", "ConROC_SM_Filler_Frostbolt", frame, "UIRadioButtonTemplate");
		local radio1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio1:SetPoint("TOP", lastFiller, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio1:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_Frostbolt);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio1:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_Frostbolt);	
			end
			radio1:SetScript("OnClick",
				function()
					ConROC_SM_Filler_Fireball:SetChecked(false);
					ConROC_SM_Filler_Frostbolt:SetChecked(true);
					ConROC_SM_Filler_ArcaneMissiles:SetChecked(false);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					end
				end
			);
			radio1text:SetText(r1tspellName);				
		local r1t = radio1.texture;
			if not r1t then
				r1t = radio1:CreateTexture('RadioFrame2_radio1_Texture', 'ARTWORK');
				r1t:SetTexture(r1tspell);
				r1t:SetBlendMode('BLEND');
				radio1.texture = r1t;
			end			
			r1t:SetScale(0.2);
			r1t:SetPoint("LEFT", radio1, "RIGHT", 8, 0);
			radio1text:SetPoint('LEFT', r1t, 'RIGHT', 5, 0);
		
		lastFiller = radio1;
		lastFrame = radio1;
		
	--Arcane Missiles
		local r2tspellName, _, r2tspell = GetSpellInfo(ids.Arc_Ability.ArcaneMissilesRank1);
		local radio2 = CreateFrame("CheckButton", "ConROC_SM_Filler_ArcaneMissiles", frame, "UIRadioButtonTemplate");
		local radio2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			radio2:SetPoint("TOP", lastFiller, "BOTTOM", 0, 0);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				radio2:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_ArcaneMissiles);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				radio2:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_ArcaneMissiles);
			end
			radio2:SetScript("OnClick", 
				function()
					ConROC_SM_Filler_Fireball:SetChecked(false);
					ConROC_SM_Filler_Frostbolt:SetChecked(false);
					ConROC_SM_Filler_ArcaneMissiles:SetChecked(true);
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_Caster_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Filler_Fireball = ConROC_SM_Filler_Fireball:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_Frostbolt = ConROC_SM_Filler_Frostbolt:GetChecked();
						ConROCMageSpells.ConROC_PvP_Filler_ArcaneMissiles = ConROC_SM_Filler_ArcaneMissiles:GetChecked();
					end
				end
			);
			radio2text:SetText(r2tspellName);					
		local r2t = radio2.texture; 
			if not r2t then
				r2t = radio2:CreateTexture('RadioFrame2_radio2_Texture', 'ARTWORK');
				r2t:SetTexture(r2tspell);
				r2t:SetBlendMode('BLEND');
				radio2.texture = r2t;
			end			
			r2t:SetScale(0.2);
			r2t:SetPoint("LEFT", radio2, "RIGHT", 8, 0);
			radio2text:SetPoint('LEFT', r2t, 'RIGHT', 5, 0);

		lastFiller = radio2;
		lastFrame = radio2;
		
		frame:Show()
end

function ConROC:CheckHeader1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader1", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontArmors = frame:CreateFontString("ConROC_Spellmenu_CheckHeader1", "ARTWORK", "GameFontGreenSmall");
			fontArmors:SetText("AoEs");
			fontArmors:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame1_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCCheckFrame1:Show();
					ConROC_CheckFrame1_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame1_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCCheckFrame1:Hide();
					ConROC_CheckFrame1_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:CheckFrame1();
end

function ConROC:CheckFrame1()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckFrame1", ConROCCheckHeader1)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 5)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", "ConROCCheckHeader1", "BOTTOM", 0, 0)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		lastAoE = frame;
		lastFrame = frame;
		
	--Arcane Explosion
		local c1tspellName, _, c1tspell = GetSpellInfo(ids.Arc_Ability.ArcaneExplosionRank1); 
		local check1 = CreateFrame("CheckButton", "ConROC_SM_AoE_ArcaneExplosion", frame, "UICheckButtonTemplate");
		local check1text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", ConROCCheckFrame1, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check1:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_ArcaneExplosion);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_ArcaneExplosion);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_AoE_ArcaneExplosion = ConROC_SM_AoE_ArcaneExplosion:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_AoE_ArcaneExplosion = ConROC_SM_AoE_ArcaneExplosion:GetChecked();
					end
				end);
			check1text:SetText(c1tspellName);				
		local c1t = check1.texture;
			if not c1t then
				c1t = check1:CreateTexture('CheckFrame1_check1_Texture', 'ARTWORK');
				c1t:SetTexture(c1tspell);
				c1t:SetBlendMode('BLEND');
				check1.texture = c1t;
			end			
			c1t:SetScale(0.4);
			c1t:SetPoint("LEFT", check1, "RIGHT", 8, 0);
			check1text:SetPoint('LEFT', c1t, 'RIGHT', 5, 0);
			
		lastAoE = check1;
		lastFrame = check1;

	--Flamestrike
		local c2tspellName, _, c2tspell = GetSpellInfo(ids.Fire_Ability.FlamestrikeRank1); 
		local check2 = CreateFrame("CheckButton", "ConROC_SM_AoE_Flamestrike", frame, "UICheckButtonTemplate");
		local check2text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastAoE, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check2:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_Flamestrike);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_Flamestrike);
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_AoE_Flamestrike = ConROC_SM_AoE_Flamestrike:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_AoE_Flamestrike = ConROC_SM_AoE_Flamestrike:GetChecked();
					end
				end);
			check2text:SetText(c2tspellName);
		local c2t = check2.texture;
			if not c2t then
				c2t = check2:CreateTexture('CheckFrame1_check2_Texture', 'ARTWORK');
				c2t:SetTexture(c2tspell);
				c2t:SetBlendMode('BLEND');
				check2.texture = c2t;
			end
			c2t:SetScale(0.4);
			c2t:SetPoint("LEFT", check2, "RIGHT", 8, 0);
			check2text:SetPoint('LEFT', c2t, 'RIGHT', 5, 0);

		lastAoE = check2;
		lastFrame = check2;

	--Blizzard
		local c3tspellName, _, c3tspell = GetSpellInfo(ids.Frost_Ability.BlizzardRank1); 
		local check3 = CreateFrame("CheckButton", "ConROC_SM_AoE_Blizzard", frame, "UICheckButtonTemplate");
		local check3text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check3:SetPoint("TOP", lastAoE, "BOTTOM", 0, 0);
			check3:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check3:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_Blizzard);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check3:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_Blizzard);
			end
			check3:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_AoE_Blizzard = ConROC_SM_AoE_Blizzard:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_AoE_Blizzard = ConROC_SM_AoE_Blizzard:GetChecked();
					end
				end);
			check3text:SetText(c3tspellName);				
		local c3t = check3.texture;
			if not c3t then
				c3t = check3:CreateTexture('CheckFrame1_check3_Texture', 'ARTWORK');
				c3t:SetTexture(c3tspell);
				c3t:SetBlendMode('BLEND');
				check3.texture = c3t;
			end			
			c3t:SetScale(0.4);
			c3t:SetPoint("LEFT", check3, "RIGHT", 8, 0);
			check3text:SetPoint('LEFT', c3t, 'RIGHT', 5, 0);
			
		lastAoE = check3;
		lastFrame = check3;
		
		frame:Show()
end

function ConROC:CheckHeader2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckHeader2", ConROCSpellmenuClass)
		
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5')
		frame:SetSize(180, 10)
		frame:SetAlpha(1)
		
		frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5)
		frame:SetMovable(false)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)

		local fontArmors = frame:CreateFontString("ConROC_Spellmenu_CheckHeader2", "ARTWORK", "GameFontGreenSmall");
			fontArmors:SetText("Options");
			fontArmors:SetPoint('TOP', frame, 'TOP');
		
			local obutton = CreateFrame("Button", 'ConROC_CheckFrame2_OpenButton', frame)
				obutton:SetFrameStrata('MEDIUM')
				obutton:SetFrameLevel('6')
				obutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				obutton:SetSize(12, 12)
				obutton:Hide()
				obutton:SetAlpha(1)
				
				obutton:SetText("v")
				obutton:SetNormalFontObject("GameFontHighlightSmall")

			local ohtex = obutton:CreateTexture()
				ohtex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				ohtex:SetTexCoord(0, 0.625, 0, 0.6875)
				ohtex:SetAllPoints()
				obutton:SetHighlightTexture(ohtex)

				obutton:SetScript("OnMouseUp", function (self, obutton, up)
					self:Hide();
					ConROCCheckFrame2:Show();
					ConROC_CheckFrame2_CloseButton:Show();
					ConROC:SpellMenuUpdate();
				end)

			local tbutton = CreateFrame("Button", 'ConROC_CheckFrame2_CloseButton', frame)
				tbutton:SetFrameStrata('MEDIUM')
				tbutton:SetFrameLevel('6')
				tbutton:SetPoint("LEFT", fontArmors, "RIGHT", 0, 0)
				tbutton:SetSize(12, 12)
				tbutton:Show()
				tbutton:SetAlpha(1)
				
				tbutton:SetText("^")
				tbutton:SetNormalFontObject("GameFontHighlightSmall")

			local htex = tbutton:CreateTexture()
				htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
				htex:SetTexCoord(0, 0.625, 0, 0.6875)
				htex:SetAllPoints()
				tbutton:SetHighlightTexture(htex)
				
				tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
					self:Hide();
					ConROCCheckFrame2:Hide();
					ConROC_CheckFrame2_OpenButton:Show();
					ConROC:SpellMenuUpdate();
				end)		
		
		frame:Show();
		lastFrame = frame;
		
	ConROC:CheckFrame2();
end

function ConROC:CheckFrame2()
	local _, Class, classId = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCCheckFrame2", ConROCCheckHeader2)
		
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('5')
	frame:SetSize(180, 5)
	frame:SetAlpha(1)
	
	frame:SetPoint("TOP", "ConROCCheckHeader2", "BOTTOM", 0, 0)
	frame:SetMovable(false)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)

	lastOption = frame;
	lastFrame = frame;

	--Use Wand
		local check1 = CreateFrame("CheckButton", "ConROC_SM_Option_UseWand", frame, "UICheckButtonTemplate");
		local check1text = check1:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check1:SetPoint("TOP", lastOption, "BOTTOM", -150, 0);
			check1:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check1:SetChecked(ConROCMageSpells.ConROC_Caster_Option_UseWand);
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check1:SetChecked(ConROCMageSpells.ConROC_PvP_Option_UseWand);
			end
			check1:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Option_UseWand = ConROC_SM_Option_UseWand:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Option_UseWand = ConROC_SM_Option_UseWand:GetChecked();
					end
				end);
			check1text:SetText("Use Wand");
			check1text:SetScale(2);
			check1text:SetPoint("LEFT", check1, "RIGHT", 20, 0);
			
		lastOption = check1;
		lastFrame = check1;

	--AoE Toggle Button
		local check2 = CreateFrame("CheckButton", "ConROC_SM_Option_AoE", frame, "UICheckButtonTemplate");
		local check2text = check2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");		
			check2:SetPoint("TOP", lastOption, "BOTTOM", 0, 0);
			check2:SetScale(.50);
			if ConROC:CheckBox(ConROC_SM_Role_Caster) then
				check2:SetChecked(ConROCMageSpells.ConROC_Caster_Option_AoE);
				if ConROC:CheckBox(ConROC_SM_Option_AoE) then
					ConROCButtonFrame:Show();
					if ConROC.db.profile.unlockWindow then
						ConROCToggleMover:Show();					
					else
						ConROCToggleMover:Hide();					
					end
				else
					ConROCButtonFrame:Hide();
					ConROCToggleMover:Hide();
				end
			elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
				check2:SetChecked(ConROCMageSpells.ConROC_PvP_Option_AoE);
				if ConROC:CheckBox(ConROC_SM_Option_AoE) then
					ConROCButtonFrame:Show();
					if ConROC.db.profile.unlockWindow then
						ConROCToggleMover:Show();					
					else
						ConROCToggleMover:Hide();					
					end					
				else
					ConROCButtonFrame:Hide();
					ConROCToggleMover:Hide();
				end
			end
			check2:SetScript("OnClick", 
				function()
					if ConROC:CheckBox(ConROC_SM_Role_Caster) then
						ConROCMageSpells.ConROC_Caster_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
						ConROCMageSpells.ConROC_PvP_Option_AoE = ConROC_SM_Option_AoE:GetChecked();
					end
					if ConROC:CheckBox(ConROC_SM_Option_AoE) then
						ConROCButtonFrame:Show();
						ConROCCheckHeader1:Show();
						ConROCCheckFrame1:Show();
						if ConROC.db.profile.unlockWindow then
							ConROCToggleMover:Show();					
						else
							ConROCToggleMover:Hide();					
						end					
					else
						ConROCButtonFrame:Hide();
						ConROCToggleMover:Hide();
						ConROCCheckHeader1:Hide();
						ConROCCheckFrame1:Hide();
					end
					ConROC:SpellMenuUpdate();
				end);
			check2text:SetText("AoE Toggle Button");
			check2text:SetScale(2);			
			check2text:SetPoint("LEFT", check2, "RIGHT", 20, 0);
			
		lastOption = check2;
		lastFrame = check2;
		
		frame:Show()
end

function ConROC:SpellMenuUpdate()
	lastFrame = ConROCSpellmenuClass;

	if ConROCRadioHeader1 ~= nil then
		lastArmor = ConROCRadioFrame1;
		
	--Armors
		if plvl >= 1 and IsSpellKnown(ids.Frost_Ability.FrostArmorRank1) then
			ConROC_SM_Armor_Ice:Show();
			lastArmor = ConROC_SM_Armor_Ice;
		else
			ConROC_SM_Armor_Ice:Hide();
		end

		if plvl >= 34 and IsSpellKnown(ids.Arc_Ability.MageArmorRank1) then
			ConROC_SM_Armor_Mage:Show(); 
			ConROC_SM_Armor_Mage:SetPoint("TOP", lastArmor, "BOTTOM", 0, 0);
			lastArmor = ConROC_SM_Armor_Mage;
		else
			ConROC_SM_Armor_Mage:Hide();
		end

		if lastArmor == ConROCRadioFrame1 then
			ConROCRadioHeader1:Hide();
			ConROCRadioFrame1:Hide();
		end
		
		if ConROCRadioFrame1:IsVisible() then
			lastFrame = lastArmor;
		else
			lastFrame = ConROCRadioHeader1;
		end
	end

	if ConROCRadioHeader2 ~= nil then
		if lastFrame == lastArmor then
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCRadioHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastFiller = ConROCRadioFrame2;
		
	--Fillers
		if plvl >= 1 and IsSpellKnown(ids.Fire_Ability.FireballRank1) then 
			ConROC_SM_Filler_Fireball:Show();
			lastFiller = ConROC_SM_Filler_Fireball;
		else
			ConROC_SM_Filler_Fireball:Hide();
		end

		if plvl >= 4 and IsSpellKnown(ids.Frost_Ability.FrostboltRank1) then 
			ConROC_SM_Filler_Frostbolt:Show(); 
			ConROC_SM_Filler_Frostbolt:SetPoint("TOP", lastFiller, "BOTTOM", 0, 0);
			lastFiller = ConROC_SM_Filler_Frostbolt;
		else
			ConROC_SM_Filler_Frostbolt:Hide();
		end
		
		if plvl >= 8 and IsSpellKnown(ids.Arc_Ability.ArcaneMissilesRank1) then 
			ConROC_SM_Filler_ArcaneMissiles:Show(); 
			ConROC_SM_Filler_ArcaneMissiles:SetPoint("TOP", lastFiller, "BOTTOM", 0, 0);
			lastFiller = ConROC_SM_Filler_ArcaneMissiles;
		else
			ConROC_SM_Filler_ArcaneMissiles:Hide();
		end

		if lastFiller == ConROCRadioFrame2 then
			ConROCRadioHeader2:Hide();
			ConROCRadioFrame2:Hide();
		end
		
		if ConROCRadioFrame2:IsVisible() then
			lastFrame = lastFiller;
		else
			lastFrame = ConROCRadioHeader2;
		end
	end
	
	if ConROCCheckFrame1 ~= nil then
		if lastFrame == lastArmor or lastFrame == lastFiller then
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader1:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastAoE = ConROCCheckFrame1;
		
	--AoE
		if plvl >= 14 and IsSpellKnown(ids.Arc_Ability.ArcaneExplosionRank1) then 
			ConROC_SM_AoE_ArcaneExplosion:Show();
			lastAoE = ConROC_SM_AoE_ArcaneExplosion;
		else
			ConROC_SM_AoE_ArcaneExplosion:Hide();
		end
		
		if plvl >= 16 and IsSpellKnown(ids.Fire_Ability.FlamestrikeRank1) then 
			ConROC_SM_AoE_Flamestrike:Show();
			ConROC_SM_AoE_Flamestrike:SetPoint("TOP", lastAoE, "BOTTOM", 0, 0);			
			lastAoE = ConROC_SM_AoE_Flamestrike;
		else
			ConROC_SM_AoE_Flamestrike:Hide();
		end

		if plvl >= 20 and IsSpellKnown(ids.Frost_Ability.BlizzardRank1) then 
			ConROC_SM_AoE_Blizzard:Show(); 
			ConROC_SM_AoE_Blizzard:SetPoint("TOP", lastAoE, "BOTTOM", 0, 0);
			lastAoE = ConROC_SM_AoE_Blizzard;
		else
			ConROC_SM_AoE_Blizzard:Hide();
		end

		if ConROC:CheckBox(ConROC_SM_Option_AoE) then
			ConROCCheckHeader1:Show();
			ConROCCheckFrame1:Show();
		else
			ConROCCheckHeader1:Hide();
			ConROCCheckFrame1:Hide();		
		end
		
		if lastAoE == ConROCCheckFrame1 then
			ConROCCheckHeader1:Hide();
			ConROCCheckFrame1:Hide();
		end
		
		ConROC:CheckBox(ConROC_SM_Option_AoE)
		
		if ConROCCheckFrame1:IsVisible() then
			lastFrame = lastAoE;
		else
			lastFrame = ConROCCheckHeader1;
		end		
	end

	if ConROCCheckFrame2 ~= nil then
		if lastFrame == lastArmor or lastFrame == lastFiller or lastFrame == lastAoE then
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 75, -5);
		else 
			ConROCCheckHeader2:SetPoint("TOP", lastFrame, "BOTTOM", 0, -5);
		end	

		lastOption = ConROCCheckFrame2;
		
	--Options
		if plvl >= 1 and HasWandEquipped() then
			ConROC_SM_Option_UseWand:Show();
			lastOption = ConROC_SM_Option_UseWand;
		else
			ConROC_SM_Option_UseWand:Hide();
		end	
		
		if plvl >= 14 and IsSpellKnown(ids.Arc_Ability.ArcaneExplosionRank1) then 
			ConROC_SM_Option_AoE:Show(); 
			ConROC_SM_Option_AoE:SetPoint("TOP", lastOption, "BOTTOM", 0, 0);
			lastOption = ConROC_SM_Option_AoE;
		else
			ConROC_SM_Option_AoE:Hide();
		end

		if lastOption == ConROCCheckFrame2 then
			ConROCCheckHeader2:Hide();
			ConROCCheckFrame2:Hide();
		end
		
		if ConROCCheckFrame2:IsVisible() then
			lastFrame = lastOption;
		else
			lastFrame = ConROCCheckHeader2;
		end		
	end
end

function ConROC:RoleProfile()
	if ConROC:CheckBox(ConROC_SM_Role_Caster) then
		ConROC_SM_Armor_Ice:SetChecked(ConROCMageSpells.ConROC_Caster_Armor_Ice);
		ConROC_SM_Armor_Mage:SetChecked(ConROCMageSpells.ConROC_Caster_Armor_Mage);
		
		ConROC_SM_Filler_Fireball:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_Fireball);
		ConROC_SM_Filler_Frostbolt:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_Frostbolt);
		ConROC_SM_Filler_ArcaneMissiles:SetChecked(ConROCMageSpells.ConROC_Caster_Filler_ArcaneMissiles);	
		
		ConROC_SM_AoE_ArcaneExplosion:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_ArcaneExplosion);
		ConROC_SM_AoE_Flamestrike:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_Flamestrike);
		ConROC_SM_AoE_Blizzard:SetChecked(ConROCMageSpells.ConROC_Caster_AoE_Blizzard);

		ConROC_SM_Option_UseWand:SetChecked(ConROCMageSpells.ConROC_Caster_Option_UseWand);
		ConROC_SM_Option_AoE:SetChecked(ConROCMageSpells.ConROC_Caster_Option_AoE);

		if ConROC:CheckBox(ConROC_SM_Option_AoE) then
			ConROCButtonFrame:Show();
			if ConROC.db.profile.unlockWindow then
				ConROCToggleMover:Show();
			else
				ConROCToggleMover:Hide();
			end					
		else
			ConROCButtonFrame:Hide();
			ConROCToggleMover:Hide();
		end
		
	elseif ConROC:CheckBox(ConROC_SM_Role_PvP) then
		ConROC_SM_Armor_Ice:SetChecked(ConROCMageSpells.ConROC_PvP_Armor_Ice);
		ConROC_SM_Armor_Mage:SetChecked(ConROCMageSpells.ConROC_PvP_Armor_Mage);

		ConROC_SM_Filler_Fireball:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_Fireball);
		ConROC_SM_Filler_Frostbolt:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_Frostbolt);
		ConROC_SM_Filler_ArcaneMissiles:SetChecked(ConROCMageSpells.ConROC_PvP_Filler_ArcaneMissiles);

		ConROC_SM_AoE_ArcaneExplosion:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_ArcaneExplosion);
		ConROC_SM_AoE_Flamestrike:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_Flamestrike);
		ConROC_SM_AoE_Blizzard:SetChecked(ConROCMageSpells.ConROC_PvP_AoE_Blizzard);
		
		ConROC_SM_Option_UseWand:SetChecked(ConROCMageSpells.ConROC_PvP_Option_UseWand);
		ConROC_SM_Option_AoE:SetChecked(ConROCMageSpells.ConROC_PvP_Option_AoE);	
		
		if ConROC:CheckBox(ConROC_SM_Option_AoE) then
			ConROCButtonFrame:Show();
			if ConROC.db.profile.unlockWindow then
				ConROCToggleMover:Show();
			else
				ConROCToggleMover:Hide();
			end					
		else
			ConROCButtonFrame:Hide();
			ConROCToggleMover:Hide();
		end
	end
end

ConROC.Mage = {};

function ConROC:EnableRotationModule()
	self.Description = "Mage";
	self.NextSpell = ConROC.Mage.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
	
	ConROC:SpellmenuClass();	
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Mage.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
	
	ConROC:JustFrostbolted(spellID);
	ConROC:JustScorched(spellID);
	ConROC:JustFlamestriked(spellID);
end

	local Racial, Spec, Caster, Arc_Ability, Arc_Talent, Fire_Ability, Fire_Talent, Frost_Ability, Frost_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Caster, ids.Arc_Ability, ids.Arc_Talent, ids.Fire_Ability, ids.Fire_Talent, ids.Frost_Ability, ids.Frost_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

	local _AmplifyMagic = Arc_Ability.AmplifyMagicRank1;
	local _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank1;
	local _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank1;
	local _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank1;
	local _DampenMagic = Arc_Ability.DampenMagicRank1;
	local _MageArmor = Arc_Ability.MageArmorRank1;
	local _ManaShield = Arc_Ability.ManaShieldRank1;

	local _BlastWave = Fire_Ability.BlastWaveRank1;
	local _FireBlast = Fire_Ability.FireBlastRank1;
	local _FireWard = Fire_Ability.FireWardRank1;
	local _Fireball = Fire_Ability.FireballRank1;
	local _Flamestrike = Fire_Ability.FlamestrikeRank1;
	local _Pyroblast = Fire_Ability.PyroblastRank1;
	local _Scorch = Fire_Ability.ScorchRank1;
	
	local _Blizzard = Frost_Ability.BlizzardRank1;
	local _ConeofCold = Frost_Ability.ConeofColdRank1;
	local _IceBarrier = Frost_Ability.IceBarrierRank1;
	local _IceArmor = Frost_Ability.FrostArmorRank1;
	local _FrostNova = Frost_Ability.FrostNovaRank1;	
	local _FrostWard = Frost_Ability.FrostWardRank1;
	local _Frostbolt = Frost_Ability.FrostboltRank1;

local wChillEXP = 0;
local fVulEXP = 0;
local fStrikeEXP = 0;
	
function ConROC.Mage.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	local specArcane, specFire, specFrost					= ConROC:SpecTally();
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Ranks
	if IsSpellKnown(Arc_Ability.AmplifyMagicRank4) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank4;
	elseif IsSpellKnown(Arc_Ability.AmplifyMagicRank3) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank3;
	elseif IsSpellKnown(Arc_Ability.AmplifyMagicRank2) then _AmplifyMagic = Arc_Ability.AmplifyMagicRank2; end

	if IsSpellKnown(Arc_Ability.ArcaneExplosionRank6) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank6;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank5) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank4) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank3) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneExplosionRank2) then _ArcaneExplosion = Arc_Ability.ArcaneExplosionRank2; end
	
	if IsSpellKnown(Arc_Ability.ArcaneIntellectRank5) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank4) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank3) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneIntellectRank2) then _ArcaneIntellect = Arc_Ability.ArcaneIntellectRank2; end

	if IsSpellKnown(Arc_Ability.ArcaneMissilesRank7) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank7;	
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank6) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank6;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank5) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank5;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank4) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank4;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank3) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank3;
	elseif IsSpellKnown(Arc_Ability.ArcaneMissilesRank2) then _ArcaneMissiles = Arc_Ability.ArcaneMissilesRank2; end
	
	if IsSpellKnown(Arc_Ability.DampenMagicRank5) then _DampenMagic = Arc_Ability.DampenMagicRank5;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank4) then _DampenMagic = Arc_Ability.DampenMagicRank4;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank3) then _DampenMagic = Arc_Ability.DampenMagicRank3;
	elseif IsSpellKnown(Arc_Ability.DampenMagicRank2) then _DampenMagic = Arc_Ability.DampenMagicRank2; end	

	if IsSpellKnown(Fire_Ability.BlastWaveRank5) then _BlastWave = Fire_Ability.BlastWaveRank5;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank4) then _BlastWave = Fire_Ability.BlastWaveRank4;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank3) then _BlastWave = Fire_Ability.BlastWaveRank3;
	elseif IsSpellKnown(Fire_Ability.BlastWaveRank2) then _BlastWave = Fire_Ability.BlastWaveRank2; end

	if IsSpellKnown(Fire_Ability.FireBlastRank7) then _FireBlast = Fire_Ability.FireBlastRank7;	
	elseif IsSpellKnown(Fire_Ability.FireBlastRank6) then _FireBlast = Fire_Ability.FireBlastRank6;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank5) then _FireBlast = Fire_Ability.FireBlastRank5;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank4) then _FireBlast = Fire_Ability.FireBlastRank4;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank3) then _FireBlast = Fire_Ability.FireBlastRank3;
	elseif IsSpellKnown(Fire_Ability.FireBlastRank2) then _FireBlast = Fire_Ability.FireBlastRank2; end

	if IsSpellKnown(Fire_Ability.FireWardRank5) then _FireWard = Fire_Ability.FireWardRank5;
	elseif IsSpellKnown(Fire_Ability.FireWardRank4) then _FireWard = Fire_Ability.FireWardRank4;
	elseif IsSpellKnown(Fire_Ability.FireWardRank3) then _FireWard = Fire_Ability.FireWardRank3;
	elseif IsSpellKnown(Fire_Ability.FireWardRank2) then _FireWard = Fire_Ability.FireWardRank2; end

	if IsSpellKnown(Fire_Ability.FireballRank11) then _Fireball = Fire_Ability.FireballRank11;
	elseif IsSpellKnown(Fire_Ability.FireballRank10) then _Fireball = Fire_Ability.FireballRank10;
	elseif IsSpellKnown(Fire_Ability.FireballRank9) then _Fireball = Fire_Ability.FireballRank8;
	elseif IsSpellKnown(Fire_Ability.FireballRank8) then _Fireball = Fire_Ability.FireballRank9;
	elseif IsSpellKnown(Fire_Ability.FireballRank7) then _Fireball = Fire_Ability.FireballRank7;	
	elseif IsSpellKnown(Fire_Ability.FireballRank6) then _Fireball = Fire_Ability.FireballRank6;
	elseif IsSpellKnown(Fire_Ability.FireballRank5) then _Fireball = Fire_Ability.FireballRank5;
	elseif IsSpellKnown(Fire_Ability.FireballRank4) then _Fireball = Fire_Ability.FireballRank4;
	elseif IsSpellKnown(Fire_Ability.FireballRank3) then _Fireball = Fire_Ability.FireballRank3;
	elseif IsSpellKnown(Fire_Ability.FireballRank2) then _Fireball = Fire_Ability.FireballRank2; end

	if IsSpellKnown(Fire_Ability.FlamestrikeRank6) then _Flamestrike = Fire_Ability.FlamestrikeRank6;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank5) then _Flamestrike = Fire_Ability.FlamestrikeRank5;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank4) then _Flamestrike = Fire_Ability.FlamestrikeRank4;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank3) then _Flamestrike = Fire_Ability.FlamestrikeRank3;
	elseif IsSpellKnown(Fire_Ability.FlamestrikeRank2) then _Flamestrike = Fire_Ability.FlamestrikeRank2; end

	if IsSpellKnown(Fire_Ability.PyroblastRank8) then _Pyroblast = Fire_Ability.PyroblastRank8;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank7) then _Pyroblast = Fire_Ability.PyroblastRank7;	
	elseif IsSpellKnown(Fire_Ability.PyroblastRank6) then _Pyroblast = Fire_Ability.PyroblastRank6;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank5) then _Pyroblast = Fire_Ability.PyroblastRank5;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank4) then _Pyroblast = Fire_Ability.PyroblastRank4;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank3) then _Pyroblast = Fire_Ability.PyroblastRank3;
	elseif IsSpellKnown(Fire_Ability.PyroblastRank2) then _Pyroblast = Fire_Ability.PyroblastRank2; end

	if IsSpellKnown(Fire_Ability.ScorchRank7) then _Scorch = Fire_Ability.ScorchRank7;	
	elseif IsSpellKnown(Fire_Ability.ScorchRank6) then _Scorch = Fire_Ability.ScorchRank6;
	elseif IsSpellKnown(Fire_Ability.ScorchRank5) then _Scorch = Fire_Ability.ScorchRank5;
	elseif IsSpellKnown(Fire_Ability.ScorchRank4) then _Scorch = Fire_Ability.ScorchRank4;
	elseif IsSpellKnown(Fire_Ability.ScorchRank3) then _Scorch = Fire_Ability.ScorchRank3;
	elseif IsSpellKnown(Fire_Ability.ScorchRank2) then _Scorch = Fire_Ability.ScorchRank2; end

	if IsSpellKnown(Frost_Ability.BlizzardRank6) then _Blizzard = Frost_Ability.BlizzardRank6;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank5) then _Blizzard = Frost_Ability.BlizzardRank5;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank4) then _Blizzard = Frost_Ability.BlizzardRank4;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank3) then _Blizzard = Frost_Ability.BlizzardRank3;
	elseif IsSpellKnown(Frost_Ability.BlizzardRank2) then _Blizzard = Frost_Ability.BlizzardRank2; end

	if IsSpellKnown(Frost_Ability.ConeofColdRank5) then _ConeofCold = Frost_Ability.ConeofColdRank5;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank4) then _ConeofCold = Frost_Ability.ConeofColdRank4;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank3) then _ConeofCold = Frost_Ability.ConeofColdRank3;
	elseif IsSpellKnown(Frost_Ability.ConeofColdRank2) then _ConeofCold = Frost_Ability.ConeofColdRank2; end

	if IsSpellKnown(Frost_Ability.FrostWardRank4) then _FrostWard = Frost_Ability.FrostWardRank4;
	elseif IsSpellKnown(Frost_Ability.FrostWardRank3) then _FrostWard = Frost_Ability.FrostWardRank3;
	elseif IsSpellKnown(Frost_Ability.FrostWardRank2) then _FrostWard = Frost_Ability.FrostWardRank2; end

	if IsSpellKnown(Frost_Ability.FrostboltRank10) then _Frostbolt = Frost_Ability.FrostboltRank10;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank9) then _Frostbolt = Frost_Ability.FrostboltRank9;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank8) then _Frostbolt = Frost_Ability.FrostboltRank8;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank7) then _Frostbolt = Frost_Ability.FrostboltRank7;	
	elseif IsSpellKnown(Frost_Ability.FrostboltRank6) then _Frostbolt = Frost_Ability.FrostboltRank6;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank5) then _Frostbolt = Frost_Ability.FrostboltRank5;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank4) then _Frostbolt = Frost_Ability.FrostboltRank4;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank3) then _Frostbolt = Frost_Ability.FrostboltRank3;
	elseif IsSpellKnown(Frost_Ability.FrostboltRank2) then _Frostbolt = Frost_Ability.FrostboltRank2; end

--Abilties	
	local ampMagRDY											= ConROC:AbilityReady(_AmplifyMagic, timeShift);
		local ampMagBUFF										= ConROC:Buff(_AmplifyMagic, timeShift);
	local aExpRDY											= ConROC:AbilityReady(_ArcaneExplosion, timeShift);
	local aIntRDY											= ConROC:AbilityReady(_ArcaneIntellect, timeShift);
		local aIntBUFF											= ConROC:Buff(_ArcaneIntellect, timeShift);
		local aBriBUFF											= ConROC:Buff(Arc_Ability.ArcaneBrilliance, timeShift);
	local aMissRDY											= ConROC:AbilityReady(_ArcaneMissiles, timeShift);
	local aPowerRDY											= ConROC:AbilityReady(Arc_Ability.ArcanePower, timeShift);
	local blinkRDY											= ConROC:AbilityReady(Arc_Ability.Blink, timeShift);
	local conAgateRDY										= ConROC:AbilityReady(Arc_Ability.ConjureManaAgate, timeShift);
	local conJadeRDY										= ConROC:AbilityReady(Arc_Ability.ConjureManaJade, timeShift);
	local conCitRDY											= ConROC:AbilityReady(Arc_Ability.ConjureManaCitrine, timeShift);
	local conRubyRDY										= ConROC:AbilityReady(Arc_Ability.ConjureManaRuby, timeShift);
	local cSpellRDY											= ConROC:AbilityReady(Arc_Ability.Counterspell, timeShift);
	local dampenMagRDY										= ConROC:AbilityReady(_DampenMagic, timeShift);
		local dampenMagBUFF										= ConROC:Buff(_DampenMagic, timeShift);
	local evoRDY											= ConROC:AbilityReady(Arc_Ability.Evocation, timeShift);
	local pomRDY											= ConROC:AbilityReady(Arc_Ability.PresenceofMind, timeShift);
		local pomBUFF										= ConROC:Buff(Arc_Ability.PresenceofMind, timeShift);
	local bWaveRDY											= ConROC:AbilityReady(_BlastWave, timeShift);
	local combRDY											= ConROC:AbilityReady(Fire_Ability.Combustion, timeShift);
	local fBlastRDY											= ConROC:AbilityReady(_FireBlast, timeShift);
	local fBallRDY											= ConROC:AbilityReady(_Fireball, timeShift);
		local fBallDEBUFF										= ConROC:TargetDebuff(_Fireball, timeShift);
	local fStrikeRDY										= ConROC:AbilityReady(_Flamestrike, timeShift);
		local fStrikeDUR										= fStrikeEXP - GetTime();
	local pBlastRDY											= ConROC:AbilityReady(_Pyroblast, timeShift);
	local scorRDY											= ConROC:AbilityReady(_Scorch, timeShift);
	local blizRDY											= ConROC:AbilityReady(_Blizzard, timeShift);
	local cSnapRDY											= ConROC:AbilityReady(Frost_Ability.ColdSnap, timeShift);
	local cofcRDY											= ConROC:AbilityReady(_ConeofCold, timeShift);
	local frBoltRDY											= ConROC:AbilityReady(_Frostbolt, timeShift);
		local frBoltDEBUFF										= ConROC:TargetDebuff(_Frostbolt, timeShift);
	
		local chillDEBUFF										= ConROC:TargetDebuff(Target_Debuff.Chilled, timeShift);
		local wChillDEBUFF, wChillCount							= ConROC:TargetDebuff(Target_Debuff.WintersChill);
		local wChillDUR											= wChillEXP - GetTime();
		local fVulDEBUFF, fVulCount								= ConROC:TargetDebuff(Target_Debuff.FireVulnerability);
		local fVulDUR											= fVulEXP - GetTime();
		local frNovaDEBUFF										= ConROC:TargetDebuff(_FrostNova);
		
	local _, impArcPoints									= ConROC:TalentChosen(Spec.Arcane, Arc_Talent.ImprovedArcaneMissiles)
	
--Conditions
	local inMelee 											= CheckInteractDistance("target", 3);		
	local targetPh 											= ConROC:PercentHealth('target');		
	local hasWand											= HasWandEquipped();
	local incombat											= UnitAffectingCombat('player');	
	
--Indicators	
	ConROC:AbilityBurst(Arc_Ability.Evocation, evoRDY and manaPercent <= 10);
	ConROC:AbilityBurst(Arc_Ability.PresenceofMind, pomRDY and incombat);
	ConROC:AbilityBurst(Arc_Ability.ArcanePower, aPowerRDY and incombat and (not ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) or (ConROC:TalentChosen(Spec.Frost, Frost_Talent.WintersChill) and wChillCount == 5))) ;	
	ConROC:AbilityBurst(Fire_Ability.Combustion, combRDY and incombat and (not ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) or (ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and fVuCount == 5)));

	ConROC:AbilityRaidBuffs(_ArcaneIntellect, aIntRDY and not (aIntBUFF or aBriBUFF));
	
--Warnings	
	
--Rotations
	if pBlastRDY and (not incombat or pomBUFF) then
		return _Pyroblast;
	end
	
	if wChillCount >= 1 and wChillDUR <= 4 then
		return _Frostbolt;
	end
	
	if fVulCount >= 1 and fVulDUR <= 4 then
		return _Scorch;
	end	
	
	if cofcRDY and frNovaDEBUFF and inMelee then
        return _ConeofCold;
    end
	
	if fBlastRDY and (targetPh <= 25 or inMelee) and not ConROC_AoEButton:IsVisible() then
		return _FireBlast;
	end

	if ConROC:CheckBox(ConROC_SM_Option_UseWand) and hasWand and ((manaPercent <= 20 and not evoRDY) or targetPh <= 5) then
		return Caster.Shoot;
	end
	
	if ConROC_AoEButton:IsVisible() and bWaveRDY and inMelee then 
		return _BlastWave;
	end
	
	if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_ArcaneExplosion) and aExpRDY and inMelee then
		return _ArcaneExplosion;
	end

	if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Flamestrike) and fStrikeRDY and not inMelee and fStrikeDUR <= 2 then
		return _Flamestrike;
	end	
	
	if ConROC_AoEButton:IsVisible() and ConROC:CheckBox(ConROC_SM_AoE_Blizzard) and blizRDY and not inMelee then
		return _Blizzard;
	end	
	
	if scorRDY and ConROC:TalentChosen(Spec.Fire, Fire_Talent.ImprovedScorch) and fVulCount < 5 then
		return _Scorch;
	end
	
	if ConROC:CheckBox(ConROC_SM_Filler_Fireball) and fBallRDY then
		return _Fireball;
	end
	
	if ConROC:CheckBox(ConROC_SM_Filler_ArcaneMissiles) and aMissRDY then
		return _ArcaneMissiles;
	end
	
	if ConROC:CheckBox(ConROC_SM_Filler_Frostbolt) and frBoltRDY then
		return _Frostbolt;
	end	
	
	return nil;		
end

function ConROC.Mage.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');

--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Ranks
	if IsSpellKnown(Arc_Ability.MageArmorRank3) then _MageArmor = Arc_Ability.MageArmorRank3;
	elseif IsSpellKnown(Arc_Ability.MageArmorRank2) then _MageArmor = Arc_Ability.MageArmorRank2; end

	if IsSpellKnown(Arc_Ability.ManaShieldRank6) then _ManaShield = Arc_Ability.ManaShieldRank6;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank5) then _ManaShield = Arc_Ability.ManaShieldRank5;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank4) then _ManaShield = Arc_Ability.ManaShieldRank4;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank3) then _ManaShield = Arc_Ability.ManaShieldRank3;
	elseif IsSpellKnown(Arc_Ability.ManaShieldRank2) then _ManaShield = Arc_Ability.ManaShieldRank2; end
	
	if IsSpellKnown(Frost_Ability.IceBarrierRank4) then _IceBarrier = Frost_Ability.IceBarrierRank4;
	elseif IsSpellKnown(Frost_Ability.IceBarrierRank3) then _IceBarrier = Frost_Ability.IceBarrierRank3;
	elseif IsSpellKnown(Frost_Ability.IceBarrierRank2) then _IceBarrier = Frost_Ability.IceBarrierRank2; end

	if IsSpellKnown(Frost_Ability.IceArmorRank4) then _IceArmor = Frost_Ability.IceArmorRank4;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank3) then _IceArmor = Frost_Ability.IceArmorRank3;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank2) then _IceArmor = Frost_Ability.IceArmorRank2;
	elseif IsSpellKnown(Frost_Ability.IceArmorRank1) then _IceArmor = Frost_Ability.IceArmorRank1;	
	elseif IsSpellKnown(Frost_Ability.FrostArmorRank3) then _IceArmor = Frost_Ability.FrostArmorRank3;
	elseif IsSpellKnown(Frost_Ability.FrostArmorRank2) then _IceArmor = Frost_Ability.FrostArmorRank2; end

	if IsSpellKnown(Frost_Ability.FrostNovaRank4) then _FrostNova = Frost_Ability.FrostNovaRank4;
	elseif IsSpellKnown(Frost_Ability.FrostNovaRank3) then _FrostNova = Frost_Ability.FrostNovaRank3;
	elseif IsSpellKnown(Frost_Ability.FrostNovaRank2) then _FrostNova = Frost_Ability.FrostNovaRank2; end
	
--Abilties
	local mageArmorRDY										= ConROC:AbilityReady(_MageArmor, timeShift);
		local mageArmorBUFF										= ConROC:Buff(_MageArmor, timeShift);
	local manaShieldRDY										= ConROC:AbilityReady(_ManaShield, timeShift);
		local manaShieldBUFF										= ConROC:Buff(_ManaShield, timeShift);	
	local iBarRDY											= ConROC:AbilityReady(_IceBarrier, timeShift);
		local iBarBUFF										= ConROC:Buff(_IceBarrier, timeShift);	
	local iArmorRDY											= ConROC:AbilityReady(_IceArmor, timeShift);
		local iArmorBUFF										= ConROC:Buff(_IceArmor, timeShift);	
	local frNovaRDY											= ConROC:AbilityReady(_FrostNova, timeShift);
	
--Conditions
	local inMelee 											= CheckInteractDistance("target", 3);	
	local targetPh 											= ConROC:PercentHealth('target');	
	
--Indicators

	
--Rotations
	if ConROC:CheckBox(ConROC_SM_Armor_Ice) and iArmorRDY and not iArmorBUFF then
		return _IceArmor;
	end
	
	if ConROC:CheckBox(ConROC_SM_Armor_Mage) and mageArmorRDY and not mageArmorBUFF then
		return _MageArmor;
	end
	
	if frNovaRDY and inMelee and targetPh >= 20 then
		return _FrostNova;
	end	

	if iBarRDY and not iBarBUFF then
		return _IceBarrier;
	end
	
	return nil;
end

function ConROC:JustFrostbolted(spellID)
	if spellID == _Frostbolt then
		local expTime = GetTime() + 15;
		wChillEXP = expTime;
	end
end

function ConROC:JustFlamestriked(spellID)
	if spellID == _Flamestrike then
		local expTime = GetTime() + 8;
		fStrikeEXP = expTime;
	end
end

function ConROC:JustScorched(spellID)
	if spellID == _Scorch then
		local expTime = GetTime() + 30;
		fVulEXP = expTime;
	end
end