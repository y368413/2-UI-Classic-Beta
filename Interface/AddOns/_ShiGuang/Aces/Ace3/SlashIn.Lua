
--[[--------------------------------------------------------------------
SlashIn
----------------------------------------------------------------------]]
local _, SlashIn = ...
LibStub("AceTimer-3.0"):Embed(SlashIn)

local print = print
local tonumber = tonumber
local MacroEditBox = MacroEditBox
local MacroEditBox_OnEvent = MacroEditBox:GetScript("OnEvent")
local function OnCallback(command) MacroEditBox_OnEvent(MacroEditBox, "EXECUTE_CHAT_LINE", command) end
SLASH_SLASHIN_IN1 = "/in"
SLASH_SLASHIN_IN2 = "/slashin"
function SlashCmdList.SLASHIN_IN(msg)
	local secs, command = msg:match("^([^%s]+)%s+(.*)$")
	secs = tonumber(secs)
	if (not secs) or (#command == 0) then
		print("|cff33ff99SlashIn:|r")
		print("|cff33ff99Usage:|r /in <seconds> <command>")
		print("|cff33ff99Example:|r /in 1.5 /say hi")
	else
		SlashIn:ScheduleTimer(OnCallback, secs, command)
	end
end