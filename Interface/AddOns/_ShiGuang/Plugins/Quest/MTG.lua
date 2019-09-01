local _, ns = ...
local M, R, U, I = unpack(ns)
--## Author: JANY ## Version: v4.0.2-42-20190819
local strmatch, strformat = string.match, string.format
local showReq = true --显示每个项目的要求。
local showAllButNotOnlyMeetsReq = false --显示每个项目，但不是仅显示当前要求。
local j_sort = 1  --按以下方式对buyString进行排序：1个NPC优先。2稀有优先
local j_MerchantShowDelay = 0.5 --延迟

local valueableList = {}
local valueableListinfo = {
        [168053] = U[168053],
        [168091] = U[168091],--严重生锈的保险箱
        [168092] = U[168092],--一捆异常暖和的洗澡
        [168093] = U[168093],--污秽的法力珍珠手镯
        [168094] = U[168094],--微微嗡鸣的海石
        [168095] = U[168095],--奇特的珊瑚丛
        [168096] = U[168096],--浸水的工具箱
        [168097] = U[168097],--被盗的护甲箱
        --## the following items require Azsh'ari Stormsurger Cape
        --## as the wowhead data is not completed yet, some might skip taco check 
        [170159] = U[170159],--污秽的法力珍珠手镯
        [170152] = U[170152],--裹影贝壳
        [170153] = U[170153],--看起来很不祥的书典
        [170157] = U[170157],--一堆凶兆之沙
        [170161] = U[170161],--极其聪明的寄居蟹
        [170162] = U[170162], --浸水的工具箱
        [170101] = U[170101],--被盗的护甲箱
        [169202] = U[169202],
        [170158] = U[170158],--不可名状的珍珠人偶

    }

local fullNPC = {
    [151950] = true,
    [151951] = true,
    [151952] = true,
    [151953] = true,
    [152084] = true,
}
local replaceList  = {
    [167923] = 167916,
}

local j_fullNPCRaidTargetIndex = {
    [151950] = 6,
    [151951] = 5,
    [151952] = 1,
    [151953] = 3,
    [152084] = 2,
}
local NPCNameList={
        [152084] = "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_2:26|t "..U["Mrrl"],
        [151952] = "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_1:26|t "..U["Flrgrrl"],
        [151953] = "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_3:26|t "..U["Hurlgrl"],
        [151950] = "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_6:26|t "..U["Mrrglrlr"],
        [151951] = "|TInterface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5:26|t "..U["Grrmrlg"],
} 

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED") 
frame:SetScript("OnEvent", function(self, event,...) 
    if self[event] then
        return self[event](self, event, ...)
    end
end )

local debug = {
    forceValueablePurchase = false, --# open up this to test under item daily locked.
    showCapeTacoTidestallion = false,
    showValueableList = false,
}
local j_playerIsWearingCape = function()
    return (GetInventoryItemID("player", 15) == 169489) and true or false
