local AceGUI = LibStub('AceGUI-3.0');
local lsm = LibStub('AceGUISharedMediaWidgets-1.0');
local media = LibStub('LibSharedMedia-3.0');
local ADDON_NAME, ADDON_TABLE = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version");
local addoninfo = 'Main: Ver ' .. version;

BINDING_HEADER_ConROC = "ConROC Hotkeys"
BINDING_NAME_CONROCUNLOCK = "Lock/Unlock ConROC"

ConROC = LibStub('AceAddon-3.0'):NewAddon('ConROC', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0');

ConROC.Textures = {
	['Ping'] = 'Interface\\Cooldown\\ping4',
	['Star'] = 'Interface\\Cooldown\\star4',
	['Starburst'] = 'Interface\\Cooldown\\starburst',
	['Shield'] = 'Interface\\AddOns\\ConROC\\images\\shield2',
	['Skull'] = 'Interface\\AddOns\\ConROC\\images\\skull',
};
ConROC.FinalTexture = nil;

ConROC.Colors = {
	Info = '|cFF1394CC',
	Error = '|cFFF0563D',
	Success = '|cFFBCCF02',
	[1] = '|cFFC79C6E',
	[2] = '|cFFF58CBA',
	[3] = '|cFFABD473',
	[4] = '|cFFFFF569',
	[5] = '|cFFFFFFFF',
	[6] = '|cFFC41F3B',
	[7] = '|cFF0070DE',
	[8] = '|cFF69CCF0',
	[9] = '|cFF9482C9',
	[10] = '|cFF00FF96',
	[11] = '|cFFFF7D0A',
	[12] = '|cFFA330C9',
}

ConROC.Classes = {
	[1] = 'Warrior',
	[2] = 'Paladin',
	[3] = 'Hunter',
	[4] = 'Rogue',
	[5] = 'Priest',
	[6] = 'DeathKnight',
	[7] = 'Shaman',
	[8] = 'Mage',
	[9] = 'Warlock',
	[10] = 'Monk',
	[11] = 'Druid',
	[12] = 'DemonHunter',
}

local defaultOptions = {
	profile = {
		disabledInfo = false,
		enableWindow = true,
		enableDefenseWindow = false,
		enablePurgeWindow = false,
		combatWindow = false,
		enableWindowCooldown = true,
		unlockWindow = true,
		enableWindowSpellName = true,
		enableWindowKeybinds = true,
		enableWindowBackground = true,
		transparencyWindow = 0.6,
		windowIconSize = 50,
		flashIconSize = 50,
		toggleButtonSize = 1,
		interval = 0.20,
		overlayScale = 1,
		damageOverlayAlpha = true,
		defenseOverlayAlpha = true,
		notifierOverlayAlpha = true,
		damageOverlayColor = {r = 0.8,g = 0.8,b = 0.8,a = 1},
		cooldownOverlayColor = {r = 1,g = 0.6,b = 0,a = 1},
		defenseOverlayColor = {r = 0,g = 0.7,b = 1,a = 1},
		purgeOverlayColor = {r = 0.6,g = 0,b = .9,a = 1},
		raidbuffsOverlayColor = {r = 0,g = 0.6,b = 0, a = 1},
		tauntOverlayColor = {r = 0.8,g = 0,b = 0, a = 1},
		movementOverlayColor = {r = 0.2,g = 0.9,b = 0.2, a = 1},
	}
}	

local orientations = {
		"Vertical",
		"Horizontal",
}

local _, _, classIdv = UnitClass('player');
local cversion = GetAddOnMetadata('ConROC_' .. ConROC.Classes[classIdv], 'Version');
local classinfo = " ";

	if cversion ~= nil then
		classinfo = ConROC.Classes[classIdv] .. ': Ver ' .. cversion;
	end

local options = {
	type = 'group',
	name = '-= |cffFFFFFFConROC  (Conflict Rotation Optimizer Classic)|r =-',
	inline = false,
	args = {
		authorPull = {
			order = 1,
			type = "description",
			width = "full",
			name = "Author: Vae",
		},
		versionPull = {
			order = 2,
			type = "description",
			width = "full",
			name = addoninfo,
		},
		cversionPull = {
			order = 3,
			type = "description",
			width = "full",
			name = classinfo,
		},		
		spacer4 = {
			order = 4,
			type = "description",
			width = "full",
			name = "\n\n",
		},
		interval = {
			name = 'Interval in seconds',
			desc = 'Sets how frequent rotation updates will be. Low value will result in fps drops.',
			type = 'range',
			order = 5,
			hidden = true,
			min = 0.01,
			max = 2,
			set = function(info,val) ConROC.db.profile.interval = val end,
			get = function(info) return ConROC.db.profile.interval end
		},
		disabledInfo = {
			name = 'Disable info messages',
			desc = 'Enables / disables info messages, if you have issues with addon, make sure to deselect this.',
			type = 'toggle',
			width = 'double',
			order = 6,
			set = function(info, val)
				ConROC.db.profile.disabledInfo = val;
			end,
			get = function(info) return ConROC.db.profile.disabledInfo end
		},
		reloadButton = {
			name = 'ReloadUI',
			desc = 'Reloads UI after making changes that need it.',
			type = 'execute',
			width = 'normal',
			order = 7,
			func = function(info)
				ReloadUI();
			end
		},
		unlockWindow = {
			name = 'Unlock ConROC',
			desc = 'Make display windows movable.',
			type = 'toggle',
			width = 'normal',
			order = 8,
			set = function(info, val)
				ConROC.db.profile.unlockWindow = val;
				ConROCWindow:EnableMouse(ConROC.db.profile.unlockWindow);
				ConROCDefenseWindow:EnableMouse(ConROC.db.profile.unlockWindow);
				ConROCPurgeWindow:EnableMouse(ConROC.db.profile.unlockWindow);
				
				if val == true and ConROC.db.profile.enablePurgeWindow == true then
					ConROCPurgeWindow:Show();					
				else
					ConROCPurgeWindow:Hide();					
				end
	
				if val == true or ConROC.db.profile.enableWindowBackground then
					ConROCWindow.texture:Show();
					ConROCDefenseWindow.texture:Show();
				else 
					ConROCWindow.texture:Hide();
					ConROCDefenseWindow.texture:Hide();
				end
				
				if ConROCSpellmenuMover ~= nil then
					ConROCSpellmenuMover:EnableMouse(ConROC.db.profile.unlockWindow);
					if val == true then
						ConROCSpellmenuMover:Show();					
					else
						ConROCSpellmenuMover:Hide();					
					end
				end
				if ConROCToggleMover ~= nil and ConROCButtonFrame:IsVisible() then
					ConROCToggleMover:EnableMouse(ConROC.db.profile.unlockWindow);
					if val == true then
						ConROCToggleMover:Show();					
					else
						ConROCToggleMover:Hide();					
					end
				end
			end,
			get = function(info) return ConROC.db.profile.unlockWindow end
		},		
		spacer10 = {
			order = 10,
			type = "description",
			width = "full",
			name = "\n\n",
		},
		overlaySettings = {
			type = 'header',
			name = 'Overlay Settings',
			order = 11,
		},
		damageOverlayAlpha = {
			name = 'Show Damage Overlay',
			desc = 'Turn damage overlay on and off.',
			type = 'toggle',
			width = 'default',
			order = 12,
			set = function(info, val)
				ConROC.db.profile.damageOverlayAlpha = val;
			end,
			get = function(info) return ConROC.db.profile.damageOverlayAlpha end
		},
		damageOverlayColor = {
			name = 'Damage Color',
			desc = 'Change damage overlay color.',
			type = 'color',
			hasAlpha = true,
			width = 'default',
			order = 13,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.damageOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.damageOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		cooldownOverlayColor = {
			name = 'Cooldown Color',
			desc = 'Change cooldown burst overlay color.',
			type = 'color',
			hasAlpha = true,
			order = 14,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.cooldownOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.cooldownOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		defenseOverlayAlpha = {
			name = 'Show Defense Overlay',
			desc = 'Turn defense overlay on and off.',
			type = 'toggle',
			width = 'default',
			order = 15,
			set = function(info, val)
				ConROC.db.profile.defenseOverlayAlpha = val;
			end,
			get = function(info) return ConROC.db.profile.defenseOverlayAlpha end
		},
		defenseOverlayColor = {
			name = 'Defense Color',
			desc = 'Change defense overlay color.',
			type = 'color',
			hasAlpha = true,
			order = 16,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.defenseOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.defenseOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		tauntOverlayColor = {
			name = 'Taunt Color',
			desc = 'Change taunt overlay color.',
			type = 'color',
			hasAlpha = true,
			order = 17,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.tauntOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.tauntOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		notifierOverlayAlpha = {
			name = 'Show Notifier Overlay',
			desc = 'Turn interrupt, raid buff and purge overlays on and off.',
			type = 'toggle',
			width = 'default',
			order = 18,
			set = function(info, val)
				ConROC.db.profile.notifierOverlayAlpha = val;
			end,
			get = function(info) return ConROC.db.profile.notifierOverlayAlpha end
		},
		purgeOverlayColor = {
			name = 'Purgable Color',
			desc = 'Change purge overlay color.',
			type = 'color',
			hasAlpha = true,
			order = 20,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.purgeOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.purgeOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		spacer21 = {
			order = 21,
			type = "description",
			width = "normal",
			name = "\n\n",
		},
		raidbuffsOverlayColor = {
			name = 'Raid Buffs Color',
			desc = 'Change raid buffs overlay color.',
			type = 'color',
			width = "default",
			hasAlpha = true,
			order = 22,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.raidbuffsOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.raidbuffsOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		movementOverlayColor = {
			name = 'Movement Color',
			desc = 'Change movement overlay color.',
			type = 'color',
			width = "default",
			hasAlpha = true,
			order = 23,
			set = function(info, r, g, b, a)
				local t = ConROC.db.profile.movementOverlayColor;
				t.r, t.g, t.b, t.a = r, g, b, a;
			end,
			get = function(info)
				local t = ConROC.db.profile.movementOverlayColor;
				return t.r, t.g, t.b, t.a;
			end
		},
		overlayScale = {
			name = 'Change Overlay Size',
			desc = 'Sets the scale of the Overlays.',
			type = 'range',
			width = 'normal',
			order = 24,
			min = .5,
			max = 1.5,
			step = .1,
			set = function(info,val)
			ConROC.db.profile.overlayScale = val
			end,
			get = function(info) return ConROC.db.profile.overlayScale end
		},
		spacer30 = {
			order = 30,
			type = "description",
			width = "full",
			name = "\n\n",
		},
		toggleButtonSettings = {
			type = 'header',
			name = 'Toggle Button Settings',
			order = 31,
		},		
		toggleButtonSize = {
			name = 'Toggle Button Size',
			desc = 'Sets the scale of the toggle buttons.',
			type = 'range',
			width = 'default',
			order = 35,
			min = 1,
			max = 2,
			step = .1,
			set = function(info,val)
			ConROC.db.profile.toggleButtonSize = val
			ConROCButtonFrame:SetScale(ConROC.db.profile.toggleButtonSize)
			end,
			get = function(info) return ConROC.db.profile.toggleButtonSize end
		},
		spacer40 = {
			order = 40,
			type = "description",
			width = "full",
			name = "\n\n",
		},
		displayWindowSettings = {
			type = 'header',
			name = 'Display Window Settings',
			order = 41,
		},
		enableWindow = {
			name = 'Enable Display Window',
			desc = 'Show movable display window.',
			type = 'toggle',
			width = 'default',
			order = 42,
			set = function(info, val)
				ConROC.db.profile.enableWindow = val;
				if val == true and not ConROC:HealSpec() then
					ConROCWindow:Show();
				else
					ConROCWindow:Hide();
				end
			end,
			get = function(info) return ConROC.db.profile.enableWindow end
		},
		combatWindow = {
			name = 'Only Display with Hostile',
			desc = 'Show display window only when hostile target selected.',
			type = 'toggle',
			width = 'default',
			order = 43,
			set = function(info, val)
				ConROC.db.profile.combatWindow = val;
				if val == true then
					ConROCWindow:Hide();
					ConROCDefenseWindow:Hide();
				else
					ConROCWindow:Show();
					ConROCDefenseWindow:Show();				
				end
			end,
			get = function(info) return ConROC.db.profile.combatWindow end
		},
		enableWindowCooldown = {
			name = 'Enable Cooldown Swirl',
			desc = 'Show cooldown swirl on Display Windows. REQUIRES RELOAD',
			type = 'toggle',
			width = 'normal',
			order = 44,
			set = function(info, val)
				ConROC.db.profile.enableWindowCooldown = val;		
			end,
			get = function(info) return ConROC.db.profile.enableWindowCooldown end
		},
		enableWindowSpellName = {
			name = 'Show Spellname',
			desc = 'Show spellname above Display Windows. REQUIRES RELOAD',
			type = 'toggle',
			width = 'normal',
			order = 45,
			set = function(info, val)
				ConROC.db.profile.enableWindowSpellName = val;
			end,
			get = function(info) return ConROC.db.profile.enableWindowSpellName end
		},
		enableWindowKeybinds = {
			name = 'Show Keybind',
			desc = 'Show keybinds below Display Windows. REQUIRES RELOAD',
			type = 'toggle',
			width = 'normal',
			order = 46,
			set = function(info, val)
				ConROC.db.profile.enableWindowKeybinds = val;
			end,
			get = function(info) return ConROC.db.profile.enableWindowKeybinds end
		},
		enableWindowBackground = {
			name = 'Show Background',
			desc = 'Show background texture behind Display Windows. As long as windows are locked.',
			type = 'toggle',
			width = 'normal',
			order = 47,
			set = function(info, val)
				ConROC.db.profile.enableWindowBackground = val;		
				if val == true or ConROC.db.profile.unlockWindow then
					ConROCWindow.texture:Show();
					ConROCDefenseWindow.texture:Show();
				else 
					ConROCWindow.texture:Hide();
					ConROCDefenseWindow.texture:Hide();
				end
			end,
			get = function(info) return ConROC.db.profile.enableWindowBackground end
		},
		transparencyWindow = {
			name = 'Window Transparency',
			desc = 'Change transparency of your windows and texts. -REQUIRES RELOAD-',
			type = 'range',
			width = 'normal',
			order = 48,
			min = 0,
			max = 1,
			step = 0.01,
			set = function(info, val)
				ConROC.db.profile.transparencyWindow = val;
			end,
			get = function(info) return ConROC.db.profile.transparencyWindow end
		},	
		windowIconSize = {
			name = 'Display windows Icon size.',
			desc = 'Sets the size of the icon in your display windows. REQUIRES RELOAD',
			type = 'range',
			width = 'normal',
			order = 49,
			min = 20,
			max = 100,
			step = 2,
			set = function(info, val)
				ConROC.db.profile.windowIconSize = val;
			end,
			get = function(info) return ConROC.db.profile.windowIconSize end
		},
		flashIconSize = {
			name = 'Flasher Icon size.',
			desc = 'Sets the size of the icon that flashes for Interrupts and Purges.',
			type = 'range',
			width = 'normal',
			order = 50,
			min = 20,
			max = 100,
			step = 2,
			set = function(info, val)
				ConROC.db.profile.flashIconSize = val;
				ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
			end,
			get = function(info) return ConROC.db.profile.flashIconSize end
		},		
		enableDefenseWindow = {
			name = 'Enable Defense Window',
			desc = 'Show movable defense window.',
			type = 'toggle',
			width = 'default',
			order = 51,
			set = function(info, val)
				ConROC.db.profile.enableDefenseWindow = val;
				if val == true then
					ConROCDefenseWindow:Show();
				else
					ConROCDefenseWindow:Hide();
				end				
			end,
			get = function(info) return ConROC.db.profile.enableDefenseWindow end
		},
		enablePurgeWindow = {
			name = 'Enable Purge Window',
			desc = 'Show movable interrupt window.',
			type = 'toggle',
			width = 'default',
			order = 52,		
			set = function(info, val)
				ConROC.db.profile.enablePurgeWindow = val;			
				if val == true and ConROC.db.profile.unlockWindow == true then
					ConROCPurgeWindow:Show();
				else
					ConROCPurgeWindow:Hide();
				end	
			end,
			get = function(info) return ConROC.db.profile.enablePurgeWindow end
		},
		spacer52 = {
			order = 53,
			type = "description",
			width = "double",
			name = "\n\n",
		},		
		resetExtraWindows = {
			name = 'Reset Positions',
			desc = ('Back to Default. RELOAD REQUIRED'),
			type = 'execute',
			width = 'default',
			order = 54,
			confirm = true,			
			func = function(info)
				ConROC.db.profile.unlockWindow = false;
				ConROCPurgeWindow:SetPoint("LEFT", "ConROCWindow", "RIGHT", 5, 0);
				ReloadUI();
			end
		},
		resetButton = {
			name = 'Reset Settings',
			desc = 'Resets options back to default. RELOAD REQUIRED',
			type = 'execute',
			width = 'full',
			order = 61,
			confirm = true,
			func = function(info)
				ConROC.db:ResetProfile();
				ConROC.db.profile.unlockWindow = false;
				ConROCPurgeWindow:SetPoint("LEFT", "ConROCWindow", "RIGHT", 5, 0);				
				ReloadUI();
			end
		},
	},
}

function ConROC:GetTexture()
	if self.db.profile.customTexture ~= '' and self.db.profile.customTexture ~= nil then
		self.FinalTexture = self.db.profile.customTexture;
		return self.FinalTexture;
	end

	self.FinalTexture = self.Textures[self.db.profile.texture];
	if self.FinalTexture == '' or self.FinalTexture == nil then
		self.FinalTexture = 'Interface\\Cooldown\\ping4';
	end

	return self.FinalTexture;
end

function ConROC:OnInitialize()
	LibStub('AceConfig-3.0'):RegisterOptionsTable('ConROC', options, {'conroc'});
	self.db = LibStub('AceDB-3.0'):New('ConROCPreferences', defaultOptions);
	self.optionsFrame = LibStub('AceConfigDialog-3.0'):AddToBlizOptions('ConROC', 'ConROC');
	self:DisplayToggleFrame();
	self.DisplayWindowFrame();
	self.DefenseWindowFrame();
	self.PurgeWindowFrame();
	
	ConROCToggleMover:Hide();
	ConROCButtonFrame:Hide();
	
	local _, _, Class = UnitClass("player")
	if Class == 1 or Class == 2 or Class == 3 or Class == 4 or Class == 5 or Class == 8 or Class == 9 then
		self.SpellmenuFrame();	
	end
	

	
--[[[1] = 'Warrior',
	[2] = 'Paladin',
	[3] = 'Hunter',
	[4] = 'Rogue',
	[5] = 'Priest',
	[6] = 'DeathKnight',
	[7] = 'Shaman',
	[8] = 'Mage',
	[9] = 'Warlock',
	[10] = 'Monk',
	[11] = 'Druid',
	[12] = 'DemonHunter',]]
	
end

ConROC.DefaultPrint = ConROC.Print;
function ConROC:Print(...)
	if self.db.profile.disabledInfo then
		return;
	end
	ConROC:DefaultPrint(...);
end

function ConROC:EnableRotation()
	if self.NextSpell == nil or self.rotationEnabled then
		self:Print(self.Colors.Error .. 'Failed to enable addon!');
		return;
	end
	
	self.Fetch();
	
	if self.ModuleOnEnable then
		self.ModuleOnEnable();
	end

	self:EnableRotationTimer();
	self.rotationEnabled = true;
end

function ConROC:EnableDefense()
	if self.NextDef == nil or self.defenseEnabled then
		self:Print(self.Colors.Error .. 'Failed to enable defense module!');
		return;
	end
	
	self.FetchDef();
	
	if self.ModuleOnEnable then
		self.ModuleOnEnable();
	end

	self:EnableDefenseTimer();
	self.defenseEnabled = true;
end

function ConROC:EnableRotationTimer()
	self.RotationTimer = self:ScheduleRepeatingTimer('InvokeNextSpell', self.db.profile.interval);
end

function ConROC:EnableDefenseTimer()
	self.DefenseTimer = self:ScheduleRepeatingTimer('InvokeNextDef', self.db.profile.interval);
end

function ConROC:DisableRotation()
	if not self.rotationEnabled then
		return;
	end

	self:DisableRotationTimer();

					
	self:DestroyDamageOverlays();
	self:DestroyInterruptOverlays();
	self:DestroyCoolDownOverlays();
	self:DestroyPurgableOverlays();
	self:DestroyRaidBuffsOverlays();
	self:DestroyMovementOverlays();	
	self:DestroyTauntOverlays();
	
	self.Spell = nil;
	self.rotationEnabled = false;
end

function ConROC:DisableDefense()
	if not self.defenseEnabled then
		return;
	end

	self:DisableDefenseTimer();

	self:DestroyDefenseOverlays();
	
	self.Def = nil;
	self.defenseEnabled = false;
end

function ConROC:DisableRotationTimer()
	if self.RotationTimer then
		self:CancelTimer(self.RotationTimer);
	end
end

function ConROC:DisableDefenseTimer()
	if self.DefenseTimer then
		self:CancelTimer(self.DefenseTimer);
	end
end

function ConROC:OnEnable()
	self:RegisterEvent('PLAYER_TARGET_CHANGED');
	self:RegisterEvent('ACTIONBAR_SLOT_CHANGED');
	self:RegisterEvent('PLAYER_REGEN_DISABLED');
	self:RegisterEvent('PLAYER_REGEN_ENABLED');	
	self:RegisterEvent('PLAYER_ENTERING_WORLD');
	self:RegisterEvent('UPDATE_SHAPESHIFT_FORM');
	self:RegisterEvent('ACTIONBAR_HIDEGRID');
	self:RegisterEvent('ACTIONBAR_PAGE_CHANGED');
	self:RegisterEvent('LEARNED_SPELL_IN_TAB');
	self:RegisterEvent('CHARACTER_POINTS_CHANGED');
	self:RegisterEvent('UPDATE_MACROS');

	self:RegisterEvent('PLAYER_CONTROL_LOST');
	self:RegisterEvent('PLAYER_CONTROL_GAINED');	
	
	self:Print(self.Colors.Info .. 'Initialized');
end

function ConROC:ACTIONBAR_HIDEGRID()
	ConROC:ButtonFetch();
	
	self:DestroyInterruptOverlays();
	self:DestroyCoolDownOverlays();
	self:DestroyPurgableOverlays();
	self:DestroyRaidBuffsOverlays();
	self:DestroyMovementOverlays();
	self:DestroyTauntOverlays();
end

function ConROC:PLAYER_CONTROL_LOST()
--	self:Print(self.Colors.Success .. 'Lost Control!');
		self:DisableRotation();
		self:DisableDefense();
end

function ConROC:PLAYER_CONTROL_GAINED()
		self:DisableRotation();
		self:DisableDefense();
		self:EnableRotation();
		self:EnableDefense();
end

function ConROC:PLAYER_ENTERING_WORLD()
	self:UpdateButtonGlow();
	if not self.rotationEnabled then
		self:Print(self.Colors.Success .. 'Auto enable on login!');
		self:Print(self.Colors.Info .. 'Loading class module');
		self:LoadModule();
		self:EnableRotation();
		self:EnableDefense();
	end
end

function ConROC:PLAYER_TARGET_CHANGED()
	if self.rotationEnabled then
		if (UnitIsFriend('player', 'target')) then
			return;
		else
			self:DestroyInterruptOverlays();
			self:DestroyPurgableOverlays();
			self:InvokeNextSpell();
		end
	end
	
	if ConROC.db.profile.enableWindow and (ConROC.db.profile.combatWindow or ConROC:CheckBox(ConROC_SM_Role_Healer)) and ConROC:TarHostile() then
		ConROCWindow:Show();	
	elseif ConROC.db.profile.enableWindow and not (ConROC.db.profile.combatWindow or ConROC:CheckBox(ConROC_SM_Role_Healer)) then
		ConROCWindow:Show();		
	else
		ConROCWindow:Hide();			
	end
	
	if ConROC.db.profile.enableDefenseWindow and ConROC.db.profile.combatWindow and ConROC:TarHostile() then
		ConROCDefenseWindow:Show();			
	elseif ConROC.db.profile.enableDefenseWindow and not ConROC.db.profile.combatWindow then
		ConROCDefenseWindow:Show();			
	else
		ConROCDefenseWindow:Hide();			
	end
end

function ConROC:PLAYER_REGEN_DISABLED()
	if not self.rotationEnabled then
		self:Print(self.Colors.Success .. 'Auto enable on combat!');
		self:Print(self.Colors.Info .. 'Loading class module');
		self:LoadModule();
		self:EnableRotation();
		self:EnableDefense();
	end
end

function ConROC:LEARNED_SPELL_IN_TAB()
	ConROC:ButtonFetch();
	ConROC:SpellMenuUpdate();
end

function ConROC:ButtonFetch()
	C_Timer.After(1, function() 
		if self.rotationEnabled then
			if self.fetchTimer then
				self:CancelTimer(self.fetchTimer);
				self:CancelTimer(self.fetchdefTimer);
			end
			self.fetchTimer = self:ScheduleTimer('Fetch', 0.5);
			self.fetchdefTimer = self:ScheduleTimer('FetchDef', 0.5);
		end
	end);
end

ConROC.PLAYER_REGEN_ENABLED = ConROC.ButtonFetch;
ConROC.ACTIONBAR_SLOT_CHANGED = ConROC.ButtonFetch;
--ConROC.ACTIONBAR_HIDEGRID = ConROC.ButtonFetch;
ConROC.ACTIONBAR_PAGE_CHANGED = ConROC.ButtonFetch;
ConROC.UPDATE_SHAPESHIFT_FORM = ConROC.ButtonFetch;
ConROC.CHARACTER_POINTS_CHANGED = ConROC.ButtonFetch;
ConROC.UPDATE_MACROS = ConROC.ButtonFetch;

function ConROC:InvokeNextSpell()
	local oldSkill = self.Spell;

	local timeShift, currentSpell, gcd = ConROC:EndCast();
	
	self.Spell = self:NextSpell(timeShift, currentSpell, gcd);
	ConROC:UpdateRotation();
	ConROC:UpdateButtonGlow();

	if (oldSkill ~= self.Spell or oldSkill == nil) and self.Spell ~= nil then
		self:GlowNextSpell(self.Spell);
		self:GlowNextWindow(self.Spell);
	end
	
	if self.Spell == nil and oldSkill ~= nil then
		self:GlowClear();
		self:WindowClear();
	end
end

function ConROC:InvokeNextDef()
	local oldSkill = self.Def;

	local timeShift, currentSpell, gcd = ConROC:EndCast();
	
	self.Def = self:NextDef(timeShift, currentSpell, gcd);
	ConROC:UpdateDefRotation();
	
	if (oldSkill ~= self.Def or oldSkill == nil) and self.Def ~= nil then
		self:GlowNextDef(self.Def);
		self:GlowNextDefWindow(self.Def);		
	end
	
	if self.Def == nil and oldSkill ~= nil then
		self:GlowClearDef();
		self:DefWindowClear();		
	end
end

function ConROC:LoadModule()
	local _, _, classId = UnitClass('player');
	if self.Classes[classId] == nil then
		self:Print(self.Colors.Error, 'Invalid player class, please contact author of addon.');
		return;
	end

	--local module = 'ConROC_' .. self.Classes[classId];
	--local _, _, _, loadable, reason = GetAddOnInfo(module);
	
	--if IsAddOnLoaded(module) then
		--self:EnableRotationModule();
		--self:EnableDefenseModule();
		--return;
	--end

	--if reason == 'MISSING' or reason == 'DISABLED' then
		--self:Print(self.Colors.Error .. 'Could not find class module ' .. module .. ', reason: ' .. reason);
		--return;
	--end

	--LoadAddOn(module)

	if select(2, UnitClass("player")) ~= ("DRUID" or "SHAMAN" or "PRIEST") then
	--if select(2, UnitClass("player")) ~= "SHAMAN" then return end
	--if select(2, UnitClass("player")) ~= "PRIEST" then return end
	self:EnableRotationModule();
	self:EnableDefenseModule();
	self:Print(self.Colors[classId] .. self.Description);

	self:Print(self.Colors.Info .. 'Finished Loading class module');
	self.ModuleLoaded = true;
	else return end
end

function ConROC:HealSpec() --Leftover from Retail.
	local _, _, classId = UnitClass('player');
	--local specId = GetSpecialization();
	--[[[1] = 'Warrior',
		[2] = 'Paladin',
		[3] = 'Hunter',
		[4] = 'Rogue',
		[5] = 'Priest',
		[6] = 'DeathKnight',
		[7] = 'Shaman',
		[8] = 'Mage',
		[9] = 'Warlock',
		[10] = 'Monk',
		[11] = 'Druid',
		[12] = 'DemonHunter',]]
		
--[[	if (classId == 2 and specId == 1) or
	(classId == 5 and specId == 2) or
	(classId == 7 and specId == 3) or
	(classId == 10 and specId == 2) or
	(classId == 11 and specId == 4)	then
		return true;
	end]] 
	return false;
end