--[[
	Chinese Simplified Localization
--]]

local ADDON = ...
local L = LibStub('AceLocale-3.0'):NewLocale(ADDON, 'zhCN')
if not L then return end

--keybindings
L.ToggleBags = '    开关 背包'
L.ToggleBank = '    开关 银行'
L.ToggleGuild = '    开关 公会银行'
L.ToggleVault = '    开关 虚空仓库'

--terminal
L.Commands = '命令：'
L.CmdShowInventory = '开关 背包'
L.CmdShowBank = '开关 银行'
L.CmdShowGuild = '开关 公会银行'
L.CmdShowVault = '开关 虚空仓库'
L.CmdShowVersion = '显示当前版本'
L.CmdShowOptions = '打开配置菜单'
L.Updated = '已更新到v%s'


--frame titles
L.TitleBags = '%s的背包'
L.TitleBank = '%s的银行'
L.TitleVault = '%s的虚空仓库'

--tooltips
L.TipBags = '背包'
L.TipChangePlayer = '查看其他角色的物品'
L.TipCleanBags = '|CFF00FFFF<左键点击>|r整理背包(|CFFD74DE1正序|r).|CFF00FFFF<右键点击>|r(|CFFD74DE1逆序|r)'
L.TipCleanBank = ' 整理银行'
L.TipDepositReagents = '|CFF00FFFF<Ctrl+点击>|r将材料存放到材料银行.'
L.TipFrameToggle = '<右击> 开关其他窗口'
L.TipGoldOnRealm = '%s 上的总资产'
L.TipHideBag = '<单击> 隐藏包裹'
L.TipHideBags = '<单击> 隐藏背包'
L.TipHideSearch = '隐藏搜索'
L.TipManageBank = '管理银行'
L.TipResetPlayer = '<右击>返回到当前角色。'
L.TipPurchaseBag = '购买银行空位'
L.TipShowBag = '<单击> 显示包裹'
L.TipShowBags = '<单击> 显示背包'
L.TipShowBank = 'Shift-单击 开关银行'
L.TipShowInventory = '单击 开关背包'
L.TipShowMenu = '右击打开设置菜单'
L.TipShowOptions = '右击 打开设置菜单'
L.TipShowSearch = '搜索'
L.TipShowFrameConfig = '设置'
L.TipDoubleClickSearch = '<Alt-拖动> 移动\n<右击> 设置\n<双击> 搜索'
L.TipDeposit = '<点击>存入。'
L.TipWithdrawRemaining = '<右击>取出（%s剩余）。'
L.WithdrawalsRemaining = '%d取出剩余'
L.NumWithdraw = '%d取出'
L.NumDeposit = '%d存入'
L.GuildFunds = '公会基金'
L.Total = '总共'

--dialogs
L.ConfirmTransfer = '存入此物品将移除全部修改并使其不可交易和不可退款。|n|n希望继续？'
L.PurchaseVault = '希望解锁虚空仓库？|n|n|cffffd200花费：|r %s'
L.CannotPurchaseVault = '没有足够的货币解锁虚空仓库服务|n|n|cffff2020花费：%s|r'
L.AskMafia = '问问大佬'

--item tooltips
L.TipCountEquip = '装备: %d'
L.TipCountBags = '背包: %d'
L.TipCountBank = '银行: %d'
L.TipCountVault = '仓库: %d'
L.TipCountGuild = '公会银行: %d'
L.TipDelimiter = '|'