end
local initializeValueableList = function(J_id,J_Boolean)   
    local playerIsWearingCape = j_playerIsWearingCape
    local playerHasTaco = (GetItemCount(170100, true) > 0) and true or false --查看身上的 可饼数量 大于0才买
    local playerLearnedCrimsonTidestallion = function() --玩家学习了深红色的小种马
        for k,v in pairs(C_MountJournal.GetMountIDs()) do
            local _, spellID, _, _, _, _, _, _, _, _, isCollected = C_MountJournal.GetMountInfoByID(v)
            if spellID == 300153 then
                return isCollected
            end
        end
        return false --# incorrectly not scanned (maybe in some case?) return as unlearned
    end
    
    if debug.showCapeTacoTidestallion then
        print("playerIsWearingCape - ", playerIsWearingCape)
        print("playerHasTaco - ", playerHasTaco)
        print("playerLearnedCrimsonTidestallion - ", playerLearnedCrimsonTidestallion())
        
    end
    local buyNormalItems = (ShiGuangDB["j_BuyItemOption"] == 1) and 1 or 0
    local buyRareItemsNoTaco = (ShiGuangDB["j_BuyRareItemOption"] <= 2) and playerIsWearingCape and 1 or 0
    local buyRareItemsWithTaco = (ShiGuangDB["j_BuyRareItemOption"] == 2) and playerIsWearingCape and ((not ShiGuangDB["j_CheckTacoFirst"]) or playerHasTaco) and 1 or 0
    
    valueableList = {
        [168053] = buyNormalItems,
        [168091] = buyNormalItems,
        [168092] = buyNormalItems,
        [168093] = buyNormalItems,
        [168094] = buyNormalItems,
        [168095] = buyNormalItems,
        [168096] = buyNormalItems,
        [168097] = buyNormalItems,
        --## the following items require Azsh'ari Stormsurger Cape
        --## as the wowhead data is not completed yet, some might skip taco check 
        [170159] = buyRareItemsNoTaco,
        [170152] = buyRareItemsNoTaco,
        [170153] = buyRareItemsWithTaco,
        [170157] = buyRareItemsNoTaco,
        [170161] = buyRareItemsWithTaco,
        [170162] = buyRareItemsNoTaco, --# no need taco
        [170101] = buyRareItemsNoTaco,
        --[169202] = playerLearnedCrimsonTidestallion() and 0 or buyRareItemsWithTaco, --# Crimson Tidestallion
        [169202] = buyRareItemsWithTaco,
        [170158] = buyRareItemsWithTaco,
    }
    --[[valueableList = {
        [168053] = {itemType = buyNormalItems,iteminfo=U[168053],},
        [168091] = {itemType = buyNormalItems,iteminfo=U[168091], },
        [168092] = {itemType = buyNormalItems,iteminfo=U[168092], },
        [168093] = {itemType = buyNormalItems,iteminfo=U[168093], },
        [168094] = {itemType = buyNormalItems,iteminfo=U[168094], },
        [168095] = {itemType = buyNormalItems,iteminfo=U[168095], },
        [168096] = {itemType = buyNormalItems,iteminfo=U[168096], },
        [168097] = {itemType = buyNormalItems,iteminfo=U[168097], },
        --------------------------
        [170159] = {itemType = buyRareItemsNoTaco,iteminfo=U[170159], },
        [170152] = {itemType = buyRareItemsNoTaco,iteminfo=U[170152], },
        [170153] = {itemType = buyRareItemsWithTaco,iteminfo=U[170153], },
        [170157] = {itemType = buyRareItemsNoTaco,iteminfo=U[170157], },
        [170161] = {itemType = buyRareItemsWithTaco,iteminfo=U[170161], },
        [170162] = {itemType = buyRareItemsNoTaco,iteminfo=U[170162], },
        [170101] = {itemType = buyRareItemsNoTaco,iteminfo=U[170101], },
        [169202] = {itemType = buyRareItemsWithTaco,iteminfo=U[169202], },
        [170158] = {itemType = buyRareItemsWithTaco,iteminfo=U[170158], },
    }]]
    if debug.showValueableList or true then
        for k,v in pairs(valueableList) do 
            --print(k, GetItemInfo(k), v)
            GetItemInfo(k)
        end        
    end
    if J_Boolean and valueableList[J_id]~=nil and valueableList[J_id] == buyRareItemsNoTaco then
        valueableList[J_id] = buyRareItemsWithTaco
        print(J_id,U["This item wants a Taco cake"])
    elseif not J_Boolean and valueableList[J_id]~=nil and valueableList[J_id] == buyRareItemsWithTaco then
        valueableList[J_id] = buyRareItemsNoTaco
        print(J_id,U["This item doesn't need tower cakes"])
    end
end
local everGenerated = false


--# Don't touch anything below!

local name, realm = UnitFullName("player")
    if not realm or realm=="" then
        if not PLAYER_REALM or PLAYER_REALM=="" then
            PLAYER_REALM = GetRealmName()
        end
        realm = PLAYER_REALM
    end
local playerFullName = name.."-"..realm


local talkedNPC = {}

