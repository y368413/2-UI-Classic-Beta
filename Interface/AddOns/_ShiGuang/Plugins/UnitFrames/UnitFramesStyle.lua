  PlayerFrame:ClearAllPoints() PlayerFrame:SetPoint("RIGHT",UIParent,"CENTER", -150, -250) PlayerFrame:SetUserPlaced(true)  --PlayerFrame:SetScale(0.8) 
  TargetFrame:ClearAllPoints() TargetFrame:SetPoint("LEFT",UIParent,"CENTER", 150, -250) TargetFrame:SetUserPlaced(true)  --TargetFrame:SetScale(0.8) 
  PartyMemberFrame1:ClearAllPoints() PartyMemberFrame1:SetPoint("TOPLEFT", 260, -143) PartyMemberFrame1:SetUserPlaced(true)
  PartyMemberFrame1:SetScript("OnMouseDown", function() --按shift移动小队
		if (IsShiftKeyDown()) then PartyMemberFrame1:ClearAllPoints() PartyMemberFrame1:StartMoving() end
  end)
  PartyMemberFrame1:SetScript("OnMouseUp", function()
		PartyMemberFrame1:StopMovingOrSizing()
  end)
  TargetFrameToT:ClearAllPoints() TargetFrameToT:SetPoint("LEFT",TargetFrame,"BOTTOMRIGHT", -43, 21)
  TargetFrameToTTextureFrameName:ClearAllPoints() TargetFrameToTTextureFrameName:SetPoint("LEFT",TargetFrameToT,"Top", -8, -43)
  PetFrameHealthBarText:SetPoint("BOTTOMRIGHT", PetFrame, "LEFT", 3,-6)  
  PetFrameManaBarText:SetPoint("TOPRIGHT", PetFrame, "LEFT", 3, -6)
  PetFrameManaBarText:SetTextColor(0, 1, 1)

------------------------------------------Class icon---------------------------------------
hooksecurefunc("UnitFramePortrait_Update",function(self) 
   if not MaoRUISettingDB["UFs"]["UFClassIcon"] then return end
        if self.portrait then 
                if UnitIsPlayer(self.unit) then                 
                        if CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))] then 
                                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles") 
                                self.portrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))])) 
                        end 
                else 
                        self.portrait:SetTexCoord(0,1,0,1) 
                end 
        end 
end)

-----------------------------------------	     隐藏头像动态伤害      -----------------------------------------
local p=PlayerHitIndicator;p.Show=p.Hide;p:Hide() 
local p=PetHitIndicator;p.Show=p.Hide;p:Hide() 

-------------------------------	  目标种族、职业和其它信息   ----------------------------------------
TargetFrame:CreateFontString("TargetFrameType", "OVERLAY", "GameFontNormalSmall")
TargetFrameType:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -43, -8)
TargetFrameType:SetTextColor(1, 0.75, 0)
TargetFrame:CreateFontString("TargetFrameRace", "OVERLAY", "GameFontNormalSmall")
TargetFrameRace:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -43, 3)
TargetFrameRace:SetTextColor(1, 0.75, 0)
hooksecurefunc("TargetFrame_Update", function(self)
  if not UnitExists(self.unit) then return end
	local typeText = ""
	local raceText = ""
    --self.nameBackground:SetAlpha(UnitIsPlayer(unit) and 0.2 or 1.0)
		if UnitIsPlayer("target") then
			raceText = UnitRace("target")
			TargetFrameRace:SetTextColor(NORMAL_FONT_COLOR.r,NORMAL_FONT_COLOR.g,NORMAL_FONT_COLOR.b)
		else
			typeText = UnitCreatureType("target") or ""
			if typeText == "非战斗宠物" or typeText == "未指定" or typeText == "小动物" then
				typeText = ""
			elseif typeText ~= "" then
				typeText = string.sub(typeText, 1, 16)
			end
		end
	TargetFrameType:SetText(typeText)
	TargetFrameRace:SetText(raceText)
end)
	
------------------------------------------------------------------------------- TargetClassButton by 狂飙@cwdg(networm@qq.com) 20120119 DIY by y368413 
-- Binding Variables
BINDING_NAME_INSPECT = "    "..INSPECT
BINDING_NAME_TRADE = "    "..TRADE
BINDING_NAME_WHISPER = "    "..WHISPER
BINDING_NAME_FOLLOW = "    "..FOLLOW
--BINDING_NAME_COMPARE_ACHIEVEMENTS = COMPARE_ACHIEVEMENTS
BINDING_NAME_Invite = "    "..CALENDAR_INVITE_PLAYER 

local targeticon = CreateFrame("Button", "TargetClass", TargetFrame)
targeticon:Hide()
targeticon:SetWidth(28)
targeticon:SetHeight(28)
targeticon:SetPoint("TOP", TargetFrame, "TOPRIGHT", -100, -8)
targeticon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
local bg = targeticon:CreateTexture("TargetClassBackground", "BACKGROUND")
bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
bg:SetWidth(28)
bg:SetHeight(28)
bg:SetPoint("CENTER")
bg:SetVertexColor(0, 0, 0, 0.7)
local icon = targeticon:CreateTexture("TargetClassIcon", "ARTWORK")
icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
icon:SetWidth(21)
icon:SetHeight(21)
icon:SetPoint("CENTER")
RaiseFrameLevel(targeticon)
targeticon:SetScript("OnUpdate", function(self)
	if (not UnitCanAttack("player","target") and UnitIsPlayer("target") and CheckInteractDistance("target",1)) then
		targeticon:Enable()
		SetDesaturation(TargetClassIcon, false) 	--	TargetClassIcon:SetDesaturated(false)
	else
		targeticon:Disable()
		SetDesaturation(TargetClassIcon, true)	--	TargetClassIcon:SetDesaturated(true)
	end
end)
targeticon:SetScript("OnMouseDown", function(self, button)
	if (not UnitCanAttack("player","target") and UnitIsPlayer("target")) then
		if button == "LeftButton" then
			if CheckInteractDistance("target",1) then InspectUnit("target") end
		elseif button == "RightButton" then
			if CheckInteractDistance("target",2) then InitiateTrade("target") end
		elseif button == "MiddleButton" then  --	StartDuel("target")
				local server = nil;
				local name, server = UnitName("target");
				local fullname = name;			
				if server then  --if ( server and (not "target" or not UnitIsSameServer("player", "target")) ) then
					fullname = name.."-"..server;
				end
				ChatFrame_SendTell(fullname)
		elseif button == "Button4" then
			if CheckInteractDistance("target",4) then FollowUnit(fullname, 1); end
		else
			if CheckInteractDistance("target",1) then InspectAchievements("target") end
		end
	end
end)
hooksecurefunc("TargetFrame_Update", function()
	if UnitIsPlayer("target") then
		TargetClassIcon:SetTexCoord(unpack(CLASS_ICON_TCOORDS[select(2, UnitClass("target"))]))
		targeticon:Show()
	else
		targeticon:Hide()
	end
end)
--[[hooksecurefunc("ActionButton_UpdateCount", function(actionButton)
    local text = actionButton.Count
    local action = actionButton.action
    if not IsItemAction(action) and GetActionCount(action) > 0 then
        local count = GetActionCount(action)
        if ( count > (actionButton.maxDisplayCount or 9999 ) ) then
            text:SetText("*")
        else
            text:SetText(count)
            -- print(GetActionInfo(action))
        end
    end
end)]]