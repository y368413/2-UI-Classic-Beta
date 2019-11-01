-- ////// ## Author: solariz.de  ## Version: 2.06

function SQS_UpdateButtonDisplay()
	-- called to update the buttons if skill is castable / available or not
	-- local forms = GetNumShapeshiftForms(); --nope, only give me amount not the real IDs
	local forms = 5
	for i=1, forms do
		texture = GetShapeshiftFormInfo(i);
		if( texture == nil ) then
			if i == 1 then SQS_BTN_1:Hide(); 
			elseif i == 2 then SQS_BTN_2:Hide(); 
			elseif i == 3 then SQS_BTN_3:Hide(); 
			elseif i == 4 then SQS_BTN_4:Hide(); 
			elseif i == 5 then SQS_BTN_5:Hide(); 
			end;
		else
			if i == 1 then 
				SQS_BTN_1:Show();
				SQS_BTN_1.Texture:SetDesaturated(SQS_CheckNoMana(i))
			elseif i == 2 then 
				SQS_BTN_2:Show();
				SQS_BTN_2.Texture:SetDesaturated(SQS_CheckNoMana(i));
			elseif i == 3 then 
				SQS_BTN_3:Show();
				SQS_BTN_3.Texture:SetDesaturated(SQS_CheckNoMana(i));
			elseif i == 4 then 
				SQS_BTN_4:Show(); 
				SQS_BTN_4.Texture:SetDesaturated(SQS_CheckNoMana(i));
			elseif i == 5 then 
				SQS_BTN_5:Show(); 
				SQS_BTN_5.Texture:SetDesaturated(SQS_CheckNoMana(i));
			end;
		end
	end
	-- check GCD Function for casting or Global Cooldown
	-- If so show the warning
	--if SQS.GCD == true then
		if SQS_IsGlobalCooldown() == true then
			solQuickShifterFrameGCD:Show()
		else 
			solQuickShifterFrameGCD:Hide()
		end
	--end

	-- Mounted Check
	if IsMounted() then
		SQS_BTN_9:Hide();
		SQS_BTN_10:Show();
	else
		local MountExists, _ =  SQS_GetMountName()
		if GetShapeshiftForm() == 0 and MountExists then
			-- not Mounted and in Humanoid form 
			SQS_BTN_9:Hide();
			SQS_BTN_10:Show();	
		else
			-- not Monunted but shapeshifted
			SQS_BTN_9:Show();
			SQS_BTN_10:Hide();
		end
	end
end

function SQS_CheckNoMana(FormNum)
	-- checking if the spell is actually castable atm
	-- we return true if NOT and false if. sounds weird
	-- but I use that for the desaturate function, see in calling 
	-- function SQS_UpdateButtonDisplay
	local SpellName, usable, nomana;
	if FormNum == 1 then 
		-- exception here because we have bear and dire bear
		usable, nomana = IsUsableSpell(L["SQS_1_BEAR"]);
		if nomana == true then 
			return true
		end
		usable, nomana = IsUsableSpell(L["SQS_1_DIREBEAR"]);
		if nomana == true then 
			return true
		end
	end
		
	-- now the others
	if FormNum == 2 then SpellName = L["SQS_2_AQUATIC"]
	elseif FormNum == 3 then SpellName = L["SQS_3_CAT"]
	elseif FormNum == 4 then SpellName = L["SQS_4_TRAVEL"]
	elseif FormNum == 5 then SpellName = L["SQS_5_MOONKIN"]
	end

	-- check
	usable, nomana = IsUsableSpell(SpellName);
	if nomana == true then 
		return true
	end

	-- no break? we assume is usable
	return false
end

