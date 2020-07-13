------------------------------------------------------
-- GFWUtils.lua
-- Useful utility / debug functions
------------------------------------------------------
GFWUTILS_THIS_VERSION = 12;
-- Shortcuts for common text color codes
function GFWUtils_temp_HiliteText(text)
	if (text == nil) then return nil; end
	return HIGHLIGHT_FONT_COLOR_CODE..text..FONT_COLOR_CODE_CLOSE;
end
function GFWUtils_temp_RedText(text)
	if (text == nil) then return nil; end
	return RED_FONT_COLOR_CODE..text..FONT_COLOR_CODE_CLOSE;
end
function GFWUtils_temp_GrayText(text)
	if (text == nil) then return nil; end
	return GRAY_FONT_COLOR_CODE..text..FONT_COLOR_CODE_CLOSE;
end
function GFWUtils_temp_LightYellowText(text)
	if (text == nil) then return nil; end
	return LIGHTYELLOW_FONT_COLOR_CODE..text..FONT_COLOR_CODE_CLOSE;
end

-- Prints a message to the chat frame
function GFWUtils_temp_Print(message, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage(message, (r or GFW_FONT_COLOR.r), (g or GFW_FONT_COLOR.g), (b or GFW_FONT_COLOR.b));
end

-- Prints a message to the chat frame once per interval (seconds) or once per session if interval is nil
function GFWUtils_temp_PrintOnce(message, interval, r, g, b)
	if (GFWUtils.PrintOnceCache == nil) then
		GFWUtils.PrintOnceCache = {};
	end
	if (interval == nil and GFWUtils.PrintOnceCache[message]) then
		return;
	end
	if (interval and GFWUtils.PrintOnceCache[message] and GetTime() - GFWUtils.PrintOnceCache[message] < interval) then
		return;
	end
	DEFAULT_CHAT_FRAME:AddMessage(message, (r or GFW_FONT_COLOR.r), (g or GFW_FONT_COLOR.g), (b or GFW_FONT_COLOR.b));
	GFWUtils.PrintOnceCache[message] = GetTime();
end

-- Prints a message in yellow to the floating messages frame
function GFWUtils_temp_Note(message)
	UIErrorsFrame:AddMessage(message, 1.0, 1.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
end

-- Converts string.format to a string.find pattern: "%s hits %s for %d." to "(.+) hits (.+) for (%d+)"
-- based on Recap by Gello
function GFWUtils_temp_FormatToPattern(formatString)

	local patternString = formatString;
	
	patternString = string.gsub(patternString, "%%%d+%$([diouXxfgbcsq])", "%%%1"); -- reordering specifiers (e.g. %2$s) stripped	

	patternString = string.gsub(patternString, "%%(%d-[diu])", "%%d"); -- strip field widths from int
	patternString = string.gsub(patternString, "%%(%d-%.?%d-[gef])", "%%f"); -- and from float

	patternString = string.gsub(patternString, "([%$%(%)%.%[%]%*%+%-%?%^])", "%%%1"); -- convert regex special characters
	
	patternString = string.gsub(patternString, "%%c", "(.)"); -- %c to (.)
	patternString = string.gsub(patternString, "%%s", "(.+)"); -- %s to (.+)
	patternString = string.gsub(patternString, "%%d", "(%%d+)"); -- %d to (%d+)
	patternString = string.gsub(patternString, "%%f", "(%%d+%%.*%%d*)"); -- %g or %f to (%d+%.*%d*)
		
	return patternString;

end

-- Splits a string into a table of strings separated by 'separator'.
-- e.g. Split(aString, ", ") is the reverse of table.concat(aTable, ", ")
function GFWUtils_temp_Split(aString, separator)
	if (aString == nil) then return nil; end
	
	local t = {};
	local function helper(segment)
		table.insert(t, segment);
	end
	helper((string.gsub(aString, "(.-)"..separator, helper)));
	return t;
end

-- Capitalizes the first letter of each word in aString.
function GFWUtils_temp_TitleCase(aString)
	if (aString == nil) then return nil; end
	local function capWords(first, rest) 
		return string.upper(first)..string.lower(rest);
	end
	return string.gsub(aString, "(%w)([%w_']*)", capWords);
end

-- Splits a cash amount into gold, siver, and copper
function GFWUtils_temp_GSC(money)
	if (money == nil) then money = 0; end
	local g = math.floor(money / 10000);
	local s = math.floor((money - (g*10000)) / 100);
	local c = math.floor(money - (g*10000) - (s*100));
	return g,s,c;
end

-- Formats money text by color for gold, silver, copper
-- discards copper for amounts greater than 1g unless second arg evaluates true
-- based on Auctioneer
function GFWUtils_temp_TextGSC(money, noRound)
    local GSC_GOLD="ffd100";
    local GSC_SILVER="e6e6e6";
    local GSC_COPPER="c8602c";
    local GSC_START="|cff%s%d%s|r";
    local GSC_PART=" |cff%s%02d%s|r";
    local GSC_NONE="|cffa0a0a0none|r";

	local g, s, c = GFWUtils.GSC(money);
	
	local gsc = "";
	if (g > 0) then
		gsc = format(GSC_START, GSC_GOLD, g, "g");     
		if (s > 0) then
			gsc = gsc..format(GSC_PART, GSC_SILVER, s, "s");
			if (noRound and c > 0) then
				gsc = gsc..format(GSC_PART, GSC_COPPER, c, "c");
			end
		end
	elseif (s > 0) then
		gsc = format(GSC_START, GSC_SILVER, s, "s");
		if (c > 0) then
			gsc = gsc..format(GSC_PART, GSC_COPPER, c, "c");
		end
	elseif (c > 0) then
		gsc = gsc..format(GSC_START, GSC_COPPER, c, "c");
	else
		gsc = GSC_NONE;
	end

	return gsc;
end

function GFWUtils_temp_ItemLink(linkInfo)
	local sName, sLink, iQuality, iLevel, sType, sSubType, iCount = GetItemInfo(linkInfo);
	return sLink;
end

function GFWUtils_temp_DecomposeItemLink(link)
	local _, _, itemID, enchant, gem1, gem2, gem3, gem4, randomProp, uniqueID = string.find(link, "item:(-?%d+):(-?%d+):(-?%d+):(-?%d+):(-?%d+):(-?%d+):(-?%d+):(-?%d+)");
	itemID = tonumber(itemID);
	enchant = tonumber(enchant);
	gem1 = tonumber(gem1);
	gem2 = tonumber(gem2);
	gem3 = tonumber(gem3);
	gem4 = tonumber(gem4);
	randomProp = tonumber(randomProp);
	uniqueID = tonumber(uniqueID);
	return itemID, enchant, gem1, gem2, gem3, gem4, randomProp, uniqueID;
end

function GFWUtils_temp_BuildItemLink(itemID, enchant, gem1, gem2, gem3, gem4, randomProp, uniqueID)
	itemID = itemID or 0;
	enchant = enchant or 0;
	gem1 = gem1 or 0;
	gem2 = gem2 or 0;
	gem3 = gem3 or 0;
	gem4 = gem4 or 0;
	randomProp = randomProp or 0;
	uniqueID = uniqueID or 0;
	return string.format("item:%d:%d:%d:%d:%d:%d:%d:%d", itemID, enchant, gem1, gem2, gem3, gem4, randomProp, uniqueID);
end

function GFWUtils_temp_ColorToCode(color)
	return string.format("|cff%02x%02x%02x", (color.r * 255), (color.g * 255), (color.b * 255));
end

function GFWUtils_temp_ColorText(text, color)
	return GFWUtils.ColorToCode(color)..text..FONT_COLOR_CODE_CLOSE;
end
------------------------------------------------------
-- load only if not already loaded
------------------------------------------------------

if (GFWUtils == nil) then
	GFWUtils = {};
end
local G = GFWUtils;
if (G.Version == nil or (tonumber(G.Version) ~= nil and G.Version < GFWUTILS_THIS_VERSION)) then

	-- Constants
	GFW_FONT_COLOR = {r=0.25, g=1.0, b=1.0};
	GFW_DEBUG_COLOR = {r=1.0, g=0.75, b=0.25};
	G.Debug = false;

	-- Functions
	G.Hilite = GFWUtils_temp_HiliteText;
	G.Red = GFWUtils_temp_RedText;
	G.Gray = GFWUtils_temp_GrayText;
	G.LtY = GFWUtils_temp_LightYellowText;
	G.Print = GFWUtils_temp_Print;
	G.PrintOnce = GFWUtils_temp_PrintOnce;
	G.DebugLog = GFWUtils_temp_DebugLog;
	G.Note = GFWUtils_temp_Note;
	G.FormatToPattern = GFWUtils_temp_FormatToPattern;
	G.Split = GFWUtils_temp_Split;
	G.TitleCase = GFWUtils_temp_TitleCase;
	G.GSC = GFWUtils_temp_GSC;
	G.TextGSC = GFWUtils_temp_TextGSC;
	G.ItemLink = GFWUtils_temp_ItemLink;
	G.DecomposeItemLink = GFWUtils_temp_DecomposeItemLink;
	G.BuildItemLink = GFWUtils_temp_BuildItemLink;
	G.ColorToCode = GFWUtils_temp_ColorToCode;
	G.ColorText = GFWUtils_temp_ColorText;
	
	-- Set version number
	G.Version = GFWUTILS_THIS_VERSION;
end
------------------------------------------------------
-- GFWTable.lua
-- Utilities for manipulating tables 
------------------------------------------------------
GFWTABLE_THIS_VERSION = 8;
-- Mean: returns the mean value of a table of numbers
function GFWTable_temp_Mean(aTable)
	if (aTable == nil or table.getn(aTable) == 0) then
		return nil;
	end
	return GFWTable.Sum(aTable) / table.getn(aTable);
end

-- Sum: returns the sum of a table of numbers
function GFWTable_temp_Sum(aTable)
	if (aTable == nil or table.getn(aTable) == 0) then
		return nil;
	end
	local sum = 0;
	for i=1, table.getn(aTable) do
		if (tonumber(aTable[i])) then
			sum = sum + aTable[i];
		end
	end
	return sum;
end

-- Median: returns the median value (most useful in a table of numbers, but usable in any sorted table)
function GFWTable_temp_Median(aTable)
	if (aTable == nil or table.getn(aTable) == 0) then 
		return nil; 
	end
	if (table.getn(aTable) == 1) then
		return aTable[1];
	end
	local sortedTable = GFWTable.Copy(aTable); -- leave the original table in whatever order it's in
	table.sort(sortedTable);
	local count = table.getn(sortedTable);
	local median;
	if (math.fmod(count, 2) == 0) then -- even table size
		local middleIndex1 = count / 2;
		local middleIndex2 = middleIndex1 + 1;
		median = (sortedTable[middleIndex1] + sortedTable[middleIndex2]) / 2; --average the two middle values
	else -- the table size is odd
		local trueMiddleIndex = (count + 1) / 2; -- calculate the middle index
		median = sortedTable[trueMiddleIndex];
	end
	return median;
end

-- Merge: returns the union of two tables (without repeated elements)
function GFWTable_temp_Merge(table1, table2)
	local newTable = { };
	if (table1) then
		for i=1, table.getn(table1) do
			table.insert(newTable, table1[i]);
		end
	end
	if (table2) then
		for i=1, table.getn(table2) do
			if (GFWTable.IndexOf(newTable, table2[i]) == 0) then
				table.insert(newTable, table2[i]);
			end
		end
	end
	return newTable;
end

-- Diff: returns the difference of two tables (those elements which occur in either but not both)
function GFWTable_temp_Diff(table1, table2)
	local newTable = { };
	if (table1 == nil) then
		table1 = {};
	end
	if (table2 == nil) then
		table2 = {};
	end
	for i=1, table.getn(table1) do
		if (GFWTable.IndexOf(table2, table1[i]) == 0) then
			table.insert(newTable, table1[i]);
		end
	end
	for i=1, table.getn(table2) do
		if (GFWTable.IndexOf(table1, table2[i]) == 0) then
			table.insert(newTable, table2[i]);
		end
	end
	return newTable;
end

-- Subtract: returns a table containing those items in table1 not present in table2
function GFWTable_temp_Subtract(table1, table2)
	local newTable = { };
	if (table1 == nil or table.getn(table1) == 0) then return newTable; end
	if (table2 == nil or table.getn(table2) == 0) then return table1; end
	for i=1, table.getn(table1) do
		if (GFWTable.IndexOf(table2, table1[i]) == 0) then
			table.insert(newTable, table1[i]);
		end
	end
	return newTable;
end

-- IndexOf: returns the index (1-based) of an item in a table
function GFWTable_temp_IndexOf(aTable, item)
	return GFWTable.KeyOf(aTable, item) or 0;
end

-- KeyOf: returns the key to an item in a table with numeric or non-numeric keys, or nil if not found
function GFWTable_temp_KeyOf(aTable, item)
	if (aTable == nil or type(aTable) ~= "table") then
		return nil; -- caller probably won't expect this, causing traceable error in their code
	end
	for key, value in pairs(aTable) do
		if (item == value) then
			return key;
		end
	end
	return nil;
end

-- Copy: copies one table's elements into a new table (useful if you want to change them while preserving the first table). 
--       Not a deep copy.
function GFWTable_temp_Copy(aTable)
	local newTable = { };
	for i=1, table.getn(aTable) do
		newTable[i] = aTable[i];
	end
	return newTable;
end

-- Count: returns number of items in a table regardless of whether it has numeric indices.
function GFWTable_temp_Count(aTable)
	if (aTable == nil or type(aTable) ~= "table") then
		return nil; -- caller probably won't expect this, causing traceable error in their code
	end
	local count = 0;
	for key, value in pairs(aTable) do
		count = count + 1;
	end
	return count;
end

-- PairsByKeys: an iterator a la pairs() but with keys sorted (by comparator function f if present)
-- Straight from the Lua book
function GFWTable_temp_PairsByKeys(t,f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end
------------------------------------------------------
-- load only if not already loaded
------------------------------------------------------

if (GFWTable == nil) then
	GFWTable = {};
end
local G = GFWTable;
if (G.Version == nil or (tonumber(G.Version) ~= nil and G.Version < GFWTABLE_THIS_VERSION)) then

	-- Functions
	G.Mean = GFWTable_temp_Mean;
	G.Sum = GFWTable_temp_Sum;
	G.Median = GFWTable_temp_Median;
	G.Merge = GFWTable_temp_Merge;
	G.Diff = GFWTable_temp_Diff;
	G.Subtract = GFWTable_temp_Subtract;
	G.IndexOf = GFWTable_temp_IndexOf;
	G.KeyOf = GFWTable_temp_KeyOf;
	G.Copy = GFWTable_temp_Copy;
	G.Count = GFWTable_temp_Count;
	G.PairsByKeys = GFWTable_temp_PairsByKeys;
	
	-- Set version number
	G.Version = GFWTABLE_THIS_VERSION;
end
------------------------------------------------------
-- FFF_ItemInfo.lua
------------------------------------------------------
-- LOCALIZATION: nothing locale-specific here (any localized names are all in comments)
------------------------------------------------------

FOM_FoodTypes = { -- used to set priority
	CONJURED = 1, -- mage food etc, preferable because it's free!
	BASIC    = 2, -- includes combo health/mana food, because hunters don't care about mana anymore
	BONUS    = 3, -- food with "well fed" bonuses
	INEDIBLE = 4, -- usually cooking mats TODO: bring back prefer/avoid
}
local F = FOM_FoodTypes;

FOM_Foods = {
	[FOM_DIET_MEAT] = {
		-- Mists and before
		[   117] = F.BASIC,
		[  2287] = F.BASIC,
		[  2679] = F.BASIC,
		[  2681] = F.BASIC,
		[  2685] = F.BASIC,
		[  3770] = F.BASIC,
		[  3771] = F.BASIC,
		[  4599] = F.BASIC,
		[  5478] = F.BASIC,
		[  6890] = F.BASIC,
		[  7097] = F.BASIC,
		[  8952] = F.BASIC,
		[  9681] = F.BASIC,
		[  9681] = F.BASIC,
		[ 11444] = F.BASIC,
		[ 11444] = F.BASIC,
		[ 17119] = F.BASIC,
		[ 17407] = F.BASIC,
		[ 19223] = F.BASIC,
		[ 19224] = F.BASIC,
		[ 19304] = F.BASIC,
		[ 19305] = F.BASIC,
		[ 19306] = F.BASIC,
		[ 19995] = F.BASIC,
		[ 21235] = F.BASIC,
		[ 23495] = F.BASIC,
		[ 27854] = F.BASIC,
		[ 29451] = F.BASIC,
		[ 30610] = F.BASIC,
		[ 32685] = F.BASIC,
		[ 32686] = F.BASIC,
		[ 33254] = F.BASIC,
		[ 33454] = F.BASIC,
		[ 34747] = F.BASIC,
		[ 35953] = F.BASIC,
		[ 38427] = F.BASIC,
		[ 38428] = F.BASIC,
		[ 40202] = F.BASIC,
		[ 40358] = F.BASIC,
		[ 40359] = F.BASIC,
		[ 41729] = F.BASIC,
		[ 44072] = F.BASIC,
		[ 57544] = F.BASIC,
		[ 58268] = F.BASIC,
		[ 58269] = F.BASIC,
		[ 58280] = F.BASIC,
		[ 59231] = F.BASIC,
		[ 59232] = F.BASIC,
		[ 60268] = F.BASIC,
		[ 60377] = F.BASIC,
		[ 62653] = F.BASIC,
		[ 62658] = F.BASIC,
		[ 62662] = F.BASIC,
		[ 62664] = F.BASIC,
		[ 62665] = F.BASIC,
		[ 62670] = F.BASIC,
		[ 62676] = F.BASIC,
		[ 62909] = F.BASIC,
		[ 62910] = F.BASIC,
		[ 65730] = F.BASIC,
		[ 65731] = F.BASIC,
		[ 67230] = F.BASIC,
		[ 67270] = F.BASIC,
		[ 67271] = F.BASIC,
		[ 67272] = F.BASIC,
		[ 67273] = F.BASIC,
		[ 74642] = F.BASIC,
		[ 74646] = F.BASIC,
		[ 74647] = F.BASIC,
		[ 74648] = F.BASIC,
		[ 74649] = F.BASIC,
		[ 74650] = F.BASIC,
		[ 74653] = F.BASIC,
		[ 74654] = F.BASIC,
		[ 74656] = F.BASIC,
		[ 81917] = F.BASIC,
		[ 81918] = F.BASIC,
		[ 83097] = F.BASIC,
		[ 85501] = F.BASIC,
		[ 86070] = F.BASIC,
		[ 90135] = F.BASIC,
		[  1017] = F.BONUS,
		[  2680] = F.BONUS,
		[  2684] = F.BONUS,
		[  2687] = F.BONUS,
		[  2888] = F.BONUS,
		[  3220] = F.BONUS,
		[  3662] = F.BONUS,
		[  3726] = F.BONUS,
		[  3727] = F.BONUS,
		[  3728] = F.BONUS,
		[  3729] = F.BONUS,
		[  4457] = F.BONUS,
		[  5472] = F.BONUS,
		[  5474] = F.BONUS,
		[  5477] = F.BONUS,
		[  5479] = F.BONUS,
		[  5480] = F.BONUS,
		[ 12209] = F.BONUS,
		[ 12210] = F.BONUS,
		[ 12213] = F.BONUS,
		[ 12224] = F.BONUS,
		[ 13851] = F.BONUS,
		[ 17222] = F.BONUS,
		[ 18045] = F.BONUS,
		[ 20074] = F.BONUS,
		[ 21023] = F.BONUS,
		[ 24105] = F.BONUS,
		[ 27635] = F.BONUS,
		[ 27636] = F.BONUS,
		[ 27651] = F.BONUS,
		[ 27655] = F.BONUS,
		[ 27657] = F.BONUS,
		[ 27658] = F.BONUS,
		[ 27659] = F.BONUS,
		[ 27660] = F.BONUS,
		[ 29292] = F.BONUS,
		[ 31672] = F.BONUS,
		[ 31673] = F.BONUS,
		[ 33872] = F.BONUS,
		[ 34125] = F.BONUS,
		[ 34410] = F.BONUS,
		[ 34748] = F.BONUS,
		[ 34749] = F.BONUS,
		[ 34750] = F.BONUS,
		[ 34751] = F.BONUS,
		[ 34752] = F.BONUS,
		[ 34754] = F.BONUS,
		[ 34755] = F.BONUS,
		[ 34756] = F.BONUS,
		[ 34757] = F.BONUS,
		[ 34758] = F.BONUS,
		[ 35563] = F.BONUS,
		[ 35565] = F.BONUS,
		[ 42779] = F.BONUS,
		[ 42994] = F.BONUS,
		[ 42995] = F.BONUS,
		[ 42997] = F.BONUS,
		[ 43001] = F.BONUS,
		[ 43488] = F.BONUS,
		[ 46392] = F.BONUS,
		[ 57519] = F.BONUS,
		[ 62653] = F.BONUS,
		[ 62658] = F.BONUS,
		[ 62662] = F.BONUS,
		[ 62664] = F.BONUS,
		[ 62665] = F.BONUS,
		[ 62670] = F.BONUS,
		[ 64641] = F.BONUS,
		[ 74642] = F.BONUS,
		[ 74646] = F.BONUS,
		[ 74647] = F.BONUS,
		[ 74648] = F.BONUS,
		[ 74649] = F.BONUS,
		[ 74650] = F.BONUS,
		[ 74653] = F.BONUS,
		[ 74654] = F.BONUS,
		[ 74656] = F.BONUS,
		[ 81405] = F.BONUS,
		[ 81413] = F.BONUS,
		[ 86070] = F.BONUS,
		[   723] = F.INEDIBLE,
		[   729] = F.INEDIBLE,
		[   769] = F.INEDIBLE,
		[  1015] = F.INEDIBLE,
		[  1080] = F.INEDIBLE,
		[  1081] = F.INEDIBLE,
		[  2672] = F.INEDIBLE,
		[  2673] = F.INEDIBLE,
		[  2677] = F.INEDIBLE,
		[  2886] = F.INEDIBLE,
		[  2924] = F.INEDIBLE,
		[  3173] = F.INEDIBLE,
		[  3404] = F.INEDIBLE,
		[  3667] = F.INEDIBLE,
		[  3712] = F.INEDIBLE,
		[  3730] = F.INEDIBLE,
		[  3731] = F.INEDIBLE,
		[  4739] = F.INEDIBLE,
		[  5051] = F.INEDIBLE,
		[  5465] = F.INEDIBLE,
		[  5467] = F.INEDIBLE,
		[  5469] = F.INEDIBLE,
		[  5470] = F.INEDIBLE,
		[  5471] = F.INEDIBLE,
		[ 12037] = F.INEDIBLE,
		[ 12184] = F.INEDIBLE,
		[ 12202] = F.INEDIBLE,
		[ 12203] = F.INEDIBLE,
		[ 12204] = F.INEDIBLE,
		[ 12205] = F.INEDIBLE,
		[ 12208] = F.INEDIBLE,
		[ 12223] = F.INEDIBLE,
		[ 20424] = F.INEDIBLE,
		[ 21024] = F.INEDIBLE,
		[ 22644] = F.INEDIBLE,
		[ 23676] = F.INEDIBLE,
		[ 27668] = F.INEDIBLE,
		[ 27669] = F.INEDIBLE,
		[ 27671] = F.INEDIBLE,
		[ 27674] = F.INEDIBLE,
		[ 27677] = F.INEDIBLE,
		[ 27678] = F.INEDIBLE,
		[ 27681] = F.INEDIBLE,
		[ 27682] = F.INEDIBLE,
		[ 31670] = F.INEDIBLE,
		[ 31671] = F.INEDIBLE,
		[ 33120] = F.INEDIBLE,
		[ 34736] = F.INEDIBLE,
		[ 35562] = F.INEDIBLE,
		[ 35794] = F.INEDIBLE,
		[ 43009] = F.INEDIBLE,
		[ 43010] = F.INEDIBLE,
		[ 43011] = F.INEDIBLE,
		[ 43012] = F.INEDIBLE,
		[ 43013] = F.INEDIBLE,
		[ 62778] = F.INEDIBLE,
		[ 62779] = F.INEDIBLE,
		[ 62780] = F.INEDIBLE,
		[ 62781] = F.INEDIBLE,
		[ 62782] = F.INEDIBLE,
		[ 62783] = F.INEDIBLE,
		[ 62784] = F.INEDIBLE,
		[ 62785] = F.INEDIBLE,
		[ 67229] = F.INEDIBLE,
		[ 74833] = F.INEDIBLE,
		[ 74834] = F.INEDIBLE,
		[ 74837] = F.INEDIBLE,
		[ 74838] = F.INEDIBLE,
		[ 74839] = F.INEDIBLE,
		[ 75014] = F.INEDIBLE,
		[ 85506] = F.INEDIBLE,
		
	},
	[FOM_DIET_FISH] = {
		-- Mists and before
		[   787] = F.BASIC,
		[  1326] = F.BASIC,
		[  2682] = F.BASIC,
		[  2682] = F.BASIC,
		[  4592] = F.BASIC,
		[  4593] = F.BASIC,
		[  4594] = F.BASIC,
		[  5095] = F.BASIC,
		[  6290] = F.BASIC,
		[  6316] = F.BASIC,
		[  6887] = F.BASIC,
		[  8364] = F.BASIC,
		[  8957] = F.BASIC,
		[  8959] = F.BASIC,
		[ 12238] = F.BASIC,
		[ 13546] = F.BASIC,
		[ 13930] = F.BASIC,
		[ 13933] = F.BASIC,
		[ 13935] = F.BASIC,
		[ 16766] = F.BASIC,
		[ 19996] = F.BASIC,
		[ 21071] = F.BASIC,
		[ 21153] = F.BASIC,
		[ 21552] = F.BASIC,
		[ 27661] = F.BASIC,
		[ 27858] = F.BASIC,
		[ 29452] = F.BASIC,
		[ 33004] = F.BASIC,
		[ 33048] = F.BASIC,
		[ 33053] = F.BASIC,
		[ 33451] = F.BASIC,
		[ 34759] = F.BASIC,
		[ 34760] = F.BASIC,
		[ 34761] = F.BASIC,
		[ 35285] = F.BASIC,
		[ 35951] = F.BASIC,
		[ 43571] = F.BASIC,
		[ 43646] = F.BASIC,
		[ 43647] = F.BASIC,
		[ 44049] = F.BASIC,
		[ 44071] = F.BASIC,
		[ 45932] = F.BASIC,
		[ 56165] = F.BASIC,
		[ 58262] = F.BASIC,
		[ 58263] = F.BASIC,
		[ 58277] = F.BASIC,
		[ 62651] = F.BASIC,
		[ 62652] = F.BASIC,
		[ 62654] = F.BASIC,
		[ 62655] = F.BASIC,
		[ 62656] = F.BASIC,
		[ 62657] = F.BASIC,
		[ 62659] = F.BASIC,
		[ 62660] = F.BASIC,
		[ 62661] = F.BASIC,
		[ 62663] = F.BASIC,
		[ 62666] = F.BASIC,
		[ 62667] = F.BASIC,
		[ 62668] = F.BASIC,
		[ 62669] = F.BASIC,
		[ 62671] = F.BASIC,
		[ 62677] = F.BASIC,
		[ 68687] = F.BASIC,
		[ 74636] = F.BASIC,
		[ 74641] = F.BASIC,
		[ 74644] = F.BASIC,
		[ 74645] = F.BASIC,
		[ 74651] = F.BASIC,
		[ 74652] = F.BASIC,
		[ 74655] = F.BASIC,
		[ 82448] = F.BASIC,
		[ 82449] = F.BASIC,
		[ 86073] = F.BASIC,
		[  5476] = F.BONUS,
		[  5527] = F.BONUS,
		[  6038] = F.BONUS,
		[ 12216] = F.BONUS,
		[ 13927] = F.BONUS,
		[ 13928] = F.BONUS,
		[ 13929] = F.BONUS,
		[ 13932] = F.BONUS,
		[ 13934] = F.BONUS,
		[ 16971] = F.BONUS,
		[ 21072] = F.BONUS,
		[ 21217] = F.BONUS,
		[ 27662] = F.BONUS,
		[ 27663] = F.BONUS,
		[ 27664] = F.BONUS,
		[ 27665] = F.BONUS,
		[ 27666] = F.BONUS,
		[ 27667] = F.BONUS,
		[ 30155] = F.BONUS,
		[ 33052] = F.BONUS,
		[ 33867] = F.BONUS,
		[ 34762] = F.BONUS,
		[ 34763] = F.BONUS,
		[ 34764] = F.BONUS,
		[ 34765] = F.BONUS,
		[ 34766] = F.BONUS,
		[ 34767] = F.BONUS,
		[ 34768] = F.BONUS,
		[ 34769] = F.BONUS,
		[ 37452] = F.BONUS,
		[ 39691] = F.BONUS,
		[ 42942] = F.BONUS,
		[ 42993] = F.BONUS,
		[ 42996] = F.BONUS,
		[ 42998] = F.BONUS,
		[ 42999] = F.BONUS,
		[ 43000] = F.BONUS,
		[ 43268] = F.BONUS,
		[ 43491] = F.BONUS,
		[ 43492] = F.BONUS,
		[ 43572] = F.BONUS,
		[ 43652] = F.BONUS,
		[ 62651] = F.BONUS,
		[ 62652] = F.BONUS,
		[ 62654] = F.BONUS,
		[ 62655] = F.BONUS,
		[ 62656] = F.BONUS,
		[ 62657] = F.BONUS,
		[ 62659] = F.BONUS,
		[ 62660] = F.BONUS,
		[ 62661] = F.BONUS,
		[ 62663] = F.BONUS,
		[ 62666] = F.BONUS,
		[ 62667] = F.BONUS,
		[ 62668] = F.BONUS,
		[ 62669] = F.BONUS,
		[ 62671] = F.BONUS,
		[ 74609] = F.BONUS,
		[ 74644] = F.BONUS,
		[ 74645] = F.BONUS,
		[ 74651] = F.BONUS,
		[ 74652] = F.BONUS,
		[ 74655] = F.BONUS,
		[ 81175] = F.BONUS,
		[ 81402] = F.BONUS,
		[ 81410] = F.BONUS,
		[ 85504] = F.BONUS,
		[ 86073] = F.BONUS,
		[  2674] = F.INEDIBLE,
		[  2675] = F.INEDIBLE,
		[  4603] = F.INEDIBLE,
		[  4655] = F.INEDIBLE,
		[  5468] = F.INEDIBLE,
		[  5503] = F.INEDIBLE,
		[  5504] = F.INEDIBLE,
		[  6289] = F.INEDIBLE,
		[  6291] = F.INEDIBLE,
		[  6303] = F.INEDIBLE,
		[  6308] = F.INEDIBLE,
		[  6317] = F.INEDIBLE,
		[  6361] = F.INEDIBLE,
		[  6362] = F.INEDIBLE,
		[  7974] = F.INEDIBLE,
		[  8365] = F.INEDIBLE,
		[ 12206] = F.INEDIBLE,
		[ 12207] = F.INEDIBLE,
		[ 13754] = F.INEDIBLE,
		[ 13755] = F.INEDIBLE,
		[ 13756] = F.INEDIBLE,
		[ 13758] = F.INEDIBLE,
		[ 13759] = F.INEDIBLE,
		[ 13760] = F.INEDIBLE,
		[ 13888] = F.INEDIBLE,
		[ 13889] = F.INEDIBLE,
		[ 13890] = F.INEDIBLE,
		[ 13893] = F.INEDIBLE,
		[ 15924] = F.INEDIBLE,
		[ 24477] = F.INEDIBLE,
		[ 27422] = F.INEDIBLE,
		[ 27425] = F.INEDIBLE,
		[ 27429] = F.INEDIBLE,
		[ 27435] = F.INEDIBLE,
		[ 27437] = F.INEDIBLE,
		[ 27438] = F.INEDIBLE,
		[ 27439] = F.INEDIBLE,
		[ 27515] = F.INEDIBLE,
		[ 27516] = F.INEDIBLE,
		[ 33823] = F.INEDIBLE,
		[ 33824] = F.INEDIBLE,
		[ 36782] = F.INEDIBLE,
		[ 40199] = F.INEDIBLE,
		[ 41800] = F.INEDIBLE,
		[ 41801] = F.INEDIBLE,
		[ 41802] = F.INEDIBLE,
		[ 41803] = F.INEDIBLE,
		[ 41805] = F.INEDIBLE,
		[ 41806] = F.INEDIBLE,
		[ 41807] = F.INEDIBLE,
		[ 41808] = F.INEDIBLE,
		[ 41809] = F.INEDIBLE,
		[ 41810] = F.INEDIBLE,
		[ 41812] = F.INEDIBLE,
		[ 41813] = F.INEDIBLE,
		[ 41814] = F.INEDIBLE,
		[ 53062] = F.INEDIBLE,
		[ 53063] = F.INEDIBLE,
		[ 53064] = F.INEDIBLE,
		[ 53066] = F.INEDIBLE,
		[ 53067] = F.INEDIBLE,
		[ 53068] = F.INEDIBLE,
		[ 53069] = F.INEDIBLE,
		[ 53070] = F.INEDIBLE,
		[ 53071] = F.INEDIBLE,
		[ 53072] = F.INEDIBLE,
		[ 62791] = F.INEDIBLE,
		[ 74856] = F.INEDIBLE,
		[ 74857] = F.INEDIBLE,
		[ 74859] = F.INEDIBLE,
		[ 74860] = F.INEDIBLE,
		[ 74861] = F.INEDIBLE,
		[ 74863] = F.INEDIBLE,
		[ 74865] = F.INEDIBLE,
		[ 74865] = F.INEDIBLE,
		[ 74866] = F.INEDIBLE,

		
	},
	[FOM_DIET_BREAD] = {
		-- Mists and before
		[ 5349] = F.CONJURED,
		[ 1113] = F.CONJURED,
		[ 1114] = F.CONJURED,
		[ 1487] = F.CONJURED,
		[ 8075] = F.CONJURED,
		[ 8076] = F.CONJURED,
		[ 34062] = F.CONJURED,
		[ 43518] = F.CONJURED,
		[ 43523] = F.CONJURED,
		[ 65499] = F.CONJURED,
		[ 65500] = F.CONJURED,
		[ 65515] = F.CONJURED,
		[ 65516] = F.CONJURED,
		[ 65517] = F.CONJURED,
		[ 70924] = F.CONJURED,
		[ 70925] = F.CONJURED,
		[ 70926] = F.CONJURED,
		[ 70927] = F.CONJURED,
		[  4540] = F.BASIC,
		[  4541] = F.BASIC,
		[  4542] = F.BASIC,
		[  4544] = F.BASIC,
		[  4601] = F.BASIC,
		[  8950] = F.BASIC,
		[ 13724] = F.BASIC,
		[ 16169] = F.BASIC,
		[ 19301] = F.BASIC,
		[ 19696] = F.BASIC,
		[ 20857] = F.BASIC,
		[ 23160] = F.BASIC,
		[ 24072] = F.BASIC,
		[ 27855] = F.BASIC,
		[ 28486] = F.BASIC,
		[ 29394] = F.BASIC,
		[ 29449] = F.BASIC,
		[ 30816] = F.BASIC,
		[ 33449] = F.BASIC,
		[ 34780] = F.BASIC,
		[ 35950] = F.BASIC,
		[ 42428] = F.BASIC,
		[ 42429] = F.BASIC,
		[ 42430] = F.BASIC,
		[ 42431] = F.BASIC,
		[ 42432] = F.BASIC,
		[ 42433] = F.BASIC,
		[ 42434] = F.BASIC,
		[ 42778] = F.BASIC,
		[ 44609] = F.BASIC,
		[ 58260] = F.BASIC,
		[ 58261] = F.BASIC,
		[ 81406] = F.BASIC,
		[ 82450] = F.BASIC,
		[ 82451] = F.BASIC,
		[ 86026] = F.BASIC,
		[ 86069] = F.BASIC,
		[ 90457] = F.BASIC,
		[  2683] = F.BONUS,
		[  3666] = F.BONUS,
		[ 17197] = F.BONUS,
		[ 43490] = F.BONUS,
		[ 33924] = F.BONUS,
		[ 81400] = F.BONUS,
		[ 81408] = F.BONUS,
		[ 81406] = F.BONUS,
		[ 86026] = F.BONUS,
		[ 86069] = F.BONUS,
		[ 90457] = F.BONUS,
	},
	[FOM_DIET_CHEESE] = {
		-- Mists and before
		[   414] = F.BASIC,
		[   422] = F.BASIC,
		[  1707] = F.BASIC,
		[  2070] = F.BASIC,
		[  3927] = F.BASIC,
		[  8932] = F.BASIC,
		[ 17406] = F.BASIC,
		[ 27857] = F.BASIC,
		[ 29448] = F.BASIC,
		[ 30458] = F.BASIC,
		[ 33443] = F.BASIC,
		[ 35952] = F.BASIC,
		[ 44607] = F.BASIC,
		[ 44608] = F.BASIC,
		[ 44749] = F.BASIC,
		[ 58258] = F.BASIC,
		[ 58259] = F.BASIC,
		[ 81414] = F.BASIC,
		[ 81921] = F.BASIC,
		[ 81922] = F.BASIC,
		[  3665] = F.BONUS,
		[ 12218] = F.BONUS,
		[ 81401] = F.BONUS,
		[ 81414] = F.BONUS,
	},
	[FOM_DIET_FRUIT] = {
		-- Mists and before
		[  4536] = F.BASIC,
		[  4537] = F.BASIC,
		[  4538] = F.BASIC,
		[  4539] = F.BASIC,
		[  4602] = F.BASIC,
		[  8953] = F.BASIC,
		[ 16168] = F.BASIC,
		[ 19994] = F.BASIC,
		[ 20031] = F.BASIC,
		[ 21030] = F.BASIC,
		[ 21031] = F.BASIC,
		[ 21033] = F.BASIC,
		[ 22324] = F.BASIC,
		[ 27856] = F.BASIC,
		[ 28112] = F.BASIC,
		[ 29393] = F.BASIC,
		[ 29450] = F.BASIC,
		[ 35948] = F.BASIC,
		[ 35949] = F.BASIC,
		[ 37252] = F.BASIC,
		[ 40356] = F.BASIC,
		[ 43087] = F.BASIC,
		[ 58264] = F.BASIC,
		[ 58265] = F.BASIC,
		[ 58278] = F.BASIC,
		[ 60267] = F.BASIC,
		[ 74643] = F.BASIC,
		[ 75026] = F.BASIC,
		[ 79320] = F.BASIC,
		[ 81919] = F.BASIC,
		[ 81920] = F.BASIC,
		[ 86057] = F.BASIC,
		[ 86074] = F.BASIC,
		[ 11950] = F.BONUS,
		[ 13810] = F.BONUS,
		[ 20516] = F.BONUS,
		[ 24009] = F.BONUS,
		[ 32721] = F.BONUS,
		[ 74643] = F.BONUS,
		[ 79320] = F.BONUS,
		[ 81403] = F.BONUS,
		[ 81411] = F.BONUS,
		[ 86074] = F.BONUS,
		[ 74840] = F.INEDIBLE,
		[ 74841] = F.INEDIBLE,
		[ 74842] = F.INEDIBLE,
		[ 74843] = F.INEDIBLE,
		[ 74844] = F.INEDIBLE,
		[ 74846] = F.INEDIBLE,
		[ 74847] = F.INEDIBLE,
		[ 74848] = F.INEDIBLE,
		[ 74849] = F.INEDIBLE,
		[ 74850] = F.INEDIBLE,
	},
	[FOM_DIET_FUNGUS] = {
		-- Mists and before
		[  3448] = F.BASIC,
		[  4604] = F.BASIC,
		[  4605] = F.BASIC,
		[  4606] = F.BASIC,
		[  4607] = F.BASIC,
		[  4608] = F.BASIC,
		[  8948] = F.BASIC,
		[ 27859] = F.BASIC,
		[ 29453] = F.BASIC,
		[ 30355] = F.BASIC,
		[ 33452] = F.BASIC,
		[ 35947] = F.BASIC,
		[ 41751] = F.BASIC,
		[ 58266] = F.BASIC,
		[ 58267] = F.BASIC,
		[ 58279] = F.BASIC,
		[ 59228] = F.BASIC,
		[ 81889] = F.BASIC,
		[ 81916] = F.BASIC,
		[ 24539] = F.BONUS,
		[ 24008] = F.BONUS,
		[ 81404] = F.BONUS,
		[ 81412] = F.BONUS,
		[ 27676] = F.INEDIBLE,
		
	},
};

FOM_Emotes = {
	["any"] = {	-- emotes for any pet (don't localize this line!)
		"Yum!",
		"Mmm, good stuff.",
		"Hey! Watch the fingers!",
		"Om nom nom nom...",
		"One gulp and it's gone!",
		"Mmm, delicious.",
		"Burp!",
		"Yay, bag space!",
	},
	
	["male"] = { -- emotes for any male pet (don't localize this line!)
		"Good boy!",
		"Atta boy!",
		"No more Mister Grumpy!",
	},
	["female"] = { -- emotes for any female pet (don't localize this line!)
		"Good girl!",
		"Atta girl!",
		"No more Miss Grumpy!",
	},
	
	-- emotes for when eating specific foods
	-- number on first line is itemID (use an addon or Wowhead to find it)
	[7974] = {	-- Zesty Clam Meat
		"Mmm, zesty!",
	},
	[12037] = {	-- Mystery Meat
		"Tastes like chicken.",
		"Tastes like tallstrider!",
		"Tastes like well-aged gnome.",
		"Tastes like... spider?",
	},
	[44072] = {	-- Roasted Mystery Beast
		"Tastes like chicken.",
		"Tastes like tallstrider!",
		"Tastes like well-aged gnome.",
		"Tastes like... spider?",
	},
	[59232] = {	-- Unidentifiable Meat Dish
		"Tastes like chicken.",
		"Tastes like tallstrider!",
		"Tastes like well-aged gnome.",
		"Tastes like... spider?",
	},
	[12217] = { -- Dragonbreath Chili
		"Yow, spicy!",
	},
	[4538] = { -- Snapvine Watermelon
		"What a big mouth!",
	},
	[8950] = { -- Homemade Cherry Pie
		"Tastes so good, makes a grown man cry.",
	},
	[27659] = { -- Warp Burger
		"Now how about some Nether Ray Fries?",
	},
	[41808] = { -- Bonescale Snapper
		"Crunchy!",
	},
	[41814] = { -- Glassfin Minnnow
		"Can has bigger fish?",
	},
	[43647] = { -- Shimmering Minnow
		"Can has bigger fish?",
	},
	-- emotes for categories of items
	-- use keys from LibPeriodicTable's Consumable.Food section
	-- TODO: need a PT-less way to key on both food diet and what we now call food type
	-- ["Consumable.Food.Edible.Bread.Conjured"] = {
	-- 	"Tastes great, less filling!",
	-- },
	-- ["Consumable.Food.Edible.Bread.Combo.Conjured"] = {
	-- 	"Tastes great, less filling!",
	-- },
	-- ["Consumable.Food.Inedible.Fish"] = {
	-- 	"Mmm, sashimi!",
	-- },
	
	-- emotes for entire diets
	[FOM_DIET_FUNGUS] = {
		"Trippy...",
	},

	-- emotes for specific pet families
	-- use keys from localization.lua
	[FOM_BOAR] = { 
		"Good piggy!"
	},
	[FOM_CAT] = { 
		"Nice kitty!", 
	},
	[FOM_HYENA] = { 
		"Good dog!", 
	},
	[FOM_WOLF] = { 
		"Good dog!", 
	},
	[FOM_SPIDER] = { 
		"Do you really have to wrap it up before eating it?", 
	},
	[FOM_RAPTOR] = { 
		"Down, dino!", 
	},
	[FOM_DEVILSAUR] = { 
		"Down, dino!", 
	},
	[FOM_CROCOLISK] = { 
		"Crikey, it snapped that up fast!", 
	},
	[FOM_CORE_HOUND] = {
		"What a good little puppy!",
		"Aww, they're sharing.",
		"Hey, don't fight over it!",
	},
	[FOM_CHIMAERA] = {
		"Hey, don't fight over it!",
	},
};


------------------------------------------------------
-- FOM_CookingScan.lua
------------------------------------------------------

local COOKING_SKILL_ID = "Cooking";

FOM_Cooking = {};

local DifficultyToNum = {
	["optimal"]	= 4,
	["orange"]	= 4,
	["medium"]	= 3,
	["yellow"]	= 3,
	["easy"]	= 2,
	["green"]	= 2,
	["trivial"]	= 1,
	["gray"]	= 1,
	["grey"]	= 1,
}

function FOM_ScanTradeSkill()

	local tradeSkillID, skillLineName, skillLineRank, skillLineMaxRank, skillLineModifier = GetTradeSkillLine();
	local num_recipes = GetNumTradeSkills()
	if num_recipes == 0
	  or tradeSkillID ~= COOKING_SKILL_ID then
		return -- should just get called again when ready
	end

	for recipeID = 1, num_recipes, 1 do

		local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(recipeID);

		if skillType == "header" or skillType == nil then -- skip header by increasing recipeID
			recipeID = recipeID +1
			skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(recipeID);
		end
		local difficulty;
		difficulty = DifficultyToNum[skillType];

		local createdItemLink = GetTradeSkillItemLink(recipeID);
		local _, _, id = string.find(createdItemLink, "item:(%d+)");
		local createdItemID = tonumber(id);

		local numReagents = GetTradeSkillNumReagents(recipeID);
		if numReagents > 0 then
			for reagent_Index = 1, numReagents, 1 do
				local reagentLink = GetTradeSkillReagentItemLink(recipeID, reagent_Index);
				local reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(recipeID, reagent_Index);
				if reagentLink then
					local _, _, itemID = string.find(reagentLink, "item:(%d+)");
					local reagentItemID = tonumber(itemID);
					if FOM_Cooking[reagentItemID] == nil then
						FOM_Cooking[reagentItemID] = {};
					end
					FOM_Cooking[reagentItemID][createdItemID] = difficulty;
				end		
			end
		end
	end
end


------------------------------------------------------
-- FeedOMatic.lua
------------------------------------------------------
-- letting these be global inside Ace callbacks causes bugs
local FOM_Config, FOM_IsInDiet, FOM_IsKnownFood, FOM_CategoryNames, FOM_FoodsUIList

-- Food quality by itemLevel
--
-- levelDelta = petLevel - foodItemLevel
-- levelDelta > 30 = won't eat
FOM_DELTA_EATS = 30;	-- 30 >= levelDelta > 20 = 8 happiness per tick
FOM_DELTA_LIKES = 20;   -- 20 >= levelDelta > 10 = 17 happiness per tick
FOM_DELTA_LOVES = 10;   -- 10 >= levelDelta = 35 happiness per tick

-- constants
MAX_KEEPOPEN_SLOTS = 150;
FOM_FEED_PET_SPELL_ID = 6991;
FOM_COOKING_SPELL_ID = 2550;

-- Variables
FOM_LastPetName = nil;

FOM_DifficultyColors = {
	QuestDifficultyColors["trivial"],
	QuestDifficultyColors["standard"],
	QuestDifficultyColors["difficult"],
	QuestDifficultyColors["verydifficult"],
	QuestDifficultyColors["impossible"],
};

FOM_CategoryNames = { -- localized keys for FOM_FoodTypes indexes
	FOM_OPTIONS_FOODS_CONJURED,
	FOM_OPTIONS_FOODS_BASIC,
	FOM_OPTIONS_FOODS_BONUS,
	FOM_OPTIONS_FOODS_INEDIBLE,
};

FOM_DietColors = { -- convenient reuse of familiar colors?
	[FOM_DIET_MEAT]		= RAID_CLASS_COLORS.PALADIN,
	[FOM_DIET_FISH]		= RAID_CLASS_COLORS.PRIEST,
	[FOM_DIET_BREAD]	= RAID_CLASS_COLORS.ROGUE,
	[FOM_DIET_CHEESE]	= RAID_CLASS_COLORS.WARRIOR,
	[FOM_DIET_FRUIT]	= RAID_CLASS_COLORS.DRUID,
	[FOM_DIET_FUNGUS]	= RAID_CLASS_COLORS.WARLOCK,
	[FOM_DIET_MECH]		= RAID_CLASS_COLORS.PRIEST,
};

function FOM_FeedButton_PostClick(self, button, down)
	if (not FOM_GetFeedPetSpellName()) then
		local version = "0.1";
		local level = GetSpellLevelLearned(slotID);
		local diagnostic = "";
		if ( level and level > UnitLevel("player") ) then
			diagnostic = "This spell requires level "..level..".";
		end
		GFWUtils.PrintOnce(GFWUtils.Red("Feed-O-Matic v."..version.." error:").."Can't find Feed Pet spell. "..diagnostic);
		return;
	end
	if (not down) then
		if (button == "RightButton") then
			GFW_FeedOMatic:ShowConfig();
		elseif (FOM_NextFoodLink and not FOM_NoFoodError and not InCombatLockdown()) then
			-- successful feed, messages are produced elsewhere
		elseif (FOM_NoFoodError and not IsAltKeyDown()) then
			if (FOM_NextFoodLink) then
				GFWUtils.Note(FOM_NoFoodError.."\n"..string.format(FOM_FALLBACK_MESSAGE, FOM_NextFoodLink));
			else
				GFWUtils.Note(FOM_NoFoodError);
			end
		end
	end
end

function FOM_GetColoredDiet()
	local dietList = {GetPetFoodTypes()};
	local coloredDiets = {};
	for _, dietName in pairs(dietList) do 
		local color = FOM_DietColors[dietName];
		local coloredText = CreateColor(color.r, color.g, color.b):WrapTextInColorCode(dietName);
		table.insert(coloredDiets, coloredText);
	end
	return table.concat(coloredDiets, ", ");
end

function FOM_FeedButton_OnEnter()
	if (FOM_Config.NoFeedButtonTooltip) then return; end
	
	FOM_FeedTooltip:SetOwner(FOM_FeedButton, "ANCHOR_RIGHT");
	local blankLine = false;
	local linesAdded = 0;
	if (FOM_NextFoodLink) then

		-- food to be used on click
		local bag = FOM_FeedButton:GetAttribute("target-bag");
		local slot = FOM_FeedButton:GetAttribute("target-slot");
		FOM_FeedTooltip:SetBagItem(bag,slot);
		
		if (FOM_NoFoodError) then
			-- fallback instructions
			FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP1_FALLBACK);
			FOM_FeedTooltip:AddLine(" ");
			blankLine = true;
			FOM_FeedTooltip:AddLine(FOM_NoFoodError, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1);
			linesAdded = linesAdded + 1;
		else
			-- left click to feed
			FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP1);
		end
	else
		-- no food
		FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP_NOFOOD);
		blankLine = true;
		FOM_FeedTooltip:AddLine(FOM_NoFoodError, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1);
		linesAdded = linesAdded + 1;
	end
	if (not blankLine) then
		FOM_FeedTooltip:AddLine(" ");
	end
	
	-- diet summary
	FOM_FeedTooltip:AddDoubleLine(string.format(FOM_BUTTON_TOOLTIP_DIET, UnitName("pet")), FOM_GetColoredDiet());
	linesAdded = linesAdded + 1;

	-- right click for options
	FOM_FeedTooltip:AddLine(FOM_BUTTON_TOOLTIP2, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	linesAdded = linesAdded + 1;
	
	-- putting an item in the tooltip shrinks all further text
	-- set it back only if we've set an item
	if (FOM_NextFoodLink) then
		local numLines = FOM_FeedTooltip:NumLines();
		for lineNum = numLines - linesAdded + 1, numLines do
			local line = _G["FOM_FeedTooltipTextLeft"..lineNum];
			local r, g, b, a = line:GetTextColor();
			line:SetFontObject("GameFontNormal");
			line:SetTextColor(r, g, b, a);
		end
	end
	FOM_FeedTooltip:Show();

	-- muck with our special tooltip so it looks right
	FOM_FeedTooltip:SetHeight(FOM_FeedTooltip:GetHeight() + 12 + FOM_FeedTooltipHeader:GetHeight());
	FOM_FeedTooltipTextLeft1:SetFontObject("GameFontNormal");
	FOM_FeedTooltipTextLeft1:ClearAllPoints();
	FOM_FeedTooltipTextLeft1:SetPoint("TOPLEFT", FOM_FeedTooltipHeader, "BOTTOMLEFT", 0, -12);
	FOM_FeedTooltipTextLeft1:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft2:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft3:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft4:SetJustifyH("LEFT");
end

function FOM_FeedButton_OnLeave()
	FOM_FeedTooltip:Hide();
end

function FOM_OnLoad(self)
	-- Register for Events
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("SPELLS_CHANGED");

	-- Register Slash Commands
	SLASH_FEEDOMATIC1 = "/feedomatic";
	SLASH_FEEDOMATIC2 = "/fom";
	SLASH_FEEDOMATIC3 = "/feed";
	SLASH_FEEDOMATIC4 = "/petfeed"; -- Rauen's PetFeed compatibility
	SLASH_FEEDOMATIC5 = "/pf";
	SlashCmdList["FEEDOMATIC"] = function(msg)
		FOM_ChatCommandHandler(msg);
	end
		
	BINDING_HEADER_GFW_FEEDOMATIC = FOM_BUTTON_TOOLTIP1; -- gets us the localized title if needed
end

function FOM_HookTooltip(frame)
	if (frame:GetScript("OnTooltipSetItem")) then
		frame:HookScript("OnTooltipSetItem", FOM_OnTooltipSetItem);
	else
		frame:SetScript("OnTooltipSetItem", FOM_OnTooltipSetItem);
	end
end

function FOM_OnTooltipSetItem(self)
	if FOM_Config.Tooltip then
		local _, link = self:GetItem();
		if not link then return false; end
		
		local itemID = FOM_IDFromLink(link);
		local foodDiet = FOM_IsKnownFood(itemID);
		if not foodDiet then return false; end
	
		-- if edible at all, label diet in tooltip
		local color = FOM_DietColors[foodDiet];
		local coloredText = CreateColor(color.r, color.g, color.b):WrapTextInColorCode(foodDiet);
		local label = _G[self:GetName().."TextRight1"]
		label:SetText(coloredText);
		label:Show();
		
		-- if edible by current pet, add line for quality
		if (link and UnitExists("pet")) then
			for _, petDiet in pairs({GetPetFoodTypes()}) do
				if petDiet == foodDiet then
					return FOM_TooltipAddFoodQuality(self, itemID);
				end
			end
			return true;
		end
	else
		return false;
	end
end

function FOM_TooltipAddFoodQuality(self, itemID)
	local _, _, _, itemLevel = GetItemInfo(itemID);
	if (itemLevel) then
		local levelDelta = UnitLevel("pet") - itemLevel;
		local petName = UnitName("pet");
		if (levelDelta >= FOM_DELTA_EATS) then
			color = QuestDifficultyColors["trivial"];
			self:AddLine(string.format(FOM_QUALITY_UNDER, petName), color.r, color.g, color.b);
			return true;
		elseif (levelDelta >= FOM_DELTA_LIKES and levelDelta < FOM_DELTA_EATS) then
			color = QuestDifficultyColors["standard"];
			self:AddLine(string.format(FOM_QUALITY_WILL, petName), color.r, color.g, color.b);
			return true;
		elseif (levelDelta >= FOM_DELTA_LOVES and levelDelta < FOM_DELTA_LIKES) then
			color = QuestDifficultyColors["difficult"];
			self:AddLine(string.format(FOM_QUALITY_LIKE, petName), color.r, color.g, color.b);
			return true;
		elseif (levelDelta < FOM_DELTA_LOVES) then
			color = QuestDifficultyColors["verydifficult"];
			self:AddLine(string.format(FOM_QUALITY_LOVE, petName), color.r, color.g, color.b);
			return true;
		end
	end
end

function FOM_GetFeedPetSpellName()
	-- we can get the spell name from the ID
	local _;
	FOM_FeedPetSpellName, _, FOM_FeedPetSpellIcon = GetSpellInfo(FOM_FEED_PET_SPELL_ID);
	
	BINDING_NAME_FOM_FEED = FOM_FeedPetSpellName;
	
	-- but we also want to know whether the player knows the spell	
	if (IsPlayerSpell(FOM_FEED_PET_SPELL_ID)) then
		return FOM_FeedPetSpellName;
	end
	
	return nil;
end

function FOM_Initialize(self)
	local _, realClass = UnitClass("player");
	if (realClass ~= "HUNTER") then
	 	self:UnregisterAllEvents();
		return;
	end
	
	if (UnitLevel("player") < 10) then return; end
		
	-- track whether foods are useful for Cooking 
	self:RegisterEvent("TRADE_SKILL_SHOW");
	self:RegisterEvent("TRADE_SKILL_DATA_SOURCE_CHANGED");
	self:RegisterEvent("TRADE_SKILL_LIST_UPDATE");
	self:RegisterEvent("TRADE_SKILL_DETAILS_UPDATE");

	-- Catch when feeding happened so we can notify/emote
	self:RegisterEvent("CHAT_MSG_PET_INFO");
	
	-- Only subscribe to inventory updates once we're in the world
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_LEAVING_WORLD");

	-- Events for trying to catch when the pet needs feeding
	self:RegisterEvent("UNIT_PET");
	self:RegisterEvent("PET_BAR_SHOWGRID");
	self:RegisterEvent("UNIT_NAME_UPDATE");
	self:RegisterEvent("PET_BAR_UPDATE");
	self:RegisterEvent("PET_UI_UPDATE");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");

	-- events for managing feed button
	self:RegisterEvent("SPELL_UPDATE_COOLDOWN");
	self:RegisterEvent("SPELL_UPDATE_USABLE");
	
	-- create feed button
	FOM_FeedButton = CreateFrame("Button", "FOM_FeedButton", PetFrame, "ActionButtonTemplate,SecureActionButtonTemplate");
	FOM_FeedButton:SetWidth(26);
	FOM_FeedButton:SetHeight(26);
	FOM_FeedButtonNormalTexture:SetTexture("");
	FOM_FeedButton:SetPoint("RIGHT", PetFrame, "LEFT", 3, -3);
	FOM_FeedButton:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	FOM_FeedButton:SetScript("PostClick", FOM_FeedButton_PostClick);
	FOM_FeedButton:SetScript("OnEnter", FOM_FeedButton_OnEnter);
	FOM_FeedButton:SetScript("OnLeave", FOM_FeedButton_OnLeave);
	if (FOM_Config.NoButton) then
		FOM_FeedButton:Hide();
	end

	
	-- set key binding to click FOM_FeedButton
	FOM_UpdateBindings();
	self:RegisterEvent("UPDATE_BINDINGS");
	
	FOM_HookTooltip(GameTooltip);
	FOM_HookTooltip(ItemRefTooltip);
	FOM_HookTooltip(FOM_FeedTooltip);
	
	Frame_GFW_FeedOMatic:SetScript("OnUpdate", FOM_OnUpdate);

	self:UnregisterEvent("VARIABLES_LOADED");
	self:UnregisterEvent("SPELLS_CHANGED");

	FOM_Initialized = true;	
end

function FOM_OnEvent(self, event, arg1, arg2)
	--print(event)

	if ( event == "VARIABLES_LOADED" or event == "SPELLS_CHANGED") then
				
		if (not FOM_Initialized) then FOM_Initialize(self); end
		FOM_PickFoodQueued = true;
		
	elseif ( event == "UPDATE_BINDINGS" ) then

		FOM_UpdateBindings();
		return;
		
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then

		self:RegisterEvent("BAG_UPDATE");
		if (InCombatLockdown()) then
			FOM_PickFoodQueued = true;
		else
			FOM_PickFoodForButton();
		end
		return;

	elseif ( event == "PLAYER_LEAVING_WORLD" ) then

		self:UnregisterEvent("BAG_UPDATE");
		
	elseif (event == "BAG_UPDATE" ) then
		
		if (arg1 < 0 or arg1 > 4) then return; end	-- don't bother looking in keyring, bank, etc for food
		if (FOM_IsSpecialBag(arg1)) then return; end	-- don't look in bags that can't hold food, either
		
		FOM_PickFoodQueued = true;
	
	elseif ((event == "UNIT_NAME_UPDATE" and arg1 == "pet") or event == "PET_BAR_UPDATE" or event == "PLAYER_REGEN_ENABLED") then
	
		FOM_PickFoodQueued = true;
	
	elseif event == "TRADE_SKILL_SHOW"
	  or event == "TRADE_SKILL_DETAILS_UPDATE"
	  or event == "TRADE_SKILL_LIST_UPDATE"
	  or event == "TRADE_SKILL_DATA_SOURCE_CHANGED" then
		FOM_ScanTradeSkill();
		return;

	elseif (event == "CHAT_MSG_PET_INFO") then
		if (not FOM_FEEDPET_LOG_FIRSTPERSON) then
			FOM_FEEDPET_LOG_FIRSTPERSON = GFWUtils.FormatToPattern(FEEDPET_LOG_FIRSTPERSON);
		end
		local _, _, foodEaten = string.find(arg1, FOM_FEEDPET_LOG_FIRSTPERSON);
		if (foodEaten) then
			local foodName = foodEaten;
			if (FOM_NextFoodLink and FOM_NameFromLink(FOM_NextFoodLink) == foodEaten) then
				foodName = FOM_NextFoodLink;
			end
			local pet = UnitName("pet");
			if (pet) then
				if ( FOM_Config.AlertType == 2) then
					GFWUtils.Print(string.format(FOM_FEEDING_EAT, pet, foodName));
				elseif ( FOM_Config.AlertType == 1) then
					SendChatMessage(string.format(FOM_FEEDING_FEED, pet, foodName).. FOM_RandomEmote(foodName), "EMOTE");
				end
			end
		end
	elseif (event == "SPELL_UPDATE_COOLDOWN") then
		local start, duration, enable = GetSpellCooldown(FOM_FEED_PET_SPELL_ID);
		CooldownFrame_Set(FOM_FeedButtonCooldown, start, duration, enable);
	elseif (event == "SPELL_UPDATE_USABLE") then
		local isUsable, notEnoughtMana = IsUsableSpell(FOM_FEED_PET_SPELL_ID);
		if (not isUsable) then
			FOM_FeedButtonIcon:SetVertexColor(0.4, 0.4, 0.4);
		elseif (FOM_NoFoodError) then
			FOM_FeedButtonIcon:SetVertexColor(0.5, 0.5, 0.1);
		else
			FOM_FeedButtonIcon:SetVertexColor(1, 1, 1);
		end		
	end
	
	if (FOM_PickFoodQueued and not InCombatLockdown()) then
		FOM_PickFoodForButton();
	end

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
		FOM_FoodsPanel.refresh();
	end

	if FOM_FeedButtonCount ~= nil then
		FOM_FeedButtonCount:SetText(GetItemCount(FOM_NextFoodLink))
	end
end

function FOM_UpdateBindings()
	if (not InCombatLockdown()) then
		ClearOverrideBindings(FOM_FeedButton);
		local key = GetBindingKey("FOM_FEED");
		if (key) then
			SetOverrideBindingClick(FOM_FeedButton, nil, key, "FOM_FeedButton");
		end
	end
end

-- Update our list of quest objectives so we can avoid consuming food we want to accumulate for a quest.
function FOM_ScanQuests()
	for questNum = 1, GetNumQuestLogEntries() do
		local _, _, _, _, isHeader, isCollapsed, isComplete  = GetQuestLogTitle(questNum);
		if (not isHeader) then
			for objectiveNum = 1, GetNumQuestLeaderBoards(questNum) do
				local text, type, finished = GetQuestLogLeaderBoard(objectiveNum, questNum);
				if (text and strlen(text) > 0) then
					local objectiveName, numCurrent, numRequired;
					if (GetLocale() == "zhCN") then
						_, _, objectiveName, numCurrent, numRequired = string.find(text, "(.*)：(%d+)/(%d+)");
					else
						_, _, objectiveName, numCurrent, numRequired = string.find(text, "(.*): (%d+)/(%d+)");
					end
					if (objectiveName) then
						local _, link = GetItemInfo(objectiveName);
						-- not guaranteed to get us a link if we don't have the item,
						-- but we shouldn't be here unless we have the item anyway.
						local itemID = FOM_IDFromLink(link);
						if (itemID and FOM_IsKnownFood(itemID)) then
							if (FOM_QuestFood == nil) then
								FOM_QuestFood = { };
							end
							if (FOM_QuestFood[itemID] == nil) then
								FOM_QuestFood[itemID] = tonumber(numRequired);
							else             
								FOM_QuestFood[itemID] = max(FOM_QuestFood[itemID], tonumber(numRequired));
							end
						end
					end
				end
			end
		end
	end
end

function FOM_ChatCommandHandler(msg)
	if ( msg == "" ) then
		GFW_FeedOMatic:ShowConfig();
		return;
	end
		
	-- Print Help
	if ( msg == "help" ) then
		GFWUtils.Print("GFW_FeedOmatic v0.1:");
		GFWUtils.Print("/feedomatic /fom <command>");
		GFWUtils.Print("- "..GFWUtils.Hilite("help").." - Print this helplist.");
		GFWUtils.Print("- "..GFWUtils.Hilite("reset").." - Reset to default settings.");
		GFWUtils.Print("- "..GFWUtils.Hilite("notooltip").." - Disable/enable feed button tooltip.");
		return;
	end

	if ( msg == "notooltip" ) then
		FOM_Config.NoFeedButtonTooltip = not FOM_Config.NoFeedButtonTooltip;
		GFWUtils.Print((FOM_Config.NoFeedButtonTooltip and "Not " or "").."Showing feed button tooltip.");
	end
	
	-- Reset Variables
	if ( msg == "reset" ) then
		GFW_FeedOMatic.db:ResetProfile();
		FOM_QuestFood = nil;
		GFWUtils.Print("Feed-O-Matic configuration reset.");
		return;
	end
	
	-- if we got down to here, we got bad input
	FOM_ChatCommandHandler("help");
end

function FOM_PickFoodForButton()
	if (not FOM_GetFeedPetSpellName()) then
		return;
	end
	local pet = UnitName("pet");
	if (not pet) then 
		FOM_PickFoodQueued = true;
		return;
	end
	local dietList = {GetPetFoodTypes()};
	if ( dietList == nil or #dietList == 0) then
		FOM_PickFoodQueued = true;
		FOM_FeedButton:Hide();
		return;
	elseif (not FOM_Config.NoButton) then
		FOM_FeedButton:Show();
	end
	
	local foodBag, foodSlot, foodIcon;
	foodBag, foodSlot, FOM_NextFoodLink, foodIcon = FOM_NewFindFood();
	FOM_SetupButton(foodBag, foodSlot);
	
	if ( foodBag == nil) then
		local fallbackBag, fallbackSlot;
		fallbackBag, fallbackSlot, FOM_NextFoodLink, foodIcon = FOM_NewFindFood(1);
		if (fallbackBag) then
			FOM_NoFoodError = string.format(FOM_ERROR_NO_FOOD_NO_FALLBACK, pet);
			FOM_SetupButton(fallbackBag, fallbackSlot, "alt");
			FOM_FeedButtonIcon:SetTexture(foodIcon);
			FOM_FeedButtonCount:SetText(GetItemCount(FOM_NextFoodLink))
		else
			-- No Food Could be Found
			FOM_NoFoodError = string.format(FOM_ERROR_NO_FOOD, pet);
			FOM_NextFoodLink = nil;
			FOM_FeedButtonIcon:SetTexture(FOM_FeedPetSpellIcon);
			--GFWUtils.Print("Can't feed? #SortedFoodList:"..#SortedFoodList);
			--DevTools_Dump(GetPetFoodTypes());
			FOM_FeedButtonCount:SetText("")
			
		end
		
		FOM_FeedButtonIcon:SetVertexColor(0.5, 0.5, 1);
	else
		FOM_NoFoodError = nil;
		FOM_FeedButtonIcon:SetVertexColor(1, 1, 1);
		FOM_FeedButtonIcon:SetTexture(foodIcon);
		FOM_FeedButtonCount:SetText(GetItemCount(FOM_NextFoodLink))
		
	end
	
	-- debug
	if (false and FOM_NextFoodLink) then
		if (FOM_NoFoodError) then
			GFWUtils.PrintOnce("Next food (fallback):"..FOM_NextFoodLink, 1);
		else
			GFWUtils.PrintOnce("Next food:"..FOM_NextFoodLink, 1);
		end
	end
end

function FOM_SetupButton(bag, slot, modifier)
	if (not FOM_GetFeedPetSpellName()) then
		return;
	end
	if (modifier) then
		modifier = modifier.."-";
	else
		modifier = "";
	end
	if (bag and slot) then
		FOM_FeedButton:SetAttribute(modifier.."type1", "spell");
		FOM_FeedButton:SetAttribute(modifier.."spell1", FOM_FeedPetSpellName);
		FOM_FeedButton:SetAttribute("target-bag", bag);
		FOM_FeedButton:SetAttribute("target-slot", slot);
	else
		FOM_FeedButton:SetAttribute(modifier.."type", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."spell", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."type1", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."spell1", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute("target-bag", nil);
		FOM_FeedButton:SetAttribute("target-slot", nil);
	end
	FOM_PickFoodQueued = nil;
end

function FOM_RandomEmote(foodLink)
	local localeEmotes = FOM_Emotes; --FOM_Emotes[GetLocale()];
	if (localeEmotes) then
		local randomEmotes = {};
		if (UnitSex("pet") == 2) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["male"]);
		elseif (UnitSex("pet") == 3) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["female"]);
		end
		
		local itemID = FOM_IDFromLink(foodLink);
		if (itemID) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[itemID]);

			local diet = FOM_DietForFood(itemID);
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[diet]);
		end
			
		randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[UnitCreatureFamily("pet")]);
		randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["any"]);
	
		return randomEmotes[math.random(table.getn(randomEmotes))];
	else
		return "";
	end
end

function FOM_FlatFoodList(fallback)
	local foodList = {};
	local petLevel = UnitLevel("pet");
	for bagNum = 0, 4 do
		if (not FOM_IsSpecialBag(bagNum)) then
		-- skip bags that can't contain food
			for itemNum = 1, GetContainerNumSlots(bagNum) do
				local itemLink = GetContainerItemLink(bagNum, itemNum);
				local itemID = FOM_IDFromLink(itemLink);
				-- debug
				--if (bagNum == 0 and itemNum == 1) then _, itemLink = GetItemInfo(21023); end
				if (itemID) then
					local itemIcon, itemCount = GetContainerItemInfo(bagNum, itemNum);
					-- debug
					--if (bagNum == 0 and itemNum == 1) then itemCount = 10; end
					local _, _, _, level = GetItemInfo(itemID);
					if (not level) then
						-- how can we not have cached info for an item in your bags?
						-- make sure it's cached for future runs
						FOMTooltip:SetHyperlink("item:"..itemID);
					elseif (petLevel - level < FOM_DELTA_EATS) then
						local diet = FOM_IsInDiet(itemID);
						if ( diet ) then
							local avoid = FOM_ShouldAvoidFood(itemID, itemCount, diet);
							if (fallback or not avoid) then
								local categoryIndex = FOM_Foods[diet][itemID];
								table.insert(foodList, {bag=bagNum, slot=itemNum, link=itemLink, count=itemCount, delta=(petLevel - level), priority=categoryIndex, icon=itemIcon});
							end
						end
					end
				end
			end
		end
	end
	return foodList;
end

function FOM_NewFindFood(fallback)
	SortedFoodList = FOM_FlatFoodList(fallback);

	-- if there are any conjured foods, drop everything else from the list
	local tempFoodsOnly = {};
	for _, foodInfo in pairs(SortedFoodList) do
		if (foodInfo.temp) then
			table.insert(tempFoodsOnly, foodInfo);
		end
	end
	if (table.getn(tempFoodsOnly) > 0) then
		SortedFoodList = tempFoodsOnly;
	end
	
	local function sortCount(a, b)
		return a.count < b.count;
	end
	local function sortQualityDescending(a, b)
		return a.delta < b.delta;
	end
	local function sortQualityAscending(a, b)
		return a.delta > b.delta;
	end
	local function sortPriority(a, b)
		return a.priority < b.priority;
	end
	table.sort(SortedFoodList, sortCount); -- small stacks first
	if (not FOM_Config.UseLowLevelFirst) then
		table.sort(SortedFoodList, sortQualityDescending); -- higher quality first
	else
		table.sort(SortedFoodList, sortQualityAscending); -- lower quality first
	end
	table.sort(SortedFoodList, sortPriority); -- category priorities (conjured ahead of normal ahead of bonus etc)

	for _, foodInfo in pairs(SortedFoodList) do
		return foodInfo.bag, foodInfo.slot, foodInfo.link, foodInfo.icon;
	end
	
	return nil;
end

function FOM_ShouldAvoidFood(itemID, quantity, diet)
	if (FOM_Config.excludedFoods[itemID]) then
		return true;
	end
	local foodName = GetItemInfo(itemID);
	if (foodName == nil) then
		return false;
	end
	if (FOM_Config.AvoidQuestFood) then
		if (FOM_IsQuestFood(itemID, quantity)) then
			return true;
		end
	end
	for category in pairs(FOM_Config.excludedCategories) do
		local foodCategory = FOM_Foods[diet][itemID];
		if (category == foodCategory ) then
			return true;
		end
	end
	return false;
end

function FOM_IsQuestFood(itemID, quantity)
	FOM_ScanQuests();
	if (FOM_QuestFood and FOM_QuestFood[itemID]) then
		return GetItemCount(itemID) <= FOM_QuestFood[itemID];
	end
end

function FOM_IsInDiet(foodItemID, dietList)

	-- pass no dietList to query against current pet's diets
	if ( dietList == nil ) then
		dietList = {GetPetFoodTypes()};
	end
	-- no current pet means try again later
	if ( dietList == nil or #dietList == 0) then
		FOM_PickFoodQueued = true;
		return nil;
	end
	if (type(dietList) ~= "table") then
		dietList = {dietList};
	end
	
	for _, diet in pairs(dietList) do
		local table = FOM_Foods[diet];
		if (table and table[foodItemID] ~= nil) then
			return diet;
		end
	end
	
	return nil;
end
FOM_DietForFood = FOM_IsInDiet

function FOM_IsKnownFood(itemID)
	return FOM_IsInDiet(itemID, {FOM_DIET_MEAT, FOM_DIET_FISH, FOM_DIET_BREAD, FOM_DIET_CHEESE, FOM_DIET_FRUIT, FOM_DIET_FUNGUS, FOM_DIET_MECH});
end

function FOM_IsSpecialBag(bagNum)
	-- this used to be for quivers, but they're obsolete (and gone?) now
	-- other special bags can't contain food, though, so we may as well skip 'em
	if (bagNum == 0) then return false; end
	local _, bagType = GetContainerNumFreeSlots(bagNum);
	return bagType ~= 0; 	
end

function FOM_IDFromLink(itemLink)
	if (itemLink == nil) then return nil; end
	local _, _, itemID  = string.find(itemLink, "item:(%d+)");
	if (tonumber(itemID)) then
		return tonumber(itemID);
	else
		return nil;
	end
end

function FOM_NameFromLink(itemLink)
	if (itemLink == nil) then return nil; end
	local _, _, name = string.find(itemLink, "%[(.-)%]"); 
	if (name) then
		return name;
	end
	return itemLink;
end

------------------------------------------------------
-- foods list options pansl
------------------------------------------------------

local FOM_LIST_HEIGHT = 24;
local FOM_MAX_LIST_DISPLAYED = 10;
local MAX_COOKING_RESULTS = 6;

function FOM_BuildFoodsUI(panel)
	
	FOM_FoodsPanel = panel;
		
	local borderFrame = CreateFrame("Frame", "FOM_FoodListBorder", panel, "OptionsBoxTemplate");
	borderFrame:SetHeight(273);
	borderFrame:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 15, 15);
	borderFrame:SetPoint("RIGHT", panel, -15, 0);
	borderFrame:Show();
	
	local headerBgLeft = panel:CreateTexture("FOM_FoodList_HeaderBGLeft", "ARTWORK");
	headerBgLeft:SetTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton");
	headerBgLeft:SetDesaturated(1);
	headerBgLeft:SetTexCoord(0, 1, 0, 0.28125);
	headerBgLeft:SetHeight(24);
	headerBgLeft:SetPoint("TOPLEFT",borderFrame,"TOPLEFT",5,-5);
	headerBgLeft:SetPoint("RIGHT",borderFrame,-66,0);
	headerBgLeft:Show();

	local headerBgRight = panel:CreateTexture("FOM_FoodList_HeaderBGRight", "ARTWORK");
	headerBgRight:SetTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton");
	headerBgRight:SetDesaturated(1);
	headerBgRight:SetTexCoord(0, 0.14453125, 0.296875, 0.578125);
	headerBgRight:SetWidth(61);
	headerBgRight:SetHeight(24);
	headerBgRight:SetPoint("TOPRIGHT",borderFrame,"TOPRIGHT",-5,-5);
	
	local s = panel:CreateFontString("FOM_FoodList_NameHeader", "OVERLAY", "GameFontNormalSmall");
	s:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 53, -12);
	s:SetText(FOM_OPTIONS_FOODS_NAME);
	
	s = panel:CreateFontString("FOM_FoodList_CookingHeader", "OVERLAY", "GameFontNormalSmall");
	s:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", -26, -12);
	s:SetText(FOM_OPTIONS_FOODS_COOKING);
	
	local listItem = CreateFrame("Button", "FOM_FoodList1", panel, "FOM_FoodListItemTemplate");
	listItem:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 5, -29);
	listItem:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", -24, -29);
	for i = 2, FOM_MAX_LIST_DISPLAYED do
		listItem = CreateFrame("Button", "FOM_FoodList" .. i, panel, "FOM_FoodListItemTemplate");
		listItem:SetPoint("TOPLEFT", "FOM_FoodList" .. (i - 1), "BOTTOMLEFT", 0, 0);
		listItem:SetPoint("TOPRIGHT", "FOM_FoodList" .. (i - 1), "BOTTOMRIGHT", 0, 0);
	end
	
	local scrollFrame = CreateFrame("ScrollFrame", "FOM_FoodListScrollFrame", panel, "FauxScrollFrameTemplate");
	scrollFrame:SetHeight(240);
	scrollFrame:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 5, -29);
	scrollFrame:SetPoint("RIGHT", borderFrame, -27, 0);
	scrollFrame:SetFrameLevel(scrollFrame:GetFrameLevel() + 5);
	scrollFrame:SetScript("OnVerticalScroll", function(self, offset) 
		FauxScrollFrame_OnVerticalScroll(self, offset, FOM_LIST_HEIGHT, FOM_FoodListUIUpdate);
	end);