local merchantItemList = {
        [167902] = {
            ["NPC"] = 151950,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167910,
                    ["amount"] = 3,
                }, -- [1]
                {
                    ["item"] = 167914,
                    ["amount"] = 3,
                }, -- [2]
            },
        },
        [167906] = {
            ["NPC"] = 151951,
            ["rarity"] = 1,
            ["Req"] = {
                {
                    ["item"] = "c",
                    ["amount"] = 10000,
                }, -- [1]
            },
        },
        [167910] = {
            ["NPC"] = 151952,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167906,
                    ["amount"] = 2,
                }, -- [1]
            },
        },
        [167914] = {
            ["NPC"] = 151953,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167906,
                    ["amount"] = 5,
                }, -- [1]
            },
        },
        [169782] = {
            ["NPC"] = 151952,
            ["rarity"] = 4,
            ["Req"] = {
                {
                    ["item"] = 167904,
                    ["amount"] = 2,
                }, -- [1]
                {
                    ["item"] = 167902,
                    ["amount"] = 9,
                }, -- [2]
            },
        },
        [167903] = {
            ["NPC"] = 151950,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167915,
                    ["amount"] = 4,
                }, -- [1]
            },
        },

        [167911] = {
            ["NPC"] = 151952,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167915,
                    ["amount"] = 4,
                }, -- [1]
            },
        },
        [167915] = {
            ["NPC"] = 151953,
            ["rarity"] = 1,
            ["Req"] = {
                {
                    ["item"] = "c",
                    ["amount"] = 10000,
                }, -- [1]
            },
        },
        [169783] = {
            ["NPC"] = 151953,
            ["rarity"] = 4,
            ["Req"] = {
                {
                    ["item"] = 167904,
                    ["amount"] = 4,
                }, -- [1]
                {
                    ["item"] = 167909,
                    ["amount"] = 7,
                }, -- [2]
            },
        },
        [167896] = {
            ["NPC"] = 151950,
            ["rarity"] = 1,
            ["Req"] = {
                {
                    ["item"] = "c",
                    ["amount"] = 10000,
                }, -- [1]
            },
        },
        [167904] = {
            ["NPC"] = 151950,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167911,
                    ["amount"] = 2,
                }, -- [1]
            },
        },
        [167908] = {
            ["NPC"] = 151951,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167923,
                    ["amount"] = 3,
                }, -- [1]
            },
        },
        [167912] = {
            ["NPC"] = 151952,
            ["rarity"] = 1,
            ["Req"] = {
                {
                    ["item"] = "c",
                    ["amount"] = 10000,
                }, -- [1]
            },
        },
        [167916] = {
            ["NPC"] = 151953,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167912,
                    ["amount"] = 6,
                }, -- [1]
            },
        },
        [169780] = {
            ["NPC"] = 151950,
            ["rarity"] = 4,
            ["Req"] = {
                {
                    ["item"] = 167908,
                    ["amount"] = 8,
                }, -- [1]
                {
                    ["item"] = 167913,
                    ["amount"] = 7,
                }, -- [2]
            },
        },
        [167905] = {
            ["NPC"] = 151951,
            ["rarity"] = 2,
            ["Req"] = {
                {
                    ["item"] = 167896,
                    ["amount"] = 3,
                }, -- [1]
            },
        },
        [167909] = {
            ["NPC"] = 151952,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167905,
                    ["amount"] = 6,
                }, -- [1]
            },
        },
        [167913] = {
            ["NPC"] = 151953,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167905,
                    ["amount"] = 5,
                }, -- [1]
            },
        },

        [169781] = {
            ["NPC"] = 151951,
            ["rarity"] = 4,
            ["Req"] = {
                {
                    ["item"] = 167913,
                    ["amount"] = 8,
                }, -- [1]
                {
                    ["item"] = 167909,
                    ["amount"] = 4,
                }, -- [2]
            },
        },
        [167907] = {
            ["NPC"] = 151951,
            ["rarity"] = 3,
            ["Req"] = {
                {
                    ["item"] = 167903,
                    ["amount"] = 5,
                }, -- [1]
            },
        },
    }

local buyList = {}
local buyLists = {}
local GetItemID = function(itemLink)
    if not itemLink then return nil end
    local itemID = strmatch(itemLink, "item:(%d+):")
    return itemID and tonumber(itemID) or nil
end

local getItemLink = function(itemID)
    if not itemID then return nil end
    return select(2,GetItemInfo(itemID))--/run print(select(2,GetItemInfo(167905)))
end
local function J_ADDmerchantItemList()--加载物品列表，解决function_***.lua:***: bad argument #2 to '***' (string expected, got nil)错误
  for itemID, itemBuyInfo in pairs(merchantItemList) do
    local Req = merchantItemList[itemID].Req
        for k, req in pairs(Req) do
            getItemLink(req.item)
        end
  end 
end
local GetNPCID = function(unit)
    if not unit then return nil end
    local id = UnitGUID(unit)
    id = strmatch(id, "-(%d+)-%x+$")
    return tonumber(id, 10)
end

local isSetContain = function(s1, s2)
    for k,v in pairs(s2) do
        if (not s1[k]) then
            return false
        end
    end
    return true
