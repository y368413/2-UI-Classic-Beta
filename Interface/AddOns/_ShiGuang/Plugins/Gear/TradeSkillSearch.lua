-------------------------------------------------------------------------------
-- TradeSkillSearch  ## Version: 7  ## Author: glitschen
-------------------------------------------------------------------------------

TradeSkillSearch = {}
local TSS = {}
TSS.x = 80
TSS.y = -50
TSS.w = 210
TSS.h = 21
TSS.rowHeight = 16

local function SearchTradeSkillsInner(s)
	-- Search tradeskill list for first match.
	for i=1,GetNumTradeSkills() do
		local skillName, skillType, numAvailable, isExpanded, altVerb, numSkillUps, indentLevel, showProgressBar, currentRank, maxRank, startingRank = GetTradeSkillInfo(i)
		if not (skillType == "header" or skillType == "subheader") then
			skillName = skillName:lower()
			if skillName:find(s, 1, true) ~= nil then
				--SelectTradeSkill(i)
				TradeSkillListScrollFrameScrollBar:SetValue((i-1) * TSS.rowHeight) 
				--TradeSkillListScrollFrame.offset = i - 1
				TradeSkillFrame_SetSelection(i)
				--TradeSkillFrame_Update()
				return
			end
		end
	end
end
local function SearchTradeSkills()
	local s = TSSTradeSkillSearchBox:GetText():lower()
	SearchTradeSkillsInner(s)
	if s == "" then
		TradeSkillListScrollFrameScrollBar:SetValue(0) 
	end
	TradeSkillFrame_Update()
end

local function SearchCraftsInner(s)
	-- Search craft list for first match.
	for i=1,GetNumCrafts() do
		local craftName, craftSubSpellName, craftType, numAvailable, isExpanded, trainingPointCost, requiredLevel = GetCraftInfo(i)
		if not (craftType == "header" or craftType == "subheader") then
			craftName = craftName:lower()
			if craftName:find(s, 1, true) ~= nil then
				--SelectCraft(i)
				CraftListScrollFrameScrollBar:SetValue((i-1) * TSS.rowHeight) 
				CraftFrame_SetSelection(i)
				--CraftFrame_Update()
				return
			end
		end
	end
end
local function SearchCrafts()
	local s = TSSCraftSearchBox:GetText():lower()
	SearchCraftsInner(s)
	if s == "" then
		CraftListScrollFrameScrollBar:SetValue(0) 
	end
	CraftFrame_Update()
end

local function SetupTradeSkillWidgets()
	-- Create label
	local f = CreateFrame("Frame", "TSSTradeSkillSearchFrame", TradeSkillFrame)
	local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	text:SetPoint("LEFT")
	text:SetText(SEARCH..":")
	f:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", TSS.x - 7, TSS.y)
	f:SetSize(TSS.w, TSS.h)
	-- Create search box
	local f = CreateFrame("EditBox", "TSSTradeSkillSearchBox", TradeSkillFrame, "InputBoxTemplate")
	f:SetFrameLevel(4)
	f:SetPoint("CENTER")
	f:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", TSS.x + text:GetWidth(), TSS.y)
	f:SetSize(TSS.w, TSS.h)
	f:SetAutoFocus(false)
	-- Search when editbox contents change
	f:HookScript("OnTextChanged", SearchTradeSkills)
	-- Or when tradeskill window first appears
	TradeSkillFrame:HookScript("OnShow", SearchTradeSkills)
	f:SetScript("OnEnterPressed", function(self)
		f:ClearFocus()
	end)
	f:SetScript("OnEscapePressed", function(self)
		f:SetText("")
		f:ClearFocus()
	end)
end

local function SetupCraftWidgets()
	-- Create label
	local f = CreateFrame("Frame", "TSSCraftSearchFrame", CraftFrame)
	local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	text:SetPoint("LEFT")
	text:SetText("Search:")
	f:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", TSS.x - 7, TSS.y)
	f:SetSize(TSS.w, TSS.h)
	-- Create search box
	local f = CreateFrame("EditBox", "TSSCraftSearchBox", CraftFrame, "InputBoxTemplate")
	f:SetFrameLevel(4)
	f:SetPoint("CENTER")
	f:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", TSS.x + text:GetWidth(), TSS.y)
	f:SetSize(TSS.w, TSS.h)
	f:SetAutoFocus(false)
	-- Search when editbox contents change
	f:HookScript("OnTextChanged", SearchCrafts)
	-- Or when tradeskill window first appears
	CraftFrame:HookScript("OnShow", SearchCrafts)
	f:SetScript("OnEnterPressed", function(self)
		f:ClearFocus()
	end)
	f:SetScript("OnEscapePressed", function(self)
		f:SetText("")
		f:ClearFocus()
	end)
end

local setupTS = false
local frame = CreateFrame("Frame")
frame:RegisterEvent("TRADE_SKILL_SHOW")
frame:SetScript("OnEvent", function(self, ...)
	if not setupTS and TradeSkillFrame ~= nil then
		SetupTradeSkillWidgets()
		setupTS = true
	end
end)

local setupCF = false
local frame = CreateFrame("Frame")
frame:RegisterEvent("CRAFT_SHOW")
frame:SetScript("OnEvent", function(self, ...)
	if not setupCF and CraftFrame ~= nil then
		SetupCraftWidgets()
		setupCF = true
	end
end)
