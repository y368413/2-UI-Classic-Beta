local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local strsplit, pairs, tonumber, sub = string.split, pairs, tonumber, string.sub
local deletedelay, mailItemIndex, inboxItems = .5, 0, {}
local button1, button2, button3, lastopened, imOrig_InboxFrame_OnClick, hasNewMail, takingOnlyCash, onlyCurrentMail, needsToWait, skipMail

function MISC:MailItem_OnClick()
	mailItemIndex = 7 * (InboxFrame.pageNum - 1) + tonumber(sub(self:GetName(), 9, 9))
	local modifiedClick = IsModifiedClick("MAILAUTOLOOTTOGGLE")
	if modifiedClick then
		InboxFrame_OnModifiedClick(self, self.index)
	else
		InboxFrame_OnClick(self, self.index)
	end
end

function MISC:MailBox_OpenAll()
	if GetInboxNumItems() == 0 then return end

	button1:SetScript("OnClick", nil)
	button2:SetScript("OnClick", nil)
	button3:SetScript("OnClick", nil)
	imOrig_InboxFrame_OnClick = InboxFrame_OnClick
	InboxFrame_OnClick = M.Dummy

	if onlyCurrentMail then
		button3:RegisterEvent("UI_ERROR_MESSAGE")
		MISC.MailBox_Open(button3, mailItemIndex)
	else
		button1:RegisterEvent("UI_ERROR_MESSAGE")
		MISC.MailBox_Open(button1, GetInboxNumItems())
	end
end