end

local queueBuyMerchantItem = function(itemIndex, amount)
    local amountLeft = amount
    
    local max = math.min(GetMerchantItemMaxStack(itemIndex), 255)
    while amountLeft > 0  do
        BuyMerchantItem(itemIndex, min(amountLeft, max))
        amountLeft  = amountLeft - min(amountLeft, max)

    end
end

generateBuyList = function(amount, itemID)

    if not merchantItemList[itemID] or ShiGuangDB["MTGsetting"][itemID] == false then 
        return 
    end
   
    local currentItemReq, currentItemNPC = merchantItemList[itemID].Req, merchantItemList[itemID].NPC
    local currentNeedAmount
    if buyList[itemID] then
        currentNeedAmount = amount + buyList[itemID].amount
    else
        currentNeedAmount = amount - GetItemCount(itemID) --# delete the num on player on first look
    end
    
    if currentNeedAmount > 0 then
        for k, req in pairs(currentItemReq) do
            if req.item ~= "c" then
                if buyList[itemID] then
                    
                    generateBuyList(amount * req.amount, replaceList[req.item] or req.item)
                else
                    
                    generateBuyList(currentNeedAmount * req.amount, replaceList[req.item] or req.item)
                end
            end
        end
    end

    buyList[itemID] = {
        amount = currentNeedAmount,
        NPC = currentItemNPC,
    }
        buyLists[itemID] = {
        amount = currentNeedAmount,
        NPC = currentItemNPC,
    }

    return 
end

local meetsReq = function(itemID)
    if not buyList[itemID] then return false end
    if not merchantItemList[itemID] then return false end
    local currentItemReq = merchantItemList[itemID].Req
    local amount = buyList[itemID].amount
    for k, req in pairs(currentItemReq) do
        if (req.item ~= "c") and (GetItemCount(req.item) < amount * req.amount) then
            return false
        end
    end
    return true
end

local generateBuyListFromValueable = function()
    for itemID, itemNum in pairs(valueableList) do
        if itemNum > 0 then
            generateBuyList(itemNum, itemID)
        end  
        if buyList[itemID] then
            valueableList[itemID] = valueableList[itemID] - buyList[itemID].amount
        end 
    end
end

local generatebuyString = function()
    local compare
    if j_sort == 1 then
        compare = function(a, b)
            if a.NPC < b.NPC then
                return true
            elseif a.NPC > b.NPC then
                return false
            elseif a.rarity < b.rarity then
                return true
            elseif a.rarity > b.rarity then
                return false
            elseif a.itemID < b.itemID then
                return true
            elseif a.itemID > b.itemID then
                return false
            end
        end
    elseif j_sort == 2 then
        compare = function(a, b)
            if a.rarity < b.rarity then
                return true
            elseif a.rarity > b.rarity then
                return false
            elseif a.NPC < b.NPC then
                return true
            elseif a.NPC > b.NPC then
                return false
            elseif a.itemID < b.itemID then
                return true
            elseif a.itemID > b.itemID then
                return false
            end
        end
    end

    
    local tempStrnSet = {}
    
    for itemID, itemBuyInfo in pairs(buyList) do
        local ReqStrn = showReq and strformat(" (%s)", generateReqString(itemID)) or ""
        local strn
        if meetsReq(itemID) or showAllButNotOnlyMeetsReq then--满足要求
            if itemBuyInfo.amount > 1 then
                strn = strformat(" %s %s %sx%d%s",NPCNameList[itemBuyInfo.NPC], "→", getItemLink(itemID), itemBuyInfo.amount, ReqStrn)
            elseif itemBuyInfo.amount > 0 then
                strn = strformat(" %s %s %s%s",NPCNameList[itemBuyInfo.NPC], "→", getItemLink(itemID), ReqStrn)
            end
            
            table.insert(tempStrnSet, {
                    itemID = itemID,            
                    strn = strn,
                    NPC = itemBuyInfo.NPC,
                    rarity = merchantItemList[itemID].rarity,
            })
        end        
    end
    
    table.sort(tempStrnSet, compare)
    
    local retStrn = ""
    for k,v in pairs(tempStrnSet) do
        if v.strn then
            retStrn = retStrn .. v.strn .. "\n"
        end
    end
    
    return retStrn
end