end

function FOM_FoodListShowTooltip(button)
	if not button.item then return; end
	
	GameTooltip:SetHyperlink("item:"..button.item);
	if (button.recipe) then
		local c = FOM_DifficultyColors[button.difficulty];
		GameTooltip:AddDoubleLine(FOM_DIFFICULTY_HEADER, getglobal("FOM_DIFFICULTY_"..button.difficulty), c.r,c.g,c.b, c.r,c.g,c.b);
	end	
	GameTooltip:Show();
end

function FOM_FoodListButton_OnLoad(self)
	local name = self:GetName();
	self.check = getglobal(name.."Check");
	self.icon = getglobal(name.."Icon");
	self.name = getglobal(name.."Name");
	self.categoryLeft = getglobal(name.."CategoryLeft");
	self.categoryRight = getglobal(name.."CategoryRight");
	self.cookingIcons = {};
	self.cookingItems = {};
	for i = 1, MAX_COOKING_RESULTS do
		self.cookingIcons[i] = getglobal(name.."CreatedIcon"..i);
		self.cookingItems[i] = getglobal(name.."CreatedItem"..i);
	end
end

function FOM_FoodListButton_OnClick(self)
	if (self.header and not self.item) then
		if (FOM_Config.excludedCategories[self.header]) then
			FOM_Config.excludedCategories[self.header] = nil;
		else
			FOM_Config.excludedCategories[self.header] = 1;
		end
	elseif (self.item and not FOM_Config.excludedCategories[self.header]) then
		if (FOM_Config.excludedFoods[self.item]) then
			FOM_Config.excludedFoods[self.item] = nil;
		else
			FOM_Config.excludedFoods[self.item] = 1;
		end
	end
	FOM_FoodListUIUpdate();
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
end

