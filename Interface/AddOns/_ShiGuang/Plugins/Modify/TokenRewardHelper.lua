--------------------------------------------------------------
---- Data  ## Author: Tyrnar ## Version: v1.5.1
--------------------------------------------------------------
local TOKEN_DATA = {}

local CLASS = {
  NONE         = 0,
  WARRIOR      = 1,
  PALADIN      = 2,
  HUNTER       = 3,
  ROGUE        = 4,
  PRIEST       = 5,
  DEATH_KNIGHT = 6,
  SHAMAN       = 7,
  MAGE         = 8,
  WARLOCK      = 9,
  MONK         = 10,
  DRUID        = 11,
  DEMON_HUNTER = 12
}

---- Datafunctions
function TOKEN_DATA:addToken(tokenId)
  self[tokenId] = {}
end

function TOKEN_DATA:addReward(tokenId, rewardId, classId)
  self[tokenId][rewardId] = classId
end

--- Ony Head
-- Horde
TOKEN_DATA:addToken(18422)
TOKEN_DATA:addReward(18422, 18406, CLASS.NONE)
TOKEN_DATA:addReward(18422, 18403, CLASS.NONE)
TOKEN_DATA:addReward(18422, 18404, CLASS.NONE)
-- Alliance
TOKEN_DATA:addToken(18423)
TOKEN_DATA:addReward(18423, 18406, CLASS.NONE)
TOKEN_DATA:addReward(18423, 18403, CLASS.NONE)
TOKEN_DATA:addReward(18423, 18404, CLASS.NONE)

--- Nef Head
-- Horde
TOKEN_DATA:addToken(19002)
TOKEN_DATA:addReward(19002, 19383, CLASS.NONE)
TOKEN_DATA:addReward(19002, 19366, CLASS.NONE)
TOKEN_DATA:addReward(19002, 19384, CLASS.NONE)
-- Alliance
TOKEN_DATA:addToken(19003)
TOKEN_DATA:addReward(19003, 19383, CLASS.NONE)
TOKEN_DATA:addReward(19003, 19366, CLASS.NONE)
TOKEN_DATA:addReward(19003, 19384, CLASS.NONE)

--- ZG Items
-- Heart of Hakkar
TOKEN_DATA:addToken(19802)
TOKEN_DATA:addReward(19802, 19948, CLASS.NONE)
TOKEN_DATA:addReward(19802, 19950, CLASS.NONE)
TOKEN_DATA:addReward(19802, 19949, CLASS.NONE)
-- Primal Hakkari Shawl
TOKEN_DATA:addToken(19721)
TOKEN_DATA:addReward(19721, 19826, CLASS.PALADIN)
TOKEN_DATA:addReward(19721, 19845, CLASS.MAGE)
TOKEN_DATA:addReward(19721, 19832, CLASS.HUNTER)
-- Primal Hakkari Aegis
TOKEN_DATA:addToken(19724)
TOKEN_DATA:addReward(19724, 19841, CLASS.PRIEST)
TOKEN_DATA:addReward(19724, 19834, CLASS.ROGUE)
TOKEN_DATA:addReward(19724, 19831, CLASS.HUNTER)
-- Primal Hakkari Kossack
TOKEN_DATA:addToken(19723)
TOKEN_DATA:addReward(19723, 20033, CLASS.WARLOCK)
TOKEN_DATA:addReward(19723, 20034, CLASS.MAGE)
TOKEN_DATA:addReward(19723, 19822, CLASS.WARRIOR)
-- Primal Hakkari Tabard
TOKEN_DATA:addToken(19722)
TOKEN_DATA:addReward(19722, 19828, CLASS.SHAMAN)
TOKEN_DATA:addReward(19722, 19825, CLASS.PALADIN)
TOKEN_DATA:addReward(19722, 19838, CLASS.DRUID)
-- Primal Hakkari Armsplint
TOKEN_DATA:addToken(19717)
TOKEN_DATA:addReward(19717, 19830, CLASS.SHAMAN)
TOKEN_DATA:addReward(19717, 19836, CLASS.ROGUE)
TOKEN_DATA:addReward(19717, 19824, CLASS.WARRIOR)
-- Primal Hakkari Bindings
TOKEN_DATA:addToken(19716)
TOKEN_DATA:addReward(19716, 19827, CLASS.PALADIN)
TOKEN_DATA:addReward(19716, 19846, CLASS.MAGE)
TOKEN_DATA:addReward(19716, 19833, CLASS.HUNTER)
-- Primal Hakkari Stanchion
TOKEN_DATA:addToken(19718)
TOKEN_DATA:addReward(19718, 19843, CLASS.PRIEST)
TOKEN_DATA:addReward(19718, 19848, CLASS.WARLOCK)
TOKEN_DATA:addReward(19718, 19840, CLASS.DRUID)
-- Primal Hakkari Girdle
TOKEN_DATA:addToken(19719)
TOKEN_DATA:addReward(19719, 19829, CLASS.SHAMAN)
TOKEN_DATA:addReward(19719, 19835, CLASS.ROGUE)
TOKEN_DATA:addReward(19719, 19823, CLASS.WARRIOR)
-- Primal Hakkari Sash
TOKEN_DATA:addToken(19720)
TOKEN_DATA:addReward(19720, 19842, CLASS.PRIEST)
TOKEN_DATA:addReward(19720, 19849, CLASS.WARLOCK)
TOKEN_DATA:addReward(19720, 19839, CLASS.DRUID)