local checkDealReplacementString = function()
    local strn = ""
    for _, itemID in pairs(replaceList) do
        if GetItemCount(itemID) >= 1 then
            strn = strformat("%s %s %s", strn, U["Use it manually in the water"], getItemLink(itemID))
        end
    end
    return strn
end

generateReqString = function(itemID)
    if not buyList[itemID] then return false end
    if not merchantItemList[itemID] then return false end
    local Req = merchantItemList[itemID].Req
    local Amount = buyList[itemID].amount
    local strn = ""
    if Amount > 0 then        
        for k, req in pairs(Req) do
            if req.item == "c" then
                strn = GetCoinText(Amount * req.amount, "+")
                break
            else
                if strn == "" then
                    strn = (Amount * req.amount > 1) and strformat("%sx%d", getItemLink(req.item), Amount * req.amount) or strformat("%s", getItemLink(req.item))
                else
                    strn = (Amount * req.amount > 1) and strformat("%s+%sx%d", strn, getItemLink(req.item), Amount * req.amount) or strformat("%s+%s", strn, getItemLink(req.item))
                end
            end
        end    
    end
    return strn
end

function J_TablevIn(tbl,value)
    for k,v in pairs(tbl) do
        if v.item==value then return true end
    end
    return false
end



function J_MRRL_DELAYED_MERCHANT_SHOW()
    local NPCID, NPCname = GetNPCID("target"), UnitName("target")
    if j_fullNPCRaidTargetIndex[NPCID] and not GetRaidTargetIndex("target") then
        SetRaidTarget("target", j_fullNPCRaidTargetIndex[NPCID])
    end

    if NPCID and fullNPC[NPCID] then
        J_ADDmerchantItemList()
        for itemIndex = 1, GetMerchantNumItems() do
            local currentItem = GetMerchantItemLink(itemIndex)
            if currentItem then
                local currentItemID = GetItemID(currentItem)
                local currentItemReq = {}
                if (NPCID == 152084) and (not talkedNPC[NPCID]) then
                    if not valueableList[currentItemID] then
                        valueableList[currentItemID] = 1
                    end
                end
                --# 满足需求检查购买列表。这是自动购买功能，并且只有在生成买单后才会使用。
                if meetsReq(currentItemID) then
                    if buyList[currentItemID].amount > 0 then
                        if getItemLink(currentItemID) ==nil then return end
                        queueBuyMerchantItem(itemIndex, buyList[currentItemID].amount)
                    end
                end
                
                local _, _, price, _, _, isPurchasable = GetMerchantItemInfo(itemIndex)
                if isPurchasable or debug.forceValueablePurchase then
                    if price == 0 then --# 这件物品是用货币买的。                       
                        for currencyIndex = 1, GetMerchantItemCostInfo(itemIndex) do
                            local _, currentCurrencyNum, currentCurrency = GetMerchantItemCostItem(itemIndex, currencyIndex)

                            currentItemReq[currencyIndex] = {
                                amount = currentCurrencyNum,
                                item = GetItemID(currentCurrency),
                            }                                
                        end
                    else --# 这件东西是用钱买的                    
                        currentItemReq[1] = {
                            amount = price,
                            item = "c",
                        }                            
                    end
                    
                    local _, _, rarity = GetItemInfo(currentItemID)
                    merchantItemList[currentItemID] = {
                        Req = currentItemReq,
                        NPC = NPCID,
                        rarity = rarity,
                    }

    
                    if (NPCID == 152084) then --更新数据表
                        if J_TablevIn(currentItemReq, 170100) then 
                            initializeValueableList(currentItemID,true)
                        else
                            initializeValueableList(currentItemID,false)
                        end
                    end

                end 
            if not talkedNPC[NPCID] then
                print(GX_ADAPTER_AUTO_DETECT , NPCname,currentItem,valueableListinfo[GetItemID(currentItem)] or "")
            end
                              
            else
                print(strformat("|cff999900未扫描物品信息. 重新和 %s 对话!", NPCname))
                return false
            end                
        end 
        talkedNPC[NPCID] = true
    end

    if isSetContain(talkedNPC, fullNPC) or talkedNPC[152084] then --or talkedNPC[152084] 

        if everGenerated == false then
            generateBuyListFromValueable()--从Valuable生成购买列表
            everGenerated = true
        end
        
    end
    if fullNPC[NPCID] then 
        C_Timer.After(1, function() JNAYDBM_Purchase_prompt(strformat("%s%s", generatebuyString(), checkDealReplacementString()),5.0,false) end)
    end
    return true
