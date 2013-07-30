;~ Gold Robot
;~ fjxhkj@gmail.com

;~ AutoHotkey Version 1.1.1.1
;~ http://www.autohotkey.com/



#Persistent
#SingleInstance force
#HotkeyInterval 1000
#MaxHotkeysPerInterval 100
#NoEnv
#Warn

SetWorkingDir %A_ScriptDir%
Process, Priority, , High
SetBatchLines, -1
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetKeyDelay, 0
SetTitleMatchMode, 1
CoordMode, Window
;~ SendMode Input

; [SYS] autostart section
SplitPath, A_ScriptFullPath, SYS_ScriptNameExt, SYS_ScriptDir, SYS_ScriptExt, SYS_ScriptNameNoExt, SYS_ScriptDrive
SYS_ScriptVersion = 1.2.3.5
SYS_ScriptBuild = 2013-7-30
SYS_ScriptInfo = %SYS_ScriptNameNoExt% %SYS_ScriptVersion%

;~ [Files]
File_Ini = %A_ScriptDir%\%SYS_ScriptNameNoExt%.ini
File_Readme = %A_ScriptDir%\goldrobot_readme.txt
File_Ico = %A_ScriptDir%\goldrobot.ico


;~ [Var]

;~ [Const]
;~ 价格向上或下
Const_PRICE_UP := "Const_PRICE_UP"
Const_PRICE_DOWN := "Const_PRICE_DOWN"

;~ 总是代表无
Const_Nothing := "Const_Nothing"

;~ 持仓的方向
Const_Holding_UP := "Const_Holding_UP"
Const_Holding_DOWN := "Const_Holding_DOWN"

;~ 持仓是否盈利
Const_Holding_Profit := "Const_Holding_Profit"
Const_Holding_Lost := "Const_Holding_Lost"

;~ 买多或空
Const_Comp_BUY_UP := "Const_Comp_BUY_UP"
Const_Comp_BUY_DOWN := "Const_Comp_BUY_DOWN"

;~ 卖出
Const_Comp_SELL := "Const_Comp_SELL"

;~ [Global Var]
GV_CNIClientPath := 0
GV_iSkyPath := 0

;~ 自动平仓级别
GV_autoSellPrice := 10000

;~ 开仓/平仓 模式
GV_CompMode := 0

;~ 开仓手数
GV_CompNumb := 1

;~ 立即停止扫描价格.可终止当前的自动开仓操作.
GV_isBusy := 0

;~ 持仓方向,指持有多单还是空单
GV_HoldingDrt := 0

;~ 持仓目前的盈利级别,以位数表示,盈利时为正数,亏损为负数
GV_HoldingProceedLevel := 0

;~ 价格变化的颜色
GV_priceUpGreenColor := "0x009401"
GV_priceDownRedColor := "0x0000F0"
;~ GV_priceNormalColor := "0xE2C1D0"

;~ 持仓栏第一行的背景颜色
GV_HoldingBGColor := "0xF3DEE7"

;~ 当前价格变化的方向
GV_PriceDrt := Const_Nothing
;~ GV_fontBlackColor := "0x000000"

;~ 当前是否正在自动平仓
GV_isAutoSelling := 0


;~ [Start]
OnExit, On_Exit

gosub, TRAY_SetMenus

SYS_IniGetVar()

OpenWin_iSky()

OpenWin_CNIClient()

SetTimer, HL_UpdateInfoTip, 2000

return

;~ /* hotkey */
;~ [开仓操作]
^NumpadAdd::
	;~ trace("buy return: " . KL_Buy(Const_Comp_BUY_UP))
	KL_Buy(Const_Comp_BUY_UP)
return

^NumpadSub::
	;~ trace("buy return: " . KL_Buy(Const_Comp_BUY_DOWN))
	KL_Buy(Const_Comp_BUY_DOWN)
return

;~ [平仓操作]
^Numpad1::
	KL_Sell(1)
return
^Numpad2::
	KL_Sell(2)
return
^Numpad3::
	KL_Sell(3)
return
^Numpad4::
	KL_Sell(4)
