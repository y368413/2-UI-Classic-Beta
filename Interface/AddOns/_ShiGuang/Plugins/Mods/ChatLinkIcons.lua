--[[	ChatLinkIcons Core  ## Version: 2.2
	by SDPhantom
	https://www.wowinterface.com/forums/member.php?u=34145
	https://www.curseforge.com/members/sdphantomgamer/projects	]]
--------------------------------------------------------------------------

local print; do--	Debug use only (Bad things happen if the unmodified print() is used in our hook)
	local ScrollingMessageFrameMixin_AddMessage=ScrollingMessageFrameMixin.AddMessage;
	function print(...)
		local str="";
		for i=1,select("#",...) do str=str..(i>1 and " " or "")..tostring(select(i,...)); end
		ScrollingMessageFrameMixin_AddMessage(DEFAULT_CHAT_FRAME,str);
	end
end

----------------------------------
--[[	Options Variable	]]
----------------------------------
local Defaults={
	Links={
--		Case-sensitive, needs to be the same string that appears as "|H<LinkType>:"
		achievement=true;
		item=false;
		player=true;
		spell=true;
	};
	Icons={
		Race=true;
		Class=true;
	};

	PawnIntegration=true;
};

--------------------------
--[[	Other Locals	]]
--------------------------
local function GenerateFromAtlas(atlas)
	local tex,w,h,x1,x2,y1,y2=GetAtlasInfo(atlas);
	if x1==0 and x2==1 and y1==0 and y2==1 then
		return ("|T%s:0|t"):format(tostring(tex))
	else
		local filew,fileh=math.floor(w/math.abs(x2-x1)+0.5),math.floor(h/math.abs(y2-y1)+0.5)--	W and H are the dimensions of the texcoord, not the image
		return ("|T%s:0:0:0:0:%d:%d:%d:%d:%d:%d|t"):format(tostring(tex),filew,fileh,math.floor(x1*filew+0.5),math.floor(x2*filew+0.5),math.floor(y1*fileh+0.5),math.floor(y2*fileh+0.5))
	end
end

local Signature="|c00434c49|r";--	Hex code for "CLI" as our signature (Lets us identify strings we processed already with a hidden tag)

local PawnIsLoaded=IsAddOnLoaded("Pawn");
local PawnUpgradeIcon=GenerateFromAtlas("bags-greenarrow");

local OptionTypeLookup={
	currency="item";
	transmogappearance="item";

	BNplayer="player";
	BNplayerCommunity="player";
	playerCommunity="player";
	playerGM="player";

	enchant="spell";
	trade="spell";
	unit="player";
};

--------------------------
--[[	Texture Tables	]]
--------------------------
local Races={}; do--	Races/Genders
	local TexturePath,TextureWidth,TextureHeight,IconSize,RaceGrid;
	if WOW_PROJECT_ID==WOW_PROJECT_MAINLINE then
		TexturePath="Interface\\Glues\\CharacterCreate\\CharacterCreateIcons";
		TextureWidth=512;
		TextureHeight=512;
		IconSize=66;

		RaceGrid={
--			Race			Male, Female
			Human			={{3,1},{2,1}};
			Orc			={{5,2},{4,2}};
			Dwarf			={{0,1},{6,0}};
			NightElf		={{3,2},{2,2}};
			Scourge			={{5,3},{4,3}};
			Tauren			={{2,5},{2,4}};
			Gnome			={{0,3},{0,2}};
			Troll			={{3,3},{2,6}};
			Goblin			={{0,5},{0,4}};
			BloodElf		={{1,0},{0,0}};
			Draenei			={{5,0},{4,0}};
			Worgen			={{3,6},{3,5}};
			Pandaren		={{2,3},{6,2}};
			Nightborne		={{1,6},{1,5}};
			HighmountainTauren	={{1,1},{0,6}};
			VoidElf			={{3,4},{6,3}};
			LightforgedDraenei	={{1,2},{6,1}};
			ZandalariTroll		={{5,4},{4,4}};
			KulTiran		={{5,1},{4,1}};
			DarkIronDwarf		={{3,0},{2,0}};
			Vulpera			={{5,5},{4,6}};
			MagharOrc		={{1,4},{1,3}};
			Mechagnome		={{4,5},{6,4}};
		};
	elseif WOW_PROJECT_ID==WOW_PROJECT_CLASSIC then
		TexturePath="Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Races";
		TextureWidth=256;
		TextureHeight=256;
		IconSize=64;

		RaceGrid={
--			Race			Male, Female
			Human			={{0,0},{0,2}};
			Orc			={{3,1},{3,3}};
			Dwarf			={{1,0},{1,2}};
			NightElf		={{3,0},{3,2}};
			Scourge			={{1,1},{1,3}};
			Tauren			={{0,1},{0,3}};
			Gnome			={{2,0},{2,2}};
			Troll			={{2,1},{2,3}};
		};
	else error("Invalid WoW Project ID"); end

--	|Tpath:size1:size2:xoffset:yoffset:dimx:dimy:coordx1:coordx2:coordy1:coordy2|t
	for race,data in pairs(RaceGrid) do
		for index,pos in ipairs(data) do
--			Gender from GetPlayerInfoByGUID() is 2/3
			Races[race..(index+1)]=("|T%s:0:0:0:0:%d:%d:%d:%d:%d:%d|t"):format(
				TexturePath,TextureWidth,TextureHeight
				,pos[1]*IconSize,(pos[1]+1)*IconSize
				,pos[2]*IconSize,(pos[2]+1)*IconSize
			);
		end
	end
end

local Classes={--	Classes
	WARRIOR		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:0:64:0:64|t";
	MAGE		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:64:128:0:64|t";
	ROGUE		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:128:192:0:64|t";
	DRUID		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:192:256:0:64|t";
	HUNTER		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:0:64:64:128|t";
	SHAMAN		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:64:128:64:128|t";
	PRIEST		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:128:192:64:128|t";
	WARLOCK		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:192:256:64:128|t";
	PALADIN		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:0:64:128:192|t";
	DEATHKNIGHT	="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:64:128:128:192|t";
	MONK		="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:128:192:128:192|t";
	DEMONHUNTER	="|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:0:0:0:0:256:256:192:256:128:192|t";
};

----------------------------------
--[[	PlayerCache Prescan	]]--	Prescan helps system messages get icons when someone logs in
----------------------------------
local ServerTag;
local PlayerCache=setmetatable({},{
	__index=function(t,k) return ServerTag and rawget(t,("%s-%s"):format(k,ServerTag)); end;
	__newindex=function(t,k,v)--	k=Name v=GUID
		if not ServerTag then return; end
		if not k:find("%-") then k=("%s-%s"):format(k,ServerTag); end
		rawset(t,k,v);
	end;
});

local EventFrame=CreateFrame("Frame");
EventFrame:RegisterEvent("PLAYER_LOGIN");
EventFrame:RegisterEvent("PLAYER_GUILD_UPDATE");
EventFrame:RegisterEvent("FRIENDLIST_UPDATE");
EventFrame:RegisterEvent("GUILD_ROSTER_UPDATE");
EventFrame:SetScript("OnEvent",function(self,event,...)
	if event=="PLAYER_LOGIN" then
		ServerTag=GetNormalizedRealmName();--	Update server tag
		PlayerCache[UnitName("player")]=UnitGUID("player");--	Register player GUID
		C_FriendList.ShowFriends();--	Request friend list
		GuildRoster();--	Request guild roster
	elseif event=="PLAYER_GUILD_UPDATE" then GuildRoster();--	Player joined/left guild
	elseif event=="FRIENDLIST_UPDATE" then
		for i=1,C_FriendList.GetNumFriends() do
			local info=C_FriendList.GetFriendInfoByIndex(i);
			if info and info.name and info.guid then PlayerCache[info.name]=info.guid; end--	Register friend
		end
	elseif event=="GUILD_ROSTER_UPDATE" then
--		(...) is true if the a refresh is needed, false if a refresh has been done
		if (...) then GuildRoster(); else
			for i=1,(GetNumGuildMembers()) do
				local name,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,guid=GetGuildRosterInfo(i);
				if name and guid then PlayerCache[name]=guid; end--	Register guildmate
			end
		end
	end
end);

--------------------------
--[[	Link Transform	]]
--------------------------
local function IsItemUpgrade(link)--	Modified PawnIsItemIDAnUpgrade() (Allows full links to compare upgraded items)
	if not (PawnIsLoaded and PawnIsReady() and link) then return nil; end
	local item=PawnGetItemData(link);
	if not item then return nil; end
	return PawnIsItemAnUpgrade(item) and true or false;
end

local function IconsFromGUID(guid)
	if not guid then return "",""; end
	local _,class,_,race,gender=GetPlayerInfoByGUID(guid);
	return Races[race..gender] or "",class and Classes[class] or "";
end

--	Texture generation functions
local TextureFunctions={
	achievement=function(id,text) return "|T"..select(10,GetAchievementInfo(tonumber(id:match("%d+"))))..":0|t"; end;
	calendarEvent=function(id,text)
		local offset,day,index=string.split(":",id);
		local event=C_Calendar.GetDayEvent(tonumber(offset),tonumber(day),tonumber(index));
		if event then return "|T"..event.iconTexture..":0|t"; end
	end;

	currency=function(id,text) return "|T"..select(3,GetCurrencyInfo(tonumber(id:match("%d+"))))..":0|t"; end;
	item=function(id,text) return "|T"..GetItemIcon(tonumber(id:match("%d+")))..":0|t"; end;
	transmogappearance=function(id,text) return "|T"..GetItemIcon(tonumber(select(6,C_TransmogCollection.GetAppearanceSourceInfo(tonumber(id))):match("|Hitem:(%d+)")))..":0|t"; end;

	BNplayer=function(id,text)
		local _,_,_,_,_,acctid,client,online=BNGetFriendInfoByID((select(6,tonumber(id:match(":(%d+)")))));
		local _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,guid=BNGetGameAccountInfo(acctid);
		if not online then return BNet_GetClientEmbeddedTexture(nil); end
		if client~=BNET_CLIENT_WOW or not guid then return BNet_GetClientEmbeddedTexture(client); end

		local race,class=IconsFromGUID(guid);
		return (Defaults.Icons.Race and race or "")..(Defaults.Icons.Class and class or "");
	end;
	player=function(id,text) local race,class=IconsFromGUID(PlayerCache[id:match("[^:]+")]); return (Defaults.Icons.Race and race or "")..(Defaults.Icons.Class and class or ""); end;
	unit=function(id,text) local race,class=IconsFromGUID(id:match("[^:]+")); return (Defaults.Icons.Race and race or "")..(Defaults.Icons.Class and class or ""); end;

	spell=function(id,text) return "|T"..select(3,GetSpellInfo(tonumber(id:match("%d+"))))..":0|t"; end;
	trade=function(id,text) return "|T"..select(3,GetSpellInfo(tonumber(id:match(":(%d+)"))))..":0|t"; end;
};

--	Shared functions
TextureFunctions["BNplayerCommunity"]=TextureFunctions["BNplayer"];
TextureFunctions["enchant"]=TextureFunctions["spell"];
TextureFunctions["playerCommunity"]=TextureFunctions["player"];
TextureFunctions["playerGM"]=TextureFunctions["player"];

local ConvertLinks; do--	function(str)
	local LinkPattern="(|H([^:|]+):([^|]-)|h(.-)|h)";
	local function Callback(link,type,id,text)--	Conversion Function
		local func=TextureFunctions[type];

	--	Pawn Itegration (Append after all textures)
		local upgradeicon=(type=="item" and Defaults.PawnIntegration and IsItemUpgrade("item:"..id)) and PawnUpgradeIcon or "";

	--	Return if no function or link type is disabled
		if not func or Defaults.Links[OptionTypeLookup[type] or type]==false then return link..upgradeicon; end

	--	Rarely, the game doesn't give us the icons we need in the time we need them
	--	Leting any error halt conversion and return
		local ok,pre,post=pcall(func,id,text);
		if not ok then return link..upgradeicon; end

	--	Return modified link
		return ("%s%s%s%s"):format(pre or "",link,post or "",upgradeicon);
	end

	function ConvertLinks(str)
		local fix; str,fix=str:gsub(LinkPattern,Callback);
		if fix>0 then
--			Fix some links relinking with textures and blocking the ability to send them (Blizzard seems to have fixed this, but still doing it to preserve legacy behavior)
			repeat str,fix=str:gsub("(|c%x%x%x%x%x%x%x%x)(%s*|T[^|]*|t%s*)","%2%1"); until fix<=0
			repeat str,fix=str:gsub("(%s*|T[^|]*|t%s*)(|r)","%2%1"); until fix<=0
		end
		return str;
	end
end

--------------------------
--[[	Message Hooks	]]
--------------------------
local function MessageFilter(self,event,msg,...)
	local name,_,_,_,_,_,_,_,_,_,guid=...;
	if (name or "")~="" and (guid or "")~="" then PlayerCache[name]=guid; end
	return false,ConvertLinks(msg),...;
end

local function PassThroughHook(tbl,key)
	if key==nil then tbl,key=_G,tbl; end
	local orig=assert(tbl[key]);
	tbl[key]=function(...) return ConvertLinks(orig(...)); end
end

for type in next,getmetatable(ChatTypeInfo).__index do ChatFrame_AddMessageEventFilter("CHAT_MSG_"..type,MessageFilter); end

PassThroughHook("GetBNPlayerCommunityLink");
PassThroughHook("GetBNPlayerLink");
PassThroughHook("GetGMLink");
PassThroughHook("GetPlayerCommunityLink");
PassThroughHook("GetPlayerLink");