function MISC:MailBox_Update(elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if (not needsToWait) or (self.elapsed > deletedelay) then
		self.elapsed = 0
		needsToWait = false
		self:SetScript("OnUpdate", nil)

		local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(lastopened)
		if skipMail then
			MISC.MailBox_Open(self, lastopened - 1)
		elseif money > 0 or (not takingOnlyCash and numItems and numItems > 0 and COD <= 0) then
			MISC.MailBox_Open(self, lastopened)
		else
			MISC.MailBox_Open(self, lastopened - 1)
		end
	end
end

function MISC:MailBox_Open(index)
	if not InboxFrame:IsVisible() or index == 0 then
		MISC:MailBox_Stop()
		return
	end

	local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(index)
	if not takingOnlyCash then
		if money > 0 or (numItems and numItems > 0) and COD <= 0 then
			AutoLootMailItem(index)
			needsToWait = true
		end
		if onlyCurrentMail then MISC:MailBox_Stop() return end
	elseif money > 0 then
		TakeInboxMoney(index)
		needsToWait = true
	end

	local items = GetInboxNumItems()
	if (numItems and numItems > 0) or (items > 1 and index <= items) then
		lastopened = index
		self:SetScript("OnUpdate", MISC.MailBox_Update)
	else
		MISC:MailBox_Stop()
	end
end

function MISC:MailBox_Stop()
	button1:SetScript("OnUpdate", nil)
	button1:SetScript("OnClick", function() onlyCurrentMail = false MISC:MailBox_OpenAll() end)
	button2:SetScript("OnClick", function() takingOnlyCash = true MISC:MailBox_OpenAll() end)
	button3:SetScript("OnUpdate", nil)
	button3:SetScript("OnClick", function() onlyCurrentMail = true MISC:MailBox_OpenAll() end)
	if imOrig_InboxFrame_OnClick then
		InboxFrame_OnClick = imOrig_InboxFrame_OnClick
	end
	if onlyCurrentMail then
		button3:UnregisterEvent("UI_ERROR_MESSAGE")
	else
		button1:UnregisterEvent("UI_ERROR_MESSAGE")
	end
	takingOnlyCash = false
	onlyCurrentMail = false
	needsToWait = false
	skipMail = false
end

function MISC:MailBox_OnEvent(event, _, msg)
	if event == "UI_ERROR_MESSAGE" then
		if msg == ERR_INV_FULL then
			MISC:MailBox_Stop()
		elseif msg == ERR_ITEM_MAX_COUNT then
			skipMail = true
		end
	elseif event == "MAIL_CLOSED" then
		if not hasNewMail then MiniMapMailFrame:Hide() end
		MISC:MailBox_Stop()
	end
end

function MISC:TotalCash_OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	local total_cash = 0
	for index = 0, GetInboxNumItems() do
		total_cash = total_cash + select(5, GetInboxHeaderInfo(index))
	end
	if total_cash > 0 then SetTooltipMoney(GameTooltip, total_cash)	end
	GameTooltip:Show()
end

function MISC:MailBox_DelectClick()
	local selectedID = self.id + (InboxFrame.pageNum-1)*7
	if InboxItemCanDelete(selectedID) then
		DeleteInboxItem(selectedID)
	else
		UIErrorsFrame:AddMessage(I.InfoColor..ERR_MAIL_DELETE_ITEM_ERROR)
	end
end

function MISC:MailItem_AddDelete(i)
	local bu = CreateFrame("Button", nil, self)
	bu:SetPoint("BOTTOMRIGHT", self:GetParent(), "BOTTOMRIGHT", -10, 5)
	bu:SetSize(16, 16)
	M.PixelIcon(bu, 136813, true)
	bu.id = i
	bu:SetScript("OnClick", MISC.MailBox_DelectClick)
	M.AddTooltip(bu, "ANCHOR_RIGHT", DELETE, "system")
end

function MISC:CreatButton(parent, text, w, h, ap, frame, rp, x, y)
	local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	button:SetWidth(w)
	button:SetHeight(h)
	button:SetPoint(ap, frame, rp, x, y)
	button:SetText(text)
	return button
end

function MISC:InboxFrame_Hook()
	hasNewMail = false
	if select(4, GetInboxHeaderInfo(1)) then
		for i = 1, GetInboxNumItems() do
			local wasRead = select(9, GetInboxHeaderInfo(i))
			if not wasRead then
				hasNewMail = true
				break
			end
		end
	end
end

function MISC:InboxItem_OnEnter()
	wipe(inboxItems)

	local itemAttached = select(8, GetInboxHeaderInfo(self.index))
	if itemAttached then
		for attachID = 1, 12 do
			local _, _, _, itemCount = GetInboxItem(self.index, attachID)
			if itemCount and itemCount > 0 then
				local _, itemid = strsplit(":", GetInboxItemLink(self.index, attachID))
				itemid = tonumber(itemid)
				inboxItems[itemid] = (inboxItems[itemid] or 0) + itemCount
			end
		end

		if itemAttached > 1 then
			GameTooltip:AddLine(U["Attach List"])
			for key, value in pairs(inboxItems) do
				local itemName, _, itemQuality, _, _, _, _, _, _, itemTexture = GetItemInfo(key)
				if itemName then
					local r, g, b = GetItemQualityColor(itemQuality)
					GameTooltip:AddDoubleLine(" |T"..itemTexture..":12:12:0:0:50:50:4:46:4:46|t "..itemName, value, r, g, b)
				end
			end
			GameTooltip:Show()
		end
	end
end

function MISC:MailBox()
	if not MaoRUISettingDB["Misc"]["Mail"] then return end
	if IsAddOnLoaded("Postal") then return end

	for i = 1, 7 do
		local itemButton = _G["MailItem"..i.."Button"]
		itemButton:SetScript("OnClick", MISC.MailItem_OnClick)
		MISC.MailItem_AddDelete(itemButton, i)
	end

	button1 = MISC:CreatButton(InboxFrame, MAIL_RECEIVELETTERS, 80, 26, "TOPLEFT", "InboxFrame", "TOPLEFT", 60, -28)
	button1:RegisterEvent("MAIL_CLOSED")
	button1:SetScript("OnClick", MISC.MailBox_OpenAll)
	button1:SetScript("OnEvent", MISC.MailBox_OnEvent)

	button2 = MISC:CreatButton(InboxFrame, MAIL_RECEIVECOINS, 80, 26, "LEFT", button1, "RIGHT", 2, 0)
	button2:SetScript("OnClick", function()
		takingOnlyCash = true
		MISC:MailBox_OpenAll()
	end)
	button2:SetScript("OnEnter", MISC.TotalCash_OnEnter)
	button2:SetScript("OnLeave", M.HideTooltip)

	button3 = MISC:CreatButton(OpenMailFrame, MAIL_RECEIVELETTERS, 80, 22, "RIGHT", "OpenMailReplyButton", "LEFT", -2, 0)
	button3:SetScript("OnClick", function()
		onlyCurrentMail = true
		MISC:MailBox_OpenAll()
	end)
	button3:SetScript("OnEvent", MISC.MailBox_OnEvent)
	
	-------DelMailbutton----------------
	button4 = MISC:CreatButton(InboxFrame, MAIL_DELETEEMPTYMAILS, 100, 26, "LEFT", button2, "RIGHT", 2, 0)
	button4:SetScript("OnClick", function() sendCmd("/mbclean") end)

	hooksecurefunc("InboxFrame_Update", MISC.InboxFrame_Hook)
	hooksecurefunc("InboxFrameItem_OnEnter", MISC.InboxItem_OnEnter)

	-- Replace the alert frame
	if InboxTooMuchMail then
		InboxTooMuchMail:ClearAllPoints()
		InboxTooMuchMail:SetPoint("BOTTOM", MailFrame, "TOP", 0, 5)
	end

	-- Hide Blizz
	M.HideObject(OpenAllMail)
end

-------MailinputboxResizer---------------------------------------------------------------
	local editbox_width = 230		--EditBox width				--default: 224
	local moneyframe_pos = {"TOPLEFT","SendMailFrame","TOPLEFT",82,-70,}	--Money display position

local c = SendMailCostMoneyFrame
c:ClearAllPoints()
c:SetPoint(unpack(moneyframe_pos))
local f = "SendMailNameEditBox" 
_G[f]:SetSize(editbox_width or 224,20)
local r=_G[f.."Right"]
r:ClearAllPoints()
r:SetPoint("TOPRIGHT",0,0)
local mi=_G[f.."Middle"]
mi:SetSize(0,20)
mi:ClearAllPoints()
mi:SetPoint("LEFT",f.."Left","LEFT",8,0)
mi:SetPoint("RIGHT",r,"RIGHT",-8,0)

-- Mailbox Cleaner-------- by Jadya - EU-Well of Eternity---------------------------------
local min, low = math.min, string.lower
local title = GEAR_DELETEEMPTYMAILS_TITLE
local snd
local em_enabled = false
local i
local lastindex, timeout = 0,0
local timeout_range = 1 -- one second
local f = CreateFrame("Frame")

local options_desc = { ["read"] = "Delete unread mails" }

local function endloop()
 em_enabled = false
 f:Hide()
 print(title.." - Done.")
end

local function update()
 if not em_enabled or not InboxFrame or not InboxFrame:IsVisible() then endloop() return end

 local num = GetInboxNumItems()

 if num < 1 or i < 1 then
  endloop()
  return
 end
 
 local t = time()
 
 if timeout > 0 then
  if i > num or (timeout < t) then
   i = min(i - 1, num)
   timeout = 0
  else
   return
  end
 end

 --canDelete = InboxItemCanDelete(i)
 --if canDelete then
 local packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, itemCount, wasRead, wasReturned, textCreated, canReply, isGM, itemQuantity = GetInboxHeaderInfo(i)
 if (ShiGuangDB["MailRead"] or wasRead) and not isGM and (not snd or (snd and (snd == low(sender)))) and
  (not itemCount or itemCount == 0) and (not money or money == 0) then
  DeleteInboxItem(i)
  timeout = t + 1
 else
  i = i - 1
 end   
 --end
 
 if i > num then 
  endloop()
 end
end

f:SetScript("OnUpdate", update)
f:Hide()

local function printOptionMsg(arg, help)
 if ShiGuangDB[arg] == nil then return end
 print(title.." - "..(options_desc[arg] or "<unknown>").." = |cff69CCF0"..tostring(ShiGuangDB[arg]).."|r".. (help and " (|cffCCCCCC/mbclean "..arg.."|r)" or ""))
end

local function start(arg)

 if arg == "MailRead" then
  ShiGuangDB["MailRead"] = not ShiGuangDB["MailRead"]
  printOptionMsg(arg)
  return
 end

 if not InboxFrame or not InboxFrame:IsVisible() then
  print(title..MAIL_OPENMAILBOX)
  return
 end
 if arg and arg ~= "" then
  snd = low(arg)
 else
  snd = nil
 end
 i = GetInboxNumItems()
 print(title.." - Doing"..(snd and " from "..snd or "").."...")
 em_enabled = true
 f:Show()
end

local eventframe = CreateFrame("Frame")
eventframe:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventhandler()
 printOptionMsg("...", true)
 eventframe:SetScript("OnEvent", nil)
end
eventframe:SetScript("OnEvent", eventhandler)
-- slash command
SLASH_MAILBOXCLEANER1 = "/mbclean"
SLASH_MAILBOXCLEANER2 = "/mailboxcleaner"
SlashCmdList["MAILBOXCLEANER"] = start