function FOM_FoodListUI_UpdateList()
	FOM_FoodsUIList = {};
	for header = 1, #FOM_CategoryNames do
		local list = {};
		local uniqueList = {};
		-- build list of foods from matching criteria
		local petLevel = UnitLevel("player");	-- pet level is always == player level now
		local itemNamesCache = {};
		for diet, table in pairs(FOM_Foods) do
			for itemID, foodType in pairs(table) do
				local name, _, _, iLvl = GetItemInfo(itemID);
				local skip = false;
				if (name and header == foodType) then
					itemNamesCache[itemID] = name;
					local delta = petLevel - iLvl;
					if (FOM_Config.ShowOnlyInventory) then
						if (GetItemCount(itemID) == 0) then
							skip = true;
						end
					end
					-- TODO: invert diet check for efficiency now that we're inside a diet loop
					local dietChecked = false;
					if (not skip and FOM_Config.ShowOnlyPetFoods) then
						if (UnitExists("pet")) then
							if (not FOM_IsInDiet(itemID)) then
								skip = true;
							end
							dietChecked = true;
						end
						if (not skip and delta >= FOM_DELTA_EATS) then
							skip = true;
						end
					end
				
					if (not skip) then
						if (not uniqueList[itemID]) then
							tinsert(list, itemID);
						end
						if (delta >= FOM_DELTA_EATS) then
							uniqueList[itemID] = 3;
						elseif (delta >= FOM_DELTA_LIKES and delta < FOM_DELTA_EATS) then
							uniqueList[itemID] = 2;
						elseif (delta >= FOM_DELTA_LOVES and delta < FOM_DELTA_LIKES) then
							uniqueList[itemID] = 1;
						elseif (delta < FOM_DELTA_LOVES) then
							uniqueList[itemID] = 0;
						end
					end
				end
			end
		end

		-- sort list for display
		local function sortHigherQualityFirst(a,b)
			if (uniqueList[a] == uniqueList[b]) then
				return itemNamesCache[a] < itemNamesCache[b];
			else
				return uniqueList[a] < uniqueList[b];
			end
		end
		local function sortLowerQualityFirst(a,b)
			if (uniqueList[a] == uniqueList[b]) then
				return itemNamesCache[a] < itemNamesCache[b];
			else
				return uniqueList[a] > uniqueList[b];
			end
		end
		if (not FOM_Config.UseLowLevelFirst) then
			table.sort(list, sortHigherQualityFirst);
		else
			table.sort(list, sortLowerQualityFirst);
		end
		tinsert(FOM_FoodsUIList, header);
		for _, itemID in pairs(list) do
			tinsert(FOM_FoodsUIList, {id=itemID,header=header});
		end
	end
	FOM_List = FOM_FoodsUIList
	FOM_FoodListUIUpdate();