end



function frame:MERCHANT_SHOW(event,...)
    C_Timer.After(j_MerchantShowDelay, J_MRRL_DELAYED_MERCHANT_SHOW)
end


function frame:MERCHANT_CLOSED(event,...)
    if IsAddOnLoaded("WeakAuras") then
        if WeakAuras.loaded["Mrrl's trade game"] then 
            frame:UnregisterEvent("MERCHANT_SHOW")
            frame:UnregisterEvent("MERCHANT_CLOSED")
            frame:UnregisterEvent("CHAT_MSG_LOOT")
            JNAYDBM_Purchase_prompt(U["Detected WeakAuras's Mrrl's"],5.0,false)
        end
    end
    return true
end

local buyitems = ""
function frame:CHAT_MSG_LOOT(event,...)
    local line, _, _, _, unit = ...
    if unit == playerFullName then
        for itemID, _ in pairs(buyList) do
            local item = GetItemInfo(itemID)
            if item == nil and itemID ~= 167916 and itemID ~= 170100 and merchantItemList[itemID] then 
                print(JNAYDBM_Purchase_prompt(itemID.."发生了一些错误,/RL后重新购买.",5.0,false))
            end
            if item ~= nil and strmatch(line, item) then
                local lootAmount = strmatch(line, item .. "]|h|rx(%d+)") or 1
                buyitems = buyitems ..itemID.."("..lootAmount..")"..unit.."】【"
                buyList[itemID].amount = buyList[itemID].amount - lootAmount
                if valueableList[itemID] ~= nil then
                    LootAlertSystem:AddAlert(itemID)
                    --LootAlertSystem:AddAlert(itemLink, quantity, rollType, roll, nil, nil, nil, nil, nil, isUpgraded);--获得物品 
                    --LegendaryItemAlertSystem:AddAlert(select(2,GetItemInfo(itemID))) --获得传说物品             
                end 
                break
            end
        end
    ShiGuangDB.MTGDB ={
    ["talkedNPC"] = talkedNPC,
    ["NPCNameList"] = NPCNameList,
    ["merchantItemList"] = merchantItemList,
    ["buyList"] = buyList,
    ["buyLists"] = buyLists,
    ["购买详情"] = buyitems,
    }
    end
    return true
end
function JNAYDBM_Purchase_prompt(message,duration,clear)
    -- center-screen raid notice is easy
    if(clear)then
        RaidNotice_Clear(RaidBossEmoteFrame)
    end
    RaidNotice_AddMessage(RaidBossEmoteFrame, message, ChatTypeInfo["RAID_BOSS_EMOTE"],duration)
    -- chat messages are trickier
    local i
    for i = 1, NUM_CHAT_WINDOWS do
        local chatframes = { GetChatWindowMessages(i) }         
        local v
        for _, v in ipairs(chatframes) do
            if v == "MONSTER_BOSS_EMOTE" then
                local frame = 'ChatFrame' .. i
                if _G[frame] then
                    _G[frame]:AddMessage(message,1.0,1.0,0.0,GetChatTypeIndex(ChatTypeInfo["RAID_BOSS_EMOTE"].id))
                end
                break
            end
        end
    end
end

function frame:GET_ITEM_INFO_RECEIVED(event,...)
    local  itemID, success = ...
    if itemID ~= 0 and not success then     
        if merchantItemList[itemID] then
            print(itemID,"未成功地从服务器查询该项")
            J_ADDmerchantItemList()--加载物品列表
            C_Timer.After(3, function() frame:UnregisterEvent("GET_ITEM_INFO_RECEIVED") end)--3秒后自动关闭未加载物品提示,防止死循环
        end 
    end
end

