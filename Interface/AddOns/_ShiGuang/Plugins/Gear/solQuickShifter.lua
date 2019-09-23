-- ////// ## Author: solariz.de  ## Version: 2.0

function SQS_GetLocalization()
  local L = {}
  local Lmeta = {}
  Lmeta.__newindex = function(t, k, v)
    if v == true then -- allow for the shorter L["Foo bar"] = true
      v = k
    end
    rawset(t, k, v)
  end
  Lmeta.__index = function(t, k)
    self:Debug(1, "Localization not found for %", k)
    rawset(t, k, k) -- cache it
    return k
  end
  setmetatable(L, Lmeta)
  return L
end

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
			if i == 1 then SQS_BTN_1:Show(); 
			elseif i == 2 then SQS_BTN_2:Show(); 
			elseif i == 3 then SQS_BTN_3:Show();
			elseif i == 4 then SQS_BTN_4:Show(); 
			elseif i == 5 then SQS_BTN_5:Show(); 
			end;
		end
	end
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
	-- /wirken Katengestalt; luckily you can use /use and only need to translate the form name :(
	Button:SetAttribute("type","macro")
	Button:SetAttribute("macrotext",SQS_GetMacro(FormNum))
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
	end
end

function SQS_GetMacro(FormNum)
	-- retun the Macro to cast for each form
	-- TODO: Language Handling
	if FormNum == 1 then
		return "/use [noform:"..FormNum.."] !"..L["SQS_1_BEAR"]
	elseif FormNum == 2 then
		return "/use [noform:"..FormNum..",swimming] !"..L["SQS_2_AQUATIC"]
	elseif FormNum == 3 then
		return "/use [noform:"..FormNum.."] !"..L["SQS_3_CAT"]
	elseif FormNum == 4 then
		return "/use [noform:"..FormNum.."] !"..L["SQS_4_TRAVEL"]
	elseif FormNum == 5 then
		return "/use [noform:"..FormNum.."] !"..L["SQS_5_MOONKIN"]
	else
		return "/cancelform"
	end
end

 
BINDING_HEADER_solQuickShifter = "solQuickShifter"
_G["BINDING_NAME_CLICK solQuickShifter:LeftButton"] = "    Show Shift Selection (hold key)"

-- ////// MAIN
L = {}
if (GetLocale() == 'deDE') then
	L["SQS_1_BEAR"] = "Bärengestalt"
	L["SQS_2_AQUATIC"] = "Wassergestalt"
	L["SQS_3_CAT"] = "Katzengestalt"
	L["SQS_4_TRAVEL"] = "Reisegestalt"
	L["SQS_5_MOONKIN"] = "Moonkingestalt"
else
	L["SQS_1_BEAR"] = "Bear Form"
	L["SQS_2_AQUATIC"] = "Aquatic Form"
	L["SQS_3_CAT"] = "Cat Form"
	L["SQS_4_TRAVEL"] = "Travel Form"
	L["SQS_5_MOONKIN"] = "Moonkin Form"
end


-- Creating the Fram where our Buttons live in
local 	solQuickShifterFrame=CreateFrame("Frame","solQuickShifterFrame",UIParent)
		solQuickShifterFrame:SetClampedToScreen( true )
		solQuickShifterFrame:SetMovable(true)
		solQuickShifterFrame:EnableMouse(true)
		solQuickShifterFrame:SetSize(100,100)
		solQuickShifterFrame:SetScale(1.0)
		solQuickShifterFrame:Hide()

-- register events
	solQuickShifterFrame:RegisterEvent("PORTRAITS_UPDATED")
	solQuickShifterFrame:SetScript("OnEvent", function(self, event, ...)
 		SQS_UpdateButtonDisplay()
	end)


local 	t=solQuickShifterFrame:CreateTexture(nil,"ARTWORK")
		t:SetAllPoints(solQuickShifterFrame)


SQS_CreateButton(1); -- Bear/Dire Bear Form
SQS_CreateButton(2); -- Aquatic Form
SQS_CreateButton(3); -- Cat Form
SQS_CreateButton(4); -- Travel Form
SQS_CreateButton(5); -- Moonkin Form
SQS_CreateButton(9); -- cancel form
SQS_UpdateButtonDisplay()

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