--- AQ20 Items
-- Head of Ossirian the Unscarred
TOKEN_DATA:addToken(21220)
TOKEN_DATA:addReward(21220, 21504, CLASS.NONE)
TOKEN_DATA:addReward(21220, 21507, CLASS.NONE)
TOKEN_DATA:addReward(21220, 21505, CLASS.NONE)
TOKEN_DATA:addReward(21220, 21506, CLASS.NONE)
-- Qiraji Martial Drape
TOKEN_DATA:addToken(20885)
TOKEN_DATA:addReward(20885, 21406, CLASS.ROGUE)
TOKEN_DATA:addReward(20885, 21394, CLASS.WARRIOR)
TOKEN_DATA:addReward(20885, 21415, CLASS.MAGE)
TOKEN_DATA:addReward(20885, 21412, CLASS.PRIEST)
-- Qiraji Regal Drape
TOKEN_DATA:addToken(20889)
TOKEN_DATA:addReward(20889, 21397, CLASS.PALADIN)
TOKEN_DATA:addReward(20889, 21400, CLASS.SHAMAN)
TOKEN_DATA:addReward(20889, 21403, CLASS.HUNTER)
TOKEN_DATA:addReward(20889, 21409, CLASS.DRUID)
TOKEN_DATA:addReward(20889, 21418, CLASS.WARLOCK)
-- Qiraji Ceremonial Ring
TOKEN_DATA:addToken(20888)
TOKEN_DATA:addReward(20888, 21405, CLASS.ROGUE)
TOKEN_DATA:addReward(20888, 21411, CLASS.PRIEST)
TOKEN_DATA:addReward(20888, 21417, CLASS.WARLOCK)
TOKEN_DATA:addReward(20888, 21402, CLASS.HUNTER)
-- Qiraji Magisterial Ring
TOKEN_DATA:addToken(20884)
TOKEN_DATA:addReward(20884, 21408, CLASS.DRUID)
TOKEN_DATA:addReward(20884, 21414, CLASS.MAGE)
TOKEN_DATA:addReward(20884, 21396, CLASS.PALADIN)
TOKEN_DATA:addReward(20884, 21399, CLASS.SHAMAN)
TOKEN_DATA:addReward(20884, 21393, CLASS.WARRIOR)
-- Qiraji Ornate Hilt
TOKEN_DATA:addToken(20890)
TOKEN_DATA:addReward(20890, 21413, CLASS.MAGE)
TOKEN_DATA:addReward(20890, 21410, CLASS.PRIEST)
TOKEN_DATA:addReward(20890, 21416, CLASS.WARLOCK)
TOKEN_DATA:addReward(20890, 21407, CLASS.DRUID)
-- Qiraji Spiked Hilt
TOKEN_DATA:addToken(20886)
TOKEN_DATA:addReward(20886, 21395, CLASS.PALADIN)
TOKEN_DATA:addReward(20886, 21404, CLASS.ROGUE)
TOKEN_DATA:addReward(20886, 21398, CLASS.SHAMAN)
TOKEN_DATA:addReward(20886, 21401, CLASS.HUNTER)
TOKEN_DATA:addReward(20886, 21392, CLASS.WARRIOR)

local ALIGNMENT = {
  BOTTOM = 1,
  TOP    = 2,
  LEFT   = 3,
  RIGHT  = 4,
}

local function getAlignmentText(index)
  for k, v in pairs(ALIGNMENT) do
    if (v == index) then
      return k
    end
  end
  return "Missing Alignment in getAlignmentText(index)"
end

---- options and variables

local addonName = "TokenRewardHelper"
local trhSettings = CreateFrame("FRAME", addonName)
local panel = CreateFrame("Frame", addonName .. "Panel")
local alignmentDropDown = CreateFrame("FRAME", "alignDropDown", panel, "UIDropDownMenuTemplate")
--------------------------------------------------------------
---- helper functions
--------------------------------------------------------------