function frame:ADDON_LOADED(event,...)
    if ShiGuangDB["j_BuyRareItemOption"] == nil then ShiGuangDB["j_BuyRareItemOption"] = 2 end --1 购买不含塔可的稀有品。2 购买每一件珍稀物品。3 不要买稀有品
    if ShiGuangDB["j_BuyItemOption"] == nil then ShiGuangDB["j_BuyItemOption"] = 1 end --1购买普通物品  2不购买普通物品
    if ShiGuangDB["j_Markersize"] == nil then ShiGuangDB["j_Markersize"] = 26 end
    if ShiGuangDB["j_CheckTacoFirst"] == nil then ShiGuangDB["j_CheckTacoFirst"] = true end  --先检查玉米卷，然后再用玉米卷购买稀有品。
    if ShiGuangDB["MTGsetting"] == nil then ShiGuangDB["MTGsetting"] = {} end
    if ShiGuangDB["MTGsetting"][168053] == nil then ShiGuangDB["MTGsetting"][168053] = true end
    if ShiGuangDB["MTGsetting"][168091] == nil then ShiGuangDB["MTGsetting"][168091] = true end
    if ShiGuangDB["MTGsetting"][168092] == nil then ShiGuangDB["MTGsetting"][168092] = true end
    if ShiGuangDB["MTGsetting"][168093] == nil then ShiGuangDB["MTGsetting"][168093] = true end
    if ShiGuangDB["MTGsetting"][168094] == nil then ShiGuangDB["MTGsetting"][168094] = true end
    if ShiGuangDB["MTGsetting"][168095] == nil then ShiGuangDB["MTGsetting"][168095] = true end
    if ShiGuangDB["MTGsetting"][168096] == nil then ShiGuangDB["MTGsetting"][168096] = true end
    if ShiGuangDB["MTGsetting"][168097] == nil then ShiGuangDB["MTGsetting"][168097] = true end
    if ShiGuangDB["MTGsetting"][170159] == nil then ShiGuangDB["MTGsetting"][170159] = true end
    if ShiGuangDB["MTGsetting"][170152] == nil then ShiGuangDB["MTGsetting"][170152] = true end
    if ShiGuangDB["MTGsetting"][170153] == nil then ShiGuangDB["MTGsetting"][170153] = true end
    if ShiGuangDB["MTGsetting"][170157] == nil then ShiGuangDB["MTGsetting"][170157] = true end
    if ShiGuangDB["MTGsetting"][170161] == nil then ShiGuangDB["MTGsetting"][170161] = true end
    if ShiGuangDB["MTGsetting"][170162] == nil then ShiGuangDB["MTGsetting"][170162] = true end
    if ShiGuangDB["MTGsetting"][170101] == nil then ShiGuangDB["MTGsetting"][170101] = true end
    if ShiGuangDB["MTGsetting"][170162] == nil then ShiGuangDB["MTGsetting"][170162] = true end
    if ShiGuangDB["MTGsetting"][169202] == nil then ShiGuangDB["MTGsetting"][169202] = true end
    if ShiGuangDB["MTGsetting"][170158] == nil then ShiGuangDB["MTGsetting"][170158] = true end
      frame:RegisterEvent("MERCHANT_SHOW")
      frame:RegisterEvent("MERCHANT_CLOSED")
      frame:RegisterEvent("CHAT_MSG_LOOT")
      frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    initializeValueableList()
    J_ADDmerchantItemList()--加载物品列表
end