end

function FOM_FoodListUIUpdate()
	local numListItems = #FOM_FoodsUIList;
	local listOffset = FauxScrollFrame_GetOffset(FOM_FoodListScrollFrame);
	if (listOffset > numListItems - FOM_MAX_LIST_DISPLAYED) then
		listOffset = math.max(0, numListItems - FOM_MAX_LIST_DISPLAYED);
		FauxScrollFrame_SetOffset(FOM_FoodListScrollFrame, listOffset);
	end
	
	FauxScrollFrame_Update(FOM_FoodListScrollFrame, numListItems, FOM_MAX_LIST_DISPLAYED, FOM_LIST_HEIGHT);
	
	local petLevel = UnitLevel("player"); -- pet level is always == player level now
	if (UnitExists("pet")) then
		petLevel = UnitLevel("pet");
	end
	for i=1, FOM_MAX_LIST_DISPLAYED, 1 do
		local listIndex = i + listOffset;
		local listItem = FOM_FoodsUIList[listIndex];
		local listButton = getglobal("FOM_FoodList"..i);
		
		if ( listIndex <= numListItems ) then	
			-- Set button widths if scrollbar is shown or hidden
			if ( FOM_FoodListScrollFrame:IsShown() ) then
				listButton:SetWidth(350);
			else
				listButton:SetWidth(368);
			end
							
			listButton:SetID(listIndex);
			listButton:Show();
			
			if ( type(listItem) == "number" ) then
				-- it's a header
				listButton.header = listItem;
				listButton.item = nil;

				listButton.categoryRight:Show();
				listButton.categoryLeft:Show();
				listButton.icon:SetTexture("");
				listButton.name:SetText("");
				listButton:SetText(FOM_CategoryNames[listItem]);
				
				for iconIndex = 1, MAX_COOKING_RESULTS do
					listButton.cookingIcons[iconIndex]:SetTexture("");
					listButton.cookingItems[iconIndex]:Hide();
				end
				
				if (FOM_Config.excludedCategories[listItem]) then
					listButton.check:Hide();
				else
					listButton.check:Show();
				end
				listButton:SetAlpha(1);
				
			else
				listButton.header = listItem.header;
				listButton.item = listItem.id;
		
				listButton.categoryLeft:Hide();
				listButton.categoryRight:Hide();

				local name, _, _, iLvl, _, _, _, _, _, texture = GetItemInfo(listItem.id);
				listButton:SetText("");
				listButton.name:SetText(name);
				local color;
				local delta = petLevel - iLvl;
				if (delta > FOM_DELTA_EATS) then
					color = QuestDifficultyColors["trivial"];
				elseif (delta > FOM_DELTA_LIKES and delta <= FOM_DELTA_EATS) then
					color = QuestDifficultyColors["standard"];
				elseif (delta > FOM_DELTA_LOVES and delta <= FOM_DELTA_LIKES) then
					color = QuestDifficultyColors["difficult"];
				elseif (delta <= FOM_DELTA_LOVES) then
					color = QuestDifficultyColors["verydifficult"];
				end
				listButton.name:SetTextColor(color.r, color.g, color.b);
				listButton.icon:SetTexture(texture);

				-- show cooking results
				for iconIndex = 1, MAX_COOKING_RESULTS do
					listButton.cookingIcons[iconIndex]:SetTexture("");
					listButton.cookingItems[iconIndex]:Hide();
				end
				local recipes = FOM_Cooking[listItem.id];
				if (recipes) then
					local resultIndex = 1;
					for resultItemID, difficulty in pairs(recipes) do
						if (resultIndex > MAX_COOKING_RESULTS) then
							--print("too many recipes for item", listItem.id), resultIndex)
							break;
						end
						local icon = select(10, GetItemInfo(resultItemID));
						listButton.cookingIcons[resultIndex]:SetTexture(icon);
						listButton.cookingItems[resultIndex]:Show();
						listButton.cookingItems[resultIndex].item = resultItemID;
						listButton.cookingItems[resultIndex].recipe = true;
						listButton.cookingItems[resultIndex].difficulty = difficulty;

						if (difficulty < 5) then
							listButton.cookingIcons[resultIndex]:SetVertexColor(1, 1, 1);
						else
							listButton.cookingIcons[resultIndex]:SetVertexColor(0.4, 0.4, 0.4);
						end
						resultIndex = resultIndex + 1;
					end
				end
							
				if (FOM_Config.excludedFoods[listItem.id] or FOM_Config.excludedCategories[listItem.header]) then
					listButton.check:Hide();
				else
					listButton.check:Show();
				end
				
				if (FOM_Config.excludedCategories[listItem.header]) then
					listButton:SetAlpha(0.5);
				else
					listButton:SetAlpha(1);
				end
			end
			
		else
			listButton:Hide();
		end
	end