-- print help on how to use the command line
local function printHelp()
  print("Token Reward Helper usage:")
  print("/trh id <itemLink> : prints the id for a given item")
  print("/trh rw <itemLink> : prints all rewards for a given item")
  print("/trh align <TOP|BOTTOM|LEFT|RIGHT> : set the alignment of the reward tooltip to the token tooltip")
end

-- returns an itemString from a given itemLink
local function getItemString(itemLink)
  local itemString = string.match(itemLink, "item[%-?%d:]+")
  return itemString
end

-- returns an itemId from a given itemString
local function getItemId(itemString)
   local _, itemId = strsplit(":", itemString)
   return tonumber(itemId)
end

-- returns an itemLink from a given itemId
local function getItemLink(itemId)
  local _, itemLink = GetItemInfo(itemId)
  return itemLink
end

-- returns all rewards for a given token
local function getRewards(tokenID)
  local rewards = TOKEN_DATA[tokenID]
  return rewards
end

-- filters a list of rewards based on character class
local function filterRewards(table, filterElement)
  if (IsModifierKeyDown()) then
    return table
  end
  local _, _, classIndex = UnitClass(filterElement)
  local filteredTable = {}
  for k,v in pairs(table) do
    if (v == classIndex or v == 0) then
      filteredTable[k]=v
    end
  end
  return filteredTable
end

-- method to handle the "id" command line
local function handleId(msg, pattern)
  local itemLink = string.match(msg, pattern)
  local itemId = getItemId(getItemString(itemLink))
  print(format("id: \n%d", itemId))
end

-- get a list of rewards for a given itemLink
local function getRewardList(itemLink, fullList)
  fullList = fullList or false
  local itemId = getItemId(getItemString(itemLink))
  local fullRewards = getRewards(itemId)
  if (fullRewards == nil) then
    return
  end
  if (fullList) then
    return fullRewards
  end

  local filteredRewards = filterRewards(fullRewards, "player")
  return filteredRewards
end

-- method to handle the "rw" command line
local function handleReward(msg, rwPattern)
  local itemLink = string.match(msg, rwPattern)

  local rewardList = getRewardList(itemLink, true)
  
  print(format("reward lookup for %s:", itemLink))
  for k, _ in pairs(rewardList) do
    print(format("%s", getItemLink(k)))
  end
end

-- method to handle the "align" command line
local function handleAlign(msg, alignPattern)
  local alignment = string.match(msg, alignPattern)

  if (string.lower(alignment) == "top") then
    TokenRewardHelperSettings["alignment"] = ALIGNMENT.TOP
  elseif (string.lower(alignment) == "bottom") then
    TokenRewardHelperSettings["alignment"] = ALIGNMENT.BOTTOM
  elseif (string.lower(alignment) == "left") then
    TokenRewardHelperSettings["alignment"] = ALIGNMENT.LEFT
  elseif (string.lower(alignment) == "right") then
    TokenRewardHelperSettings["alignment"] = ALIGNMENT.RIGHT
  else
    InterfaceOptionsFrame_OpenToCategory(panel)
    InterfaceOptionsFrame_OpenToCategory(panel) -- one call will only open the normal interface options. blizzard bug?
  end

end

--------------------------------------------------------------
---- UI
--------------------------------------------------------------

-- updates the tooltips if hovering over an item
local function attachRewardTooltips(self, tooltips, tooltipOwner, tooltipAttachmentInner, tooltipAttachmentOuter)
  local itemName, itemLink = self:GetItem()
  if(itemName) then
    local itemId = getItemId(getItemString(itemLink))
    local rewardList = getRewardList(itemLink)
    if (rewardList == nil or next(rewardList) == nil) then
      for i = 1, #tooltips do
        tooltips[i]:Hide()
      end
      return
    end
    
  
    local i = 1
    for k, _ in pairs(rewardList) do
      tooltips[i]:SetOwner(tooltipOwner[i], "ANCHOR_NONE")
      tooltips[i]:SetPoint(tooltipAttachmentInner[i], tooltipOwner[i], tooltipAttachmentOuter[i])
      tooltips[i]:SetItemByID(k)
      if (self:IsVisible()) then
        tooltips[i]:Show()
      else
        tooltips[i]:Hide()
      end
      i = i + 1
    end
    for j = i, #tooltips do
      tooltips[j]:Hide()
    end
  else
    for i = 1, #tooltips do
      tooltips[i]:Hide()
    end
  end
end