function SQS_CreateButton(FormNum)
	Button = CreateFrame("Button", "SQS_BTN_"..FormNum, solQuickShifterFrame, "SecureActionButtonTemplate");
	Button:SetWidth(32);
	Button:SetHeight(32);
	Button:SetID(FormNum);

	-- Position of the button based on the Form
	if FormNum == 1 then
		-- bear
		Button:SetPoint("RIGHT")
	elseif FormNum == 2 then
		-- aqua
		Button:SetPoint("BOTTOMRIGHT", -16, 1)
	elseif FormNum == 3 then
		-- cat
		Button:SetPoint("LEFT")
	elseif FormNum == 4 then
		-- Travel
		Button:SetPoint("TOP")
	elseif FormNum == 5 then
		-- moonkin
		Button:SetPoint("BOTTOMLEFT", 16, 1)
	elseif FormNum == 9 then
		-- cancel form
		Button:SetPoint("CENTER")
	elseif FormNum == 10 then
		-- cancel mount
		Button:SetPoint("CENTER")		
	end
	Button.Texture = Button:CreateTexture(Button:GetName().."NormalTexture", "ARTWORK");
	Button.Texture:SetTexture(SQS_GetDefaultIcon(FormNum));
	Button.Texture:SetAllPoints();
	Button:RegisterForClicks("LeftButtonUp","RightButtonUp");
	Button:SetScript("OnEnter", function(self, ...)
		self.Texture:ClearAllPoints();
		self.Texture:SetTexture(SQS_GetHoverIcon(FormNum));
		self.Texture:SetPoint("TOPLEFT", -5, 5);
		self.Texture:SetPoint("BOTTOMRIGHT", 5, -5);
	end);
	Button:SetScript("OnLeave", function(self, ...)
		self.Texture:SetAllPoints();
		self.Texture:SetTexture(SQS_GetDefaultIcon(FormNum));
	end);
	-- using macro workaround, thanks bliz classic != classic, old function CastShapeshiftForm() is forbidden now :(
	-- this is specially shitty because all the stance/form names are translated to the client language
	-- so you cant just use a /cast cat form. Each language this "cat form" is different. In German it would be:
	-- /wirken Katzengestalt; luckily you can use /use and only need to translate the form name :(
	Button:SetAttribute("type","macro")
	Button:SetAttribute("macrotext",SQS_GetMacro(FormNum))
end

function SQS_UpdateButton(UpdateButton,FormNum)
	UpdateButton:SetAttribute("macrotext",SQS_GetMacro(FormNum))
	UpdateButton.Texture:SetTexture(SQS_GetDefaultIcon(FormNum));
	UpdateButton:SetScript("OnEnter", function(self, ...)
		self.Texture:ClearAllPoints();
		self.Texture:SetTexture(SQS_GetHoverIcon(FormNum));
		self.Texture:SetPoint("TOPLEFT", -5, 5);
		self.Texture:SetPoint("BOTTOMRIGHT", 5, -5);
	end);
	UpdateButton:SetScript("OnLeave", function(self, ...)
		self.Texture:SetAllPoints();
		self.Texture:SetTexture(SQS_GetDefaultIcon(FormNum));
	end);
end


function SQS_GetHoverIcon(FormNum)
	-- retun a icon for each form button hover
	if FormNum == 1 then
		return "interface\\icons\\ability_hunter_pet_bear"
	elseif FormNum == 2 then
		return "interface\\icons\\spell_shadow_demonbreath"
	elseif FormNum == 3 then
		return "interface\\icons\\ability_druid_rake"
	elseif FormNum == 4 then
		return "interface\\icons\\inv_misc_head_tiger_01"
	elseif FormNum == 5 then
		return "interface\\icons\\inv_misc_monstertail_01"
	elseif FormNum == 9 then
		return "interface\\icons\\Spell_nature_wispsplode"
	elseif FormNum == 10 then
		return "interface\\icons\\inv_boots_03"		
	end
end

function SQS_GetDefaultIcon(FormNum)
	-- retun a icon for each form button hover
	if FormNum == 1 then
		return "interface\\icons\\ability_racial_bearform"
	elseif FormNum == 2 then
		return "interface\\icons\\ability_druid_aquaticform"
	elseif FormNum == 3 then
		return "interface\\icons\\ability_druid_catform"
	elseif FormNum == 4 then
		return "interface\\icons\\ability_druid_travelform"
	elseif FormNum == 5 then
		return "interface\\icons\\spell_nature_forceofnature"
	elseif FormNum == 9 then
		return "interface\\icons\\spell_frost_wisp"
	elseif FormNum == 10 then
		-- check if we found a mount
		local MountName, MountTexture = SQS_GetMountName()
		if MountTexture then 
			return MountTexture
		else 
			return "interface\\icons\\ability_hunter_beastcall"		
		end
	end
end

function SQS_GetMacro(FormNum)
	-- retun the Macro to cast for each form
	
	local PowerShiftMacro = ""
	--if SQS.PWRSHIFT ~= true then
		PowerShiftMacro = " [noform:"..FormNum.."]"
	--end

	if FormNum == 1 then
		return "#showtooltip\n/dismount [mounted]\n/cancelform"..PowerShiftMacro.."\n/use [noform:"..FormNum.."] !"..L["SQS_1_DIREBEAR"].."\n/use [noform:"..FormNum.."]"..L["SQS_1_BEAR"]
	elseif FormNum == 2 then
		return "/dismount [mounted]\n/cancelform"..PowerShiftMacro.."\n/use [noform:"..FormNum..",swimming] !"..L["SQS_2_AQUATIC"]
	elseif FormNum == 3 then
		return "/dismount [mounted]\n/cancelform"..PowerShiftMacro.."\n/use [noform:"..FormNum.."] !"..L["SQS_3_CAT"]
	elseif FormNum == 4 then
		return "/dismount [mounted]\n/cancelform"..PowerShiftMacro.."\n/use [noform:"..FormNum.."] !"..L["SQS_4_TRAVEL"]
	elseif FormNum == 5 then
		return "/dismount [mounted]\n/cancelform"..PowerShiftMacro.."\n/use [noform:"..FormNum.."] !"..L["SQS_5_MOONKIN"]
	elseif FormNum == 10 then
		local MountName, _ = SQS_GetMountName()
		if MountName then
			return "/dismount [mounted]\n/cast [nomounted] "..MountName.."\n/cancelform"
		else 
			return "/dismount [mounted]\n/cancelform"
		end
	else
		return "/cancelform"
	end
end

function SQS_IsGlobalCooldown()
	-- 61304 is the 'Global Cooldown' spell
	local _, duration = GetSpellCooldown(61304)
	local spell, _ = CastingInfo("player")
 
	-- Check for duration left
	if duration > 0 or spell ~= nil then
		return true
	end
	return false
end
-- function to get the players mount
-- returns: { <string>mount name, <int> Mount Icon, <int> timestamp when found }
function SQS_GetMountName()
	-- if Option to DISABLE Mount Feature is checked quit here
	--if SQS.disableMount == true then return false end
	-- Check if Player reached Level 40, if not we do not need to continue further
	if UnitLevel("player") < 40 then
		return false
	end
	-- maybe we found it previously?
	if SQS_MOUNT ~= nil and #SQS_MOUNT > 0 then
		-- we use a timestamp to cache a bit, if the last check time is > 60s we check again
		-- if not we return what we last found. This prevents going through all bag items
		-- on every event call.
		local SecAgo = time()-SQS_MOUNT[3]
		-- cache 5 min
		if SecAgo <= 300 then
			return SQS_MOUNT[1], SQS_MOUNT[2]
		end
	end

	-- not checking if player is in Fight
	if UnitAffectingCombat("player") then
		if SQS_MOUNT ~= nil and #SQS_MOUNT > 0 then
			return SQS_MOUNT[1], SQS_MOUNT[2]
		else
			return false
		end
	end

	-- parsing the players bags for a mount
	for b=0,4 do
		for s=1,GetContainerNumSlots(b) do
			a=GetContainerItemLink(b,s)if a then
				if string.find(a,L["SQS_MOUNT_HORN"]) or
				   string.find(a,L["SQS_MOUNT_WHISTLE"]) or
				   string.find(a,L["SQS_MOUNT_REINS"]) or
				   string.find(a,L["SQS_MOUNT_KODO_1"]) or
				   string.find(a,L["SQS_MOUNT_KODO_2"]) or
				   string.find(a,L["SQS_MOUNT_KODO_3"]) or
				   string.find(a,L["SQS_MOUNT_KODO_4"])	   
				 then
					local MountName, _, _, ItemLevel, _, _, _, _, _, ItemTexture = GetItemInfo(GetContainerItemID(b,s));
					-- double check that it is a lvl 40+ Item to be sure to have a mount
					if ItemLevel >= 40 then
						-- set texture of Button 10
						SQS_MOUNT = {MountName, ItemTexture, time()}
						-- updating button for mounting
						SQS_UpdateButton(SQS_BTN_10, 10)
						return MountName, ItemTexture
					end
				end
			end
		end
	end
	-- seems no mount was found
	return false
end
BINDING_HEADER_solQuickShifter = "solQuickShifter"
_G["BINDING_NAME_CLICK solQuickShifter:LeftButton"] = "    Show Shift Selection (hold key)"

SQS_MOUNT = {}
-- ////// MAIN
L = {}
if (GetLocale() == 'zhCN') then
	L["SQS_1_BEAR"] = "熊形态"
	L["SQS_1_DIREBEAR"] = "巨熊形态"
	L["SQS_2_AQUATIC"] = "水栖形态"
	L["SQS_3_CAT"] = "猎豹形态"
	L["SQS_4_TRAVEL"] = "旅行形态"
	L["SQS_5_MOONKIN"] = "枭兽形态"
	L["SQS_MOUNT_KODO_1"] = "灰色科多兽"
	L["SQS_MOUNT_KODO_2"] = "棕色科多兽"
	L["SQS_MOUNT_KODO_3"] = "大型白色科多兽"
	L["SQS_MOUNT_KODO_4"] = "金色科多兽"
	L["SQS_MOUNT_REINS"] = "缰绳"
	L["SQS_MOUNT_HORN"] = "号角"
	L["SQS_MOUNT_WHISTLE"] = "之哨"
else
	L["SQS_1_BEAR"] = "Bear Form"
	L["SQS_1_DIREBEAR"] = "Dire Bear Form"
	L["SQS_2_AQUATIC"] = "Aquatic Form"
	L["SQS_3_CAT"] = "Cat Form"
	L["SQS_4_TRAVEL"] = "Travel Form"
	L["SQS_5_MOONKIN"] = "Moonkin Form"
	L["SQS_MOUNT_KODO_1"] = "Gray Kodo"
	L["SQS_MOUNT_KODO_2"] = "Brown Kodo"
	L["SQS_MOUNT_KODO_3"] = "White Kodo"
	L["SQS_MOUNT_KODO_4"] = "Golden Kodo"	
	L["SQS_MOUNT_REINS"] = "Reins of"
	L["SQS_MOUNT_HORN"] = "Horn of"
	L["SQS_MOUNT_WHISTLE"] = "Whistle of"
end

-- Creating the Fram where our Buttons live in
     	solQuickShifterFrame=CreateFrame("Frame","solQuickShifterFrame",UIParent)
		solQuickShifterFrame:SetClampedToScreen( true )
		solQuickShifterFrame:SetMovable(true)
		solQuickShifterFrame:EnableMouse(true)
		solQuickShifterFrame:SetSize(100,100)
		solQuickShifterFrame:SetScale(1.0)
		solQuickShifterFrame:Hide()
		-- Warning Global Cooldown / Casting
		solQuickShifterFrameGCD = solQuickShifterFrame:CreateFontString("$parentTitleOptions", "ARTWORK", "GameFontNormalSmall");
		solQuickShifterFrameGCD:SetPoint("TOPLEFT", solQuickShifterFrame, "BOTTOMLEFT", -20, -2);
		solQuickShifterFrameGCD:SetText("* Casting / Global Cooldown *");
		solQuickShifterFrameGCD:Hide()

-- register events
	solQuickShifterFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	solQuickShifterFrame:RegisterEvent("UNIT_POWER_UPDATE")
	solQuickShifterFrame:RegisterEvent("ADDON_LOADED")
	solQuickShifterFrame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
	solQuickShifterFrame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
	solQuickShifterFrame:RegisterEvent("BAG_UPDATE")	

	solQuickShifterFrame:SetScript("OnEvent", function(self, event, arg1, ...)
		if event == "ADDON_LOADED" and arg1 == "_ShiGuang" then
			SQS_CreateButton(1); -- Bear/Dire Bear Form
			SQS_CreateButton(2); -- Aquatic Form
			SQS_CreateButton(3); -- Cat Form
			SQS_CreateButton(4); -- Travel Form
			SQS_CreateButton(5); -- Moonkin Form
			SQS_CreateButton(9); -- cancel form
			SQS_CreateButton(10); -- unmount
		else
			--if type(SQS) then
				if event == "BAG_UPDATE" then
					-- this is for the mount Info, we're just resetting the Cache here
					SQS_MOUNT[3] = time()-3600
				else
					SQS_UpdateButtonDisplay()
				end
			--end
		end
	end)

local 	t=solQuickShifterFrame:CreateTexture(nil,"ARTWORK")
		t:SetAllPoints(solQuickShifterFrame)



--SQS_UpdateButtonDisplay()

-- activation when pressing hotkey
local	toggleframe = CreateFrame("Button","solQuickShifter",UIParent,"SecureHandlerClickTemplate")
		toggleframe:RegisterEvent("PLAYER_TARGET_CHANGED")
		toggleframe:RegisterForClicks("AnyUp", "AnyDown")
		toggleframe:SetFrameRef("ParentFrame",solQuickShifterFrame)
		toggleframe:SetAttribute("_onclick",[[
			ParentFrame = self:GetFrameRef("ParentFrame")
			if down then
				ParentFrame:SetPoint("CENTER","$cursor")
				ParentFrame:Show()
			else
				ParentFrame:Hide()
			end
		]])