end

------------------------------------------------------
-- Ace3 options panel stuff
------------------------------------------------------

local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDB = LibStub("AceDB-3.0")

-- AceAddon Initialization
GFW_FeedOMatic = LibStub("AceAddon-3.0"):NewAddon("GFW_FeedOmatic")
GFW_FeedOMatic.date = gsub("$Date: 2012-12-27 22:17:15 -0800 (Thu, 27 Dec 2012) $", "^.-(%d%d%d%d%-%d%d%-%d%d).-$", "%1")

function GFW_FeedOMatic:OnProfileChanged(event, database, newProfileKey)
	-- this is called every time our profile changes (after the change)
	FOM_Config = database.profile

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
	end
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
end

local function getProfileOption(info)
	return FOM_Config[info.arg]
end

local function setProfileOption(info, value)
	FOM_Config[info.arg] = value

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
	end
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
	
	if (info.arg == "NoButton") then
		if (FOM_Config.NoButton) then
			FOM_FeedButton:Hide();
		else
			FOM_FeedButton:Show();
		end
	end
end

local options = {
	type = 'group',
	get = getProfileOption,
	set = setProfileOption,
	name = "GFW_FeedOmatic classic v0.1",
	args = {
		general = {
			type = 'group',
			order = -1,
			name = FOM_OPTIONS_GENERAL,
			desc = "foo",
			args = {
				tips = {
					type = "description",
					name = FOM_OPTIONS_SUBTEXT,
					order = 1,
				},
				tooltip = {
					type = 'toggle',
					order = 2,
					width = "double",
					name = FOM_OPTIONS_TOOLTIP,
					desc = FOM_OPTIONS_TOOLTIP_TIP,
					arg = "Tooltip",
				},
				useLowLevelFirst = {
					type = 'toggle',
					order = 3,
					width = "double",
					name = FOM_OPTIONS_LOW_LVL_1ST,
					desc = FOM_OPTIONS_LOW_LVL_1ST_TIP,
					arg = "UseLowLevelFirst",
				},
				avoidQuestFood = {
					type = 'toggle',
					order = 4,
					width = "double",
					name = FOM_OPTIONS_AVOID_QUEST,
					desc = FOM_OPTIONS_AVOID_QUEST_TIP,
					arg = "AvoidQuestFood",
				},
				alertType = {
					type = 'select',
					order = 5,
					name = FOM_OPTIONS_FEED_NOTIFY,
					values = {
						[1] = FOM_OPTIONS_NOTIFY_EMOTE,
						[2] = FOM_OPTIONS_NOTIFY_TEXT,
						[3] = FOM_OPTIONS_NOTIFY_NONE,
					},
					arg = "AlertType",
				},
				noButton = {
					type = 'toggle',
					order = 6,
					width = "double",
					name = FOM_OPTIONS_NO_BUTTON,
					desc = FOM_OPTIONS_NO_BUTTON_TIP,
					arg = "NoButton",
				},
				blank = {
					type = "header",
					name = FOM_OPTIONS_FOODS_TITLE,
					order = 10,
				},
				tips = {
					type = "description",
					name = FOM_OPTIONS_FOODS_TEXT,
					order = 11,
							   	},
							   	showOnlyPetFoods = {
							   	    type = 'toggle',
							   	    order = 12,
							   	    width = "double",
							   	    name = FOM_OPTIONS_FOODS_ONLY_PET,
					desc = function()
						if (UnitExists("pet")) then
							return format(FOM_OPTIONS_FOODS_ONLY_PET_TIP, UnitLevel("pet"), UnitCreatureFamily("pet")) .. "\n(".. FOM_GetColoredDiet()..")";
						else
							return format(FOM_OPTIONS_FOODS_ONLY_LVL_TIP, UnitLevel("player"));
						end
					end,
							   	    arg = "ShowOnlyPetFoods",
							   	},
							   	showOnlyInventory = {
							   	    type = 'toggle',
					order = 13,
					width = "double",
					name = FOM_OPTIONS_FOODS_ONLY_INV,
					arg = "ShowOnlyInventory",
				},
			},
		},
	},
}
local profileDefault = {
	Tooltip				= true,
	UseLowLevelFirst	= true,
	AvoidQuestFood		= true,
	AlertType			= 1,
	
	ShowOnlyPetFoods	= false,
	ShowOnlyInventory	= true,
	
	excludedCategories = {
		["Consumable.Food.Edible.Bonus"] = 1;
	},
	excludedFoods = {},
}
local defaults = {}
defaults.profile = profileDefault

