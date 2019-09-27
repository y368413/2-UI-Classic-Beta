-------------------------------------Auther：NDui siweia
local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Maps")

local strmatch, strfind, strupper = string.match, string.find, string.upper
local select, pairs, ipairs, unpack = select, pairs, ipairs, unpack
local cr, cg, cb = I.r, I.g, I.b

function module:CreatePulse()
	if not MaoRUISettingDB["Map"]["CombatPulse"] then return end

	local MBG = M.CreateBG(Minimap, 1)
	M.CreateSD(MBG)
	local anim = MBG:CreateAnimationGroup()
	anim:SetLooping("BOUNCE")
	anim.fader = anim:CreateAnimation("Alpha")
	anim.fader:SetFromAlpha(.8)
	anim.fader:SetToAlpha(.2)
	anim.fader:SetDuration(1)
	anim.fader:SetSmoothing("OUT")

	local function updateMinimapAnim(event)
		if event == "PLAYER_REGEN_DISABLED" then
			MBG.Shadow:SetBackdropBorderColor(1, 0, 0)
			anim:Play()
		elseif not InCombatLockdown() then
			if MiniMapMailFrame:IsShown() then
				MBG.Shadow:SetBackdropBorderColor(1, 1, 0)
				anim:Play()
			else
				anim:Stop()
				MBG.Shadow:SetBackdropBorderColor(0, 0, 0)
			end
		end
	end
	M:RegisterEvent("PLAYER_REGEN_ENABLED", updateMinimapAnim)
	M:RegisterEvent("PLAYER_REGEN_DISABLED", updateMinimapAnim)
	M:RegisterEvent("UPDATE_PENDING_MAIL", updateMinimapAnim)

	MiniMapMailFrame:HookScript("OnHide", function()
		if InCombatLockdown() then return end
		anim:Stop()
		MBG.Shadow:SetBackdropBorderColor(0, 0, 0)
	end)
end

function module:ReskinRegions()
	-- Tracking icon
	MiniMapTrackingFrame:SetScale(.7)
	MiniMapTrackingFrame:ClearAllPoints()
	MiniMapTrackingFrame:SetPoint("BOTTOMLEFT", Minimap, 0, 5)
	MiniMapTrackingBorder:Hide()
	MiniMapTrackingIcon:SetTexCoord(unpack(I.TexCoord))
	local bg = M.CreateBG(MiniMapTrackingIcon)
	M.CreateBD(bg)
	bg:SetBackdropBorderColor(cr, cg, cb)

	-- Mail icon
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 6, -2)
	MiniMapMailIcon:SetTexture(I.mailTex)
	MiniMapMailBorder:Hide()
	--MiniMapMailIcon:SetSize(21, 21)
	--MiniMapMailIcon:SetVertexColor(1, 1, 0)
end