local MTG_OptionsFrame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
MTG_OptionsFrame:Hide()
MTG_OptionsFrame.name = MTG_TITLE
MTG_OptionsFrame:SetScript("OnShow", function(self)
    if self.show then return end

    local guangao = MTG_OptionsFrame:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
    guangao:SetPoint("TOPLEFT", 16, -16)
    guangao:SetText(MTG_TITLE.." by JANY (v4.0.2-42-20190819)")

    local dropDown = CreateFrame("FRAME", "WPDemoDropDown", MTG_OptionsFrame, "UIDropDownMenuTemplate")
    dropDown:SetPoint("TOPLEFT", guangao, "BOTTOMLEFT", 310, -12)
    UIDropDownMenu_SetWidth(dropDown, 210)
    local j_fonts = {U["Buy normal items"],U["Don't buy normal items"]}
    UIDropDownMenu_SetText(dropDown,j_fonts[ShiGuangDB["j_BuyItemOption"]])
    UIDropDownMenu_Initialize(dropDown, function(self, level, menuList)
        local info = UIDropDownMenu_CreateInfo()
        info.func = function(self)
            ShiGuangDB["j_BuyItemOption"] = self.value
            print("设置:"..j_fonts[ShiGuangDB["j_BuyItemOption"]])
            UIDropDownMenu_SetText(dropDown,j_fonts[ShiGuangDB["j_BuyItemOption"]])
        end
        for i, font in next, j_fonts do
            info.value = i
            info.text, info.arg1, info.checked = font, i, i == ShiGuangDB["j_BuyItemOption"]
            UIDropDownMenu_AddButton(info)
        end
    end)

    local BuyRareItemdropDown = CreateFrame("FRAME", "WPDemoDropDown", MTG_OptionsFrame, "UIDropDownMenuTemplate")
    BuyRareItemdropDown:SetPoint("TOP", dropDown, "BOTTOM", 0, -8)
    UIDropDownMenu_SetWidth(BuyRareItemdropDown, 210)
    local fonts = {U["buy cape items that don't need taco"],U["buy every cape items"],U["Don't buy cape items"]}
    UIDropDownMenu_SetText(BuyRareItemdropDown,fonts[ShiGuangDB["j_BuyRareItemOption"]])
    UIDropDownMenu_Initialize(BuyRareItemdropDown, function(self, level, menuList)
        local info = UIDropDownMenu_CreateInfo()
        info.func = function(self)
            ShiGuangDB["j_BuyRareItemOption"] = self.value
            print("设置:"..fonts[ShiGuangDB["j_BuyRareItemOption"]])
            UIDropDownMenu_SetText(BuyRareItemdropDown,fonts[ShiGuangDB["j_BuyRareItemOption"]])
        end
        for i, font in next, fonts do
            info.value = i
            info.text, info.arg1, info.checked = font, i, i == ShiGuangDB["j_BuyRareItemOption"]
            UIDropDownMenu_AddButton(info)
        end
    end)
--[[
    local Markersizetext = MTG_OptionsFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
    Markersizetext:SetTextColor(1,1,1)
    Markersizetext:SetPoint("LEFT",0,60)
    Markersizetext:SetText("标记图标大小")
    local MarkersizeEditBox = CreateFrame("EditBox", "Markersize", MTG_OptionsFrame, "InputBoxTemplate")
    MarkersizeEditBox:SetSize(100, 20)
    MarkersizeEditBox:SetPoint("LEFT",0,30)
    MarkersizeEditBox:SetAutoFocus(false)
    MarkersizeEditBox:SetText(ShiGuangDB["j_Markersize"])
    MarkersizeEditBox:SetCursorPosition(0)
]]
    local J_button = CreateFrame("CheckButton", "j_s_CheckTacoFirst", MTG_OptionsFrame, "InterfaceOptionsCheckButtonTemplate")
    J_button:SetPoint("TOPLEFT", BuyRareItemdropDown, "BOTTOMLEFT", 8, -12)
    getglobal(J_button:GetName().."Text"):SetText(U["Check taco before buying rare items with taco"])
    if ShiGuangDB["j_CheckTacoFirst"] == true then J_button:SetChecked(true) else J_button:SetChecked(false) end

    local count,countx=0,0
    for key,value in pairs(ShiGuangDB["MTGsetting"]) do
        count=count+1
        if count>15 then countx,count=countx+1,0 end
        local MTG_button = CreateFrame("CheckButton", "MTG_Shielding_"..key, MTG_OptionsFrame, "InterfaceOptionsCheckButtonTemplate")
        MTG_button:SetPoint("TOPLEFT", guangao, "BOTTOMLEFT", 21, -16-32*count)
        getglobal(MTG_button:GetName().."Text"):SetText("|cFFad00c3"..GetItemInfo(key).."\n|r".."|cFF00FF00"..U[key])
        if value == true then MTG_button:SetChecked(true) else MTG_button:SetChecked(false) end
    end 

    self.show = true
    MTG_OptionsFrame:SetScript("OnHide", function(self)
    --if _G["Markersize"]:GetText() then ShiGuangDB["j_Markersize"]=_G["Markersize"]:GetText() end

    if _G["j_s_CheckTacoFirst"]:GetChecked() then
        if ShiGuangDB["j_CheckTacoFirst"] ~= true then ShiGuangDB["j_CheckTacoFirst"] = true end
    else
        if ShiGuangDB["j_CheckTacoFirst"] ~= false then ShiGuangDB["j_CheckTacoFirst"] = false end
    end

    for key,value in pairs(ShiGuangDB["MTGsetting"]) do
        if _G["MTG_Shielding_"..key]:GetChecked() then
            if ShiGuangDB["MTGsetting"][(key)] ~= true then ShiGuangDB["MTGsetting"][(key)] = true
                print(key,"开启")
            end
        else
            if ShiGuangDB["MTGsetting"][(key)] ~= false then ShiGuangDB["MTGsetting"][(key)] = false
                print(key,"关闭")
            end
        end
    end
    end)
end)
InterfaceOptions_AddCategory(MTG_OptionsFrame)