function GFW_FeedOMatic:SetupOptions()
	-- Inject profile options
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.args.profile.order = -2
	-- Register options table
	AceConfig:RegisterOptionsTable("GFW_FeedOmatic", options)
	-- Setup Blizzard option frames
	self.optionsFrames = {}
	-- The ordering here matters, it determines the order in the Blizzard Interface Options
	self.optionsFrames.general = AceConfigDialog:AddToBlizOptions("GFW_FeedOmatic", FOM_TITLE, nil, "general")
	--self.optionsFrames.profile = AceConfigDialog:AddToBlizOptions("GFW_FeedOmatic", FOM_OPTIONS_PROFILE, "GFW_FeedOmatic", "profile")
	
	FOM_BuildFoodsUI(self.optionsFrames.general);
	local aceRefresh = self.optionsFrames.general.refresh;
	self.optionsFrames.general.refresh = function(...)
		if ... ~= nil then
			aceRefresh(...);
		end
		FOM_FoodListUI_UpdateList();
	end;
end

function GFW_FeedOMatic:OnInitialize()

	local _, realClass = UnitClass("player");
	if (realClass ~= "HUNTER") then
		return;
	end

	-- Create DB
	self.db = AceDB:New("GFW_FeedOMatic_DB", defaults, "Default")
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
	
	FOM_Config = self.db.profile
	self:SetupOptions()
end

function GFW_FeedOMatic:ShowConfig()
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.general)
	--Call a second time to work around bug: https://www.wowinterface.com/forums/showthread.php?t=54599
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.general)
end