----------------------------------------------------------------------------	右键菜单--------------------------------------------------------------------------
--动作条样式
local SetMrbarMenuFrame = CreateFrame("Frame", "ClickMenu", UIParent, "UIDropDownMenuTemplate")
--local SetMrbarMenuFrame = MSA_DropDownMenu_Create("ClickMenu", UIParent)
local SetMrbarMicromenu = {  
    { text = "|cffff8800 ------------------------|r", notCheckable = true },
    { text = "           "..MAINMENU_BUTTON.."", isTitle = true, notCheckable = true},
    { text = "|cffff8800 ------------------------|r", notCheckable = true },
    { text = CHARACTER, icon = 'Interface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle',
        func = function() securecall(ToggleCharacter, 'PaperDollFrame') end, notCheckable = true},
    { text = SPELLBOOK, icon = 'Interface\\MINIMAP\\TRACKING\\Class',
        func = function() securecall(ToggleSpellBook, BOOKTYPE_SPELL) end, notCheckable = true},
    { text = TALENTS, icon = 'Interface\\MINIMAP\\TRACKING\\Ammunition',
        func = function() if (not PlayerTalentFrame) then LoadAddOn('Blizzard_TalentUI') end
        if (not GlyphFrame) then LoadAddOn('Blizzard_GlyphUI') end
        securecall(ToggleTalentFrame) end, notCheckable = true},
    { text = INVENTORY_TOOLTIP,  icon = 'Interface\\MINIMAP\\TRACKING\\Banker',
        func = function() securecall(ToggleAllBags) end, notCheckable = true},
    { text = ACHIEVEMENTS, icon = 'Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Shield',
        func = function() securecall(ToggleAchievementFrame) end, notCheckable = true},
    { text = QUEST_LOG, icon = 'Interface\\GossipFrame\\ActiveQuestIcon',
        func = function() ToggleQuestLog() end, notCheckable = true},
    { text = FRIENDS, icon = 'Interface\\FriendsFrame\\PlusManz-BattleNet',
        func = function() securecall(ToggleFriendsFrame, 1) end, notCheckable = true},
    { text = GUILD, icon = 'Interface\\GossipFrame\\TabardGossipIcon',
        func = function() if (IsTrialAccount()) then UIErrorsFrame:AddMessage(ERR_RESTRICTED_ACCOUNT, 1, 0, 0)
        else securecall(ToggleGuildFrame) end end, notCheckable = true},
    { text = GROUP_FINDER, icon = 'Interface\\LFGFRAME\\BattleNetWorking0',
        func = function() securecall(PVEFrame_ToggleFrame, 'GroupFinderFrame', LFDParentFrame) end, notCheckable = true},
    { text = ENCOUNTER_JOURNAL, icon = 'Interface\\MINIMAP\\TRACKING\\Profession',
        func = function() securecall(ToggleEncounterJournal) end, notCheckable = true},
    --{ text = PLAYER_V_PLAYER, icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster', --broke
	     --func = function() securecall(PVEFrame_ToggleFrame, 'PVPUIFrame', HonorFrame) end, notCheckable = true},
    --{ text = MOUNTS, icon = 'Interface\\MINIMAP\\TRACKING\\StableMaster',  --broke
	  --func = function() securecall(ToggleCollectionsJournal, 1) end, tooltipTitle = securecall(MicroButtonTooltipText, MOUNTS_AND_PETS, 'TOGGLEPETJOURNAL'), notCheckable = true},
   -- { text = PETS, icon = 'Interface\\MINIMAP\\TRACKING\\StableMaster',  --broke
	  --func = function() securecall(ToggleCollectionsJournal, 2) end, tooltipTitle = securecall(MicroButtonTooltipText, MOUNTS_AND_PETS, 'TOGGLEPETJOURNAL'), notCheckable = true},
    --{ text = TOY_BOX, icon = 'Interface\\MINIMAP\\TRACKING\\Reagents',  --broke 
	  --func = function() securecall(ToggleCollectionsJournal, 3) end, tooltipTitle = securecall(MicroButtonTooltipText, TOY_BOX, 'TOGGLETOYBOX'), notCheckable = true},
    --{ text = 'Heirlooms', icon = 'Interface\\MINIMAP\\TRACKING\\Reagents',  --broke
	  --func = function() securecall(ToggleCollectionsJournal, 4) end, tooltipTitle = securecall(MicroButtonTooltipText, TOY_BOX, 'TOGGLETOYBOX'), notCheckable = true},
    --{ text = "Calender",icon = 'Interface\\Calendar\\UI-Calendar-Button',  --broke 
         --func = function() LoadAddOn('Blizzard_Calendar') Calendar_Toggle() end, notCheckable = true},
    --{ text = BLIZZARD_STORE, icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster',
         --func = function() LoadAddOn('Blizzard_StoreUI') securecall(ToggleStoreUI) end, notCheckable = true},
    { text = GAMEMENU_HELP, icon = 'Interface\\CHATFRAME\\UI-ChatIcon-Blizz',
         func = function() securecall(ToggleHelpFrame) end, notCheckable = true},
    --{ text = BATTLEFIELD_MINIMAP,
         --func = function() securecall(ToggleBattlefieldMinimap) end, notCheckable = true},
    { text = "|cffff8800 ------------------------|r", notCheckable = true },
    { text = "           -|cFFFFFF00 2|r|cFFFF0000 UI |r- ", isTitle = true, notCheckable = true},
    { text = "|cffff8800 ------------------------|r", notCheckable = true },
    { text = MINIMAP_MENU_BARSTYLE,  icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster',
         func = function() sendCmd("/mr");  end, notCheckable = true},
    { text = MINIMAP_MENU_KEYBIND, icon = 'Interface\\MacroFrame\\MacroFrame-Icon.blp',
        func = function() sendCmd("/hb"); end, notCheckable = true},
    { text = "|cFF00DDFF ----- "..BINDING_NAME_MOVEANDSTEER.." -----|r", isTitle = true, notCheckable = true },
    { text = MINIMAP_MENU_SPECIALBUTTON, icon = 'Interface\\Icons\\INV_Inscription_RunescrollOfFortitude_Red',
        func = function() sendCmd("/moveit"); end, notCheckable = true},
    { text = MINIMAP_MENU_AURADIY, icon = 'Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Shield',
        func = function() sendCmd("/awc"); end, notCheckable = true},
    --{ text = MINIMAP_MENU_QUESTBUTTON, icon = 'Interface\\GossipFrame\\ActiveQuestIcon',
        --func = function() sendCmd("/eqb"); end, notCheckable = true},
    { text = MINIMAP_MENU_CASTBAR, icon = 'Interface\\Icons\\INV_Misc_Bone_HumanSkull_02',
        func = function() sendCmd("/cbs"); end, notCheckable = true},
    --{ text = "聊天屏蔽", icon = 'Interface\\Calendar\\UI-Calendar-Button',
        --func = function() sendCmd("/ecf"); end, notCheckable = true},
    { text = "|cFF00DDFF ------- "..MINIMAP_MENU_ONOFF.." -------|r", isTitle = true, notCheckable = true},
    { text = MINIMAP_MENU_DAMAGESTYLE, icon = 'Interface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle',
        func = function() sendCmd("/dex"); end, notCheckable = true },
    --{ text = MINIMAP_MENU_INTERRUPT, icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster',
        --func = function() sendCmd("/esi"); end, notCheckable = true},
    {text = MINIMAP_MENU_DISTANCE, hasArrow = true, notCheckable = true,
        menuList={  
            { text = YES, func = function() sendCmd("/hardyards sho") end, notCheckable = true},
            { text = NO, func = function() sendCmd("/hardyards hid") end, notCheckable = true}
        }
    },
    --{text = MINIMAP_MENU_COMBOPOINTS, hasArrow = true, notCheckable = true,
        --menuList={  
            --{ text = YES, func = function() sendCmd("/bht hiton") end, notCheckable = true},
            --{ text = NO, func = function() sendCmd("/bht hitoff") end, notCheckable = true}
        --}
    --},
    {text = MINIMAP_MENU_COMPAREITEMS, hasArrow = true, notCheckable = true,
        menuList={  
            { text = YES, func = function() sendCmd("/run SetCVar('alwaysCompareItems', 1)") end, notCheckable = true},
            { text = NO, func = function() sendCmd("/run SetCVar('alwaysCompareItems', 0)") end, notCheckable = true}
        }
    },
    { text = "|cFF00DDFF ------- Style -------|r", isTitle = true, notCheckable = true },
    { text = MINIMAP_MENU_SWITCHUF, icon = 'Interface\\Icons\\Spell_Holy_Crusade',
        func = function() sendCmd("/loadmr"); end, notCheckable = true},
    { text = MINIMAP_MENU_AFKSCREEN, icon = 'Interface\\Icons\\Spell_Nature_Sentinal',
        func = function() sendCmd("/wallpaperkit"); end, notCheckable = true},
    --{ text = MINIMAP_MENU_CHECKFOODSSS, icon = 'Interface\\MINIMAP\\TRACKING\\Reagents',
        --func = function() sendCmd("/hj"); end, notCheckable = true  },
    --{ text = "|cFF00DDFF -- OneKeyMacro --|r", func = function() sendCmd("/MacroHelp"); end, notCheckable = true},
    { text = "  |cFFBF00FFWe Love WOW|r", func = function() sendCmd("/welovewow"); end, notCheckable = true},
    { text = "|cffff8800 --------------------------|r", isTitle = true, notCheckable = true  },
    { text = "  |cFFBF00FF"..MINIMAP_MENU_QUSETIONANSWER.."|r", func = function() sendCmd("/MrHelp"); end, notCheckable = true},
    { text = "  |cFFBF00FF2 UI"..MINIMAP_MENU_UISETTING.."|r", func = function() sendCmd("/mr"); end, notCheckable = true},
    { text = "|cffff8800 --------------------------|r", isTitle = true, notCheckable = true  },
    { text = "            |cFFBF00FF"..MINIMAP_MENU_MORE.."|r", func = function() sendCmd("/cbs"); end, notCheckable = true},
    --{ text = "ESC菜单", func = function() ToggleFrame(GameMenuFrame) end, notCheckable = true},
    --{ text = "                       ", isTitle = true, notCheckable = true  },
    --{ text = LOGOUT, func = function() Logout() end, notCheckable = true},
    --{ text = QUIT, func = function() ForceQuit() end, notCheckable = true},
}