return
^Numpad5::
	KL_Sell(5)
return

;~ [系统选项]
!0::
	KL_SetAutoSellPrice()
return
!1::
	KL_SetCompNumb()
return
!2::
	KL_SetCompMode()
return

;~ [系统操作]
;~ 设置iSky窗口
#^f::
	KL_ISkyWinFormat()
return

#x::
	Reload
#F8::
	ExitApp


;~ [Timer and Handler]
;~ 停止自动平仓
Timer_AutoSellStop:
	trace("自动平仓 `- 关闭")
	SetTimer, Handler_AutoSell, Off
return

;~ 开始自动平仓
Timer_AutoSellStart:
	;~ SetTimer, Handler_AutoSell, Off
	;~ 新算法让扫描一次的时间减少到200ms以内,可以快速扫描
	;~ 但要注意平仓操作的延迟,不过较长的平仓延迟将会自动缓存
	;~ 最好不要小于300ms的频率
	gosub, Handler_AutoSell
	SetTimer, Handler_AutoSell, 500
return

Handler_AutoSell:
	;~ TM_MSec_Before := A_TickCount
	;~ trace("Handler_AutoSell`nSYS_GetHoldingDirection: " . SYS_GetHoldingDirection().2)

	;~ SYS_GetHoldingDirection是快速的方法
	if SYS_GetHoldingDirection() = Const_Nothing
	{
		gosub, Timer_AutoSellStop
		return
	}

	trace("自动平仓`(按Alt 0取消`)",4)

	;~ 新版的检查盈亏情况算法也是相当快速的
	_newPro := SYS_GetHoldingProceedNew()

	if (_newPro < 0)
	{
		;~ [TODO] if losing, 10000 is the line
		_newPro /= 10
		;~ Lost
		Trace("自动平仓中!`n亏损`: " . _newPro . "`n目标线: " . GV_autoSellPrice)

	}
	else
	{
		;~ Proceeds
		Trace("自动平仓中!`n获利`: " . _newPro . "`n目标线: " . GV_autoSellPrice)
	}
	;~ Trace("Auto Ping Cang ing",3)
	;~ TM_MSec_After := A_TickCount
	;~ if Trace("耗时: " . TM_MSec_After - TM_MSec_Before . " 毫秒")
	if (abs(_newPro) >= GV_autoSellPrice)
	{
		KL_Sell(1,1) ; is auto sell

		;~ when user sell will stop autosell, so here keep run
		gosub, Timer_AutoSellStart
		return
	}
return

HL_UpdateInfoTip:
	IfWinActive, ahk_class SunAwtFrame
	{
		if GV_CompMode
		{
			Trace("智能模式 手数`: " . GV_CompNumb,3)
		}
		else
		{
			Trace("快速模式 手数`: " . GV_CompNumb,3)
		}
	}
	else IfWinNotActive, ahk_class SunAwtFrame
	{
		ToolTip
	}
return

;~ [TM] Tray Menu

TRAY_SetMenus:
	Menu,tray,NoStandard
	Menu,tray,Icon, %File_Ico%
	Menu,tray,Tip, %SYS_ScriptInfo%
	Menu,tray,Add, 关于 %SYS_ScriptInfo%, Handler_Help
	Menu,tray,Add ;The line
	Menu,tray,Add, 更改手数, Handler_SetCompNumb
	Menu,tray,Add, 更改模式, Handler_SetCompMode
	Menu,tray,Add ;The line
	Menu,tray,Add, 重启程序, Handler_Reload
	Menu,tray,Add, 退出, SYS_Exit
return

;~ Tray Menu Helper
Handler_Help:
	IfExist, %File_Readme%
		Run, %File_Readme%
return

Handler_SetCompNumb:
KL_SetCompNumb()
return

Handler_SetCompMode:
KL_SetCompMode()
return

Handler_Reload:
	Reload
return

on_Exit:
	;~ trace("I'm leaving~")
	SYS_IniWrite(1)
	SetTimer, HL_UpdateInfoTip, Off
	ExitApp

SYS_Exit:
	ExitApp