;~ Gold Robot Version 0.3.0.2
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
;~ SetBatchLines, -1
SetDefaultMouseSpeed, 0
;~ SetMouseDelay, 0
;~ SetKeyDelay, 0, 0
SetTitleMatchMode, 1
CoordMode, Window
SendMode Input

; [SYS] autostart section
SplitPath, A_ScriptFullPath, SYS_ScriptNameExt, SYS_ScriptDir, SYS_ScriptExt, SYS_ScriptNameNoExt, SYS_ScriptDrive
SYS_ScriptVersion = 0.3.0.2
SYS_ScriptBuild = 2013-7-20
SYS_ScriptInfo = %SYS_ScriptNameNoExt% %SYS_ScriptVersion%

;~ [Files]
File_Ini = %A_ScriptDir%\%SYS_ScriptNameNoExt%.ini
File_Readme = %A_ScriptDir%\goldrobot_readme.txt
File_Ico = %A_ScriptDir%\goldrobot.ico


;~ [Var]

;~ [Const]
Const_PRICE_UP := "PriceUp"
Const_PRICE_DOWN := "PriceDown"

Const_Nothing := "Nothing"

Const_HoldingUp := "HoldingUp"
Const_HoldingDown := "HoldingDown"


;~ [Global Var]
GV_CNIClientPath := 0
GV_iSkyPath := 0

GV_autoSellPrice := 10000
GV_CompMode := 0
GV_CompNumb := 1

;~ Cancels every actions right now
GV_isBusy := 0

;~ Holding info
GV_HoldingDrt := 0
GV_HoldingProceedLevel := 0

GV_priceUpGreenColor := "0x009401"
GV_priceDownRedColor := "0x0000F0"
;~ GV_priceNormalColor := "0xE2C1D0"

;~ if the point not this color mast be holding
GV_HoldingBGColor := "0xF3DEE7"

GV_PriceDrt := Const_Nothing
;~ GV_fontBlackColor := "0x000000"

;~ Toggle auto Sell running
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
;~ buy
^NumpadAdd::
;~ trace("buy return: " . KL_Buy("up"))
KL_Buy("up")
return

^NumpadSub::
;~ trace("buy return: " . KL_Buy("down"))
KL_Buy("down")
return

;~ sell
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

;~ option
!0::
KL_SetAutoSellPrice()
return
!1::
KL_SetCompNumb()
return
!2::
KL_SetCompMode()
return

;~ system
#^F::
KL_ISkyWinFormat()
return

#x::
Reload
return
#F8::
ExitApp


;~ [Timer and Handler]
;~ Stop Auto Ping Cang
Timer_AutoSellStop:
	trace("Auto sell OFF")
	SetTimer, Handler_AutoSell, Off
return

;~ Start Auto Ping Cang
Timer_AutoSellStart:
	;~ SetTimer, Handler_AutoSell, Off
	;~ [TODO] Can't faster than 1 sec here
	gosub, Handler_AutoSell
	SetTimer, Handler_AutoSell, 1500
return

Handler_AutoSell:
;~ TM_MSec_Before := A_TickCount
;~ trace("Handler_AutoSell`nSYS_GetHoldingDirection: " . SYS_GetHoldingDirection().2)

	if SYS_GetHoldingDirection() = Const_Nothing
	{
		;~ no Holding no auto sell
		gosub, Timer_AutoSellStop
		return
	}

	trace("AUTO SELLING",4)

	_newPro := SYS_GetHoldingProceed()

	;~ if !_newPro
	;~ {
		;~ Trace("AUTO SELLING`nThere is no holding...")
		;~ return
	;~ }

	if (_newPro < -1)
	{
		;~ [TODO] if losing, 10000 is the line
        _newPro /= 10
		;~ Lost
		Trace("AUTO SELLING`nLOST`nLEVEL: " . _newPro . "`nTARGET: " . GV_autoSellPrice)

	}
	else
	{
		;~ Proceeds
		Trace("Auto Selling`nWIN`nLEVEL: " . _newPro . "`nTARGET: " . GV_autoSellPrice)
	}
	;~ Trace("Auto Ping Cang ing",3)
;~ TM_MSec_After := A_TickCount
;~ if Trace("耗时: " . TM_MSec_After - TM_MSec_Before . " 毫秒", 2)
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
			Trace("NORMAL Mode",3)
		}
		else
		{
			Trace("FAST Mode",3)
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
Menu,tray,Add, About %SYS_ScriptInfo%, Handler_Help
Menu,tray,Add ;The line
Menu,tray,Add, Exit, SYS_Exit
return

;~ Tray Menu Helper
Handler_Help:
IfExist, %File_Readme%
	Run, %File_Readme%
return

on_Exit:
;~ trace("I'm leaving~")
SYS_IniWrite(1)
SetTimer, HL_UpdateInfoTip, Off
SYS_Exit:
ExitApp