function module:WhoPingsMyMap()
	if not MaoRUISettingDB["Map"]["WhoPings"] then return end
	local f = CreateFrame("Frame", nil, Minimap)
	f:SetAllPoints()
	f.text = M.CreateFS(f, 14, "", false, "TOP", 0, -3)
	local anim = f:CreateAnimationGroup()
	anim:SetScript("OnPlay", function() f:SetAlpha(1) end)
	anim:SetScript("OnFinished", function() f:SetAlpha(0) end)
	anim.fader = anim:CreateAnimation("Alpha")
	anim.fader:SetFromAlpha(1)
	anim.fader:SetToAlpha(0)
	anim.fader:SetDuration(3)
	anim.fader:SetSmoothing("OUT")
	anim.fader:SetStartDelay(3)

	M:RegisterEvent("MINIMAP_PING", function(_, unit)
		anim:Stop()
		f.text:SetText(GetUnitName(unit))
		f.text:SetTextColor(M.ClassColor(select(2, UnitClass(unit))))
		anim:Play()
	end)
end

function module:ShowMinimapClock()
	if MaoRUISettingDB["Map"]["Clock"] then
		if not TimeManagerClockButton then LoadAddOn("Blizzard_TimeManager") end
		if not TimeManagerClockButton.styled then
			TimeManagerClockButton:DisableDrawLayer("BORDER")
			TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -8)
			TimeManagerClockTicker:SetFont(unpack(I.Font))
			TimeManagerClockTicker:SetTextColor(1, 1, 1)

			TimeManagerClockButton.styled = true
		end
		TimeManagerClockButton:Show()
	else
		if TimeManagerClockButton then TimeManagerClockButton:Hide() end
	end
end

function module:SetupMinimap()
	-- Shape and Position
	--local scale = MaoRUISettingDB["Map"]["MinmapScale"]
	Minimap:ClearAllPoints()
	Minimap:SetPoint(unpack(R.Minimap.Pos))
	Minimap:SetSize(186, 186)
	Minimap:SetFrameLevel(10)
	Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8X8")
	DropDownList1:SetClampedToScreen(true)

	local mover = M.Mover(Minimap, U["Minimap"], "Minimap", R.Minimap.Pos, Minimap:GetWidth(), Minimap:GetHeight())
	Minimap:ClearAllPoints()
	Minimap:SetPoint("TOPRIGHT", mover)

	--self:UpdateMinimapScale()
	self:ShowMinimapClock()

	-- Mousewheel Zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(_, zoom)
		if zoom > 0 then
			Minimap_ZoomIn()
		else
			Minimap_ZoomOut()
		end
	end)

	-- Click Func
	Minimap:SetScript("OnMouseUp", function(self, btn)
    if btn == "LeftButton" then 
     if IsAltKeyDown() then ToggleFrame(WorldMapFrame) --Alt+鼠标左键点击显示大地图
     elseif IsShiftKeyDown() then ToggleBattlefieldMinimap() --Shift+鼠标左键显示战场小地图
     elseif IsControlKeyDown() then ToggleFrame(ObjectiveTrackerFrame) --Ctrl+鼠标左键显示任务
     else Minimap_OnClick(self) --鼠标左键点击小地图显示Ping位置提示
     end
    elseif btn == "MiddleButton" then ToggleFrame(ObjectiveTrackerFrame)  --M:DropDown(MapMicromenu, MapMenuFrame, 0, 0) --鼠标中键显示系统菜单
    elseif btn == "RightButton" then EasyMenu(SetMrbarMicromenu, SetMrbarMenuFrame, "cursor", 0, 0, "MENU", 2) --鼠标右键显示增强菜单
    --else MSA_ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self)
    end
	end)
	
	-- Hide Blizz
	local frames = {
		"MinimapBorderTop",
		"MinimapNorthTag",
		"MinimapBorder",
		"MinimapZoneTextButton",
		"MinimapZoomOut",
		"MinimapZoomIn",
		"MiniMapWorldMapButton",
		"MiniMapMailBorder",
		--"MiniMapTracking",
	}

	for _, v in pairs(frames) do
		M.HideObject(_G[v])
	end
	MinimapCluster:EnableMouse(false)

	-- Add Elements
	self:ReskinRegions()
	self:WhoPingsMyMap()
end