-- handler for item link tooltips
local function OnRefTooltipSetItem(self)
  -- tooltip order from left to right: 1 - 2 - 3 - 4 - 5
  local refTooltips = { RewardRefTooltip1, RewardRefTooltip2, RewardRefTooltip3, RewardRefTooltip4, RewardRefTooltip5 }
  local tooltipOwner = { self, RewardRefTooltip1, RewardRefTooltip2, RewardRefTooltip3, RewardRefTooltip4}
  local tooltipAttachmentInner = { "TOPLEFT" , "TOPLEFT" , "TOPLEFT" , "TOPLEFT" , "TOPLEFT" }
  local tooltipAttachmentOuter = { "TOPRIGHT", "TOPRIGHT", "TOPRIGHT", "TOPRIGHT", "TOPRIGHT" }
  return attachRewardTooltips(self, refTooltips, tooltipOwner, tooltipAttachmentInner, tooltipAttachmentOuter)
end

-- handler for mouse over tooltips
local function OnNormalTooltipSetItem(self)
  local tooltips = { RewardTooltip1, RewardTooltip2, RewardTooltip3, RewardTooltip4, RewardTooltip5 }
  local tooltipOwner, tooltipAttachmentInner, tooltipAttachmentOuter
  if (ShiGuangDB["alignment"] == ALIGNMENT.BOTTOM) then
  -- tooltip order from left to right: 5 - 3 - 1 - 2 - 4
    tooltipOwner = { self, RewardTooltip1, RewardTooltip1, RewardTooltip2, RewardTooltip3}
    tooltipAttachmentInner = { "TOPLEFT"   , "TOPLEFT" , "TOPRIGHT", "TOPLEFT" , "TOPRIGHT" }
    tooltipAttachmentOuter = { "BOTTOMLEFT", "TOPRIGHT", "TOPLEFT" , "TOPRIGHT", "TOPLEFT" }
  elseif (ShiGuangDB["alignment"] == ALIGNMENT.LEFT) then
    -- TODO
  -- tooltip order from left to right: 5 - 4 - 3 - 2 - 1
    tooltipOwner = { self, RewardTooltip1, RewardTooltip2, RewardTooltip3, RewardTooltip4}
    tooltipAttachmentInner = { "TOPRIGHT" , "TOPRIGHT" , "TOPRIGHT", "TOPRIGHT" , "TOPRIGHT" }
    tooltipAttachmentOuter = { "TOPLEFT", "TOPLEFT", "TOPLEFT" , "TOPLEFT", "TOPLEFT" }
  elseif (ShiGuangDB["alignment"] == ALIGNMENT.RIGHT) then
    -- TODO
  -- tooltip order from left to right: 1 - 2 - 3 - 4 - 5
    tooltipOwner = { self, RewardTooltip1, RewardTooltip2, RewardTooltip3, RewardTooltip4}
    tooltipAttachmentInner = { "TOPLEFT"   , "TOPLEFT" , "TOPLEFT", "TOPLEFT" , "TOPLEFT" }
    tooltipAttachmentOuter = { "TOPRIGHT", "TOPRIGHT", "TOPRIGHT" , "TOPRIGHT", "TOPRIGHT" }
  else
  -- tooltip order from left to right: 5 - 3 - 1 - 2 - 4
    tooltipOwner = { self, RewardTooltip1, RewardTooltip1, RewardTooltip2, RewardTooltip3}
    tooltipAttachmentInner = { "BOTTOMLEFT", "TOPLEFT" , "TOPRIGHT", "TOPLEFT" , "TOPRIGHT" }
    tooltipAttachmentOuter = { "TOPLEFT"   , "TOPRIGHT", "TOPLEFT" , "TOPRIGHT", "TOPLEFT" }
  end
  return attachRewardTooltips(self, tooltips, tooltipOwner, tooltipAttachmentInner, tooltipAttachmentOuter)
end

-- hide all reward tooltips
local function HideTooltips()
  local tooltips = { RewardTooltip1, RewardTooltip2, RewardTooltip3, RewardTooltip4, RewardTooltip5 }
  for i = 1, #tooltips do
    tooltips[i]:Hide()
  end
end

-- hide all reward refTooltips
local function HideRefTooltips()
  local refTooltips = { RewardRefTooltip1, RewardRefTooltip2, RewardRefTooltip3, RewardRefTooltip4, RewardRefTooltip5 }
  for i = 1, #refTooltips do
    refTooltips[i]:Hide()
  end
end

-- function for clicking on the alignment dropdown in the options panel
local function alignmentDropDown_OnClick(_, arg1)
  ShiGuangDB["alignment"] = arg1
  UIDropDownMenu_SetText(alignmentDropDown, getAlignmentText(arg1))
end

-- initialization of the alignment dropdown panel
local function initAlignmentDropDown(dropDown, level, menuList)
  local info = UIDropDownMenu_CreateInfo()
  info.func = alignmentDropDown_OnClick
  for k, v in pairs(ALIGNMENT) do
    info.text = k
    info.arg1 = v
    info.checked = v == ShiGuangDB["alignment"]
    UIDropDownMenu_AddButton(info)
  end
end

-- initialization of the addon panel
local function InitializePanel()
  panel.name = "Token Reward Helper"

  InterfaceOptions_AddCategory(panel)

  local title = panel:CreateFontString(addonName .. "Title", "OVERLAY", "GameFontNormalLarge")
  title:SetPoint("TOP", 0, -12)
  title:SetText(panel.name)

  local alignOption = panel:CreateFontString(addonName .. "AlignOption", "OVERLAY", "GameFontNormalSmall")
  alignOption:SetPoint("TOPLEFT", 10, -35)
  alignOption:SetText("Tooltip Alignment:")

  alignmentDropDown:SetPoint("TOPLEFT", 0, -50)
  UIDropDownMenu_SetText(alignmentDropDown, getAlignmentText(ShiGuangDB["alignment"]))
  UIDropDownMenu_Initialize(alignmentDropDown, initAlignmentDropDown, 1)

  local info1 = panel:CreateFontString(addonName .. "info1", "OVERLAY", "GameFontNormalSmall")
  info1:SetPoint("TOPLEFT", 20, -85)
  info1:SetText("This option will be saved immediatly without using the Okay or Cancel Button below.")

  local helpText = panel:CreateFontString(addonName .. "Help", "OVERLAY", "GameFontNormalSmall")
  helpText:SetPoint("TOPLEFT", 10, -150)
  helpText:SetText("For more information, type /trh")
end

-- preload the tooltips
local function InitializeTooltips()
  for itemId, _ in pairs(TOKEN_DATA) do
    getItemLink(itemId)
  end
  local tooltips = { RewardTooltip1, RewardTooltip2, RewardTooltip3, RewardTooltip4, RewardTooltip5 }
  for i = 1, #tooltips do
    tooltips[i]:SetOwner(GameTooltip, "ANCHOR_NONE")
    -- calling SetHyperlink here seems to cause lua errors
    -- tooltips[i]:SetHyperlink(getItemLink(18422))
    tooltips[i]:SetClampedToScreen(false)
  end
  local refTooltips = { RewardRefTooltip1, RewardRefTooltip2, RewardRefTooltip3, RewardRefTooltip4, RewardRefTooltip5 }
  for i = 1, #refTooltips do
    refTooltips[i]:SetOwner(ItemRefTooltip, "ANCHOR_NONE")
    -- calling SetHyperlink here seems to cause lua errors
    -- refTooltips[i]:SetHyperlink(getItemLink(18422))
    refTooltips[i]:SetClampedToScreen(false)
  end
end

-- initial loading of tooltips and global variables
function trhSettings:ADDON_LOADED(eventName)
  if (eventName == "_ShiGuang") then
    InitializeTooltips()
    if (ShiGuangDB["alignment"] == nil) then
      ShiGuangDB["alignment"] = ALIGNMENT.BOTTOM
    end
  end
end

--------------------------------------------------------------
---- handles
--------------------------------------------------------------

-- CLI
SLASH_TOKENREWARDHELPER1 = '/tokenrewardhelper'
SLASH_TOKENREWARDHELPER2 = '/trh'
SlashCmdList["TOKENREWARDHELPER"] = handler

-- Initializing
trhSettings:RegisterEvent("ADDON_LOADED")
trhSettings:SetScript(
  "OnEvent",
  function(self, event, ...)
    if (trhSettings[event]) then
      trhSettings[event](self, ...)
    end
  end
)

-- GameTooltip
GameTooltip:HookScript("OnTooltipSetItem", OnNormalTooltipSetItem)
GameTooltip:HookScript("OnTooltipSetSpell", HideTooltips)
GameTooltip:HookScript("OnTooltipSetUnit", HideTooltips)
GameTooltip:HookScript("OnTooltipCleared", HideTooltips)

-- ItemRefTooltip
ItemRefTooltip:HookScript("OnTooltipSetItem", OnRefTooltipSetItem)
ItemRefTooltip:HookScript("OnTooltipSetSpell", HideRefTooltips)
ItemRefTooltip:HookScript("OnTooltipSetUnit", HideRefTooltips)
ItemRefTooltip:HookScript("OnTooltipCleared", HideRefTooltips)
