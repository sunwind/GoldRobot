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
;~ �۸����ϻ���
Const_PRICE_UP := "Const_PRICE_UP"
Const_PRICE_DOWN := "Const_PRICE_DOWN"

;~ ���Ǵ�����
Const_Nothing := "Const_Nothing"

;~ �ֲֵķ���
Const_Holding_UP := "Const_Holding_UP"
Const_Holding_DOWN := "Const_Holding_DOWN"

;~ �ֲ��Ƿ�ӯ��
Const_Holding_Profit := "Const_Holding_Profit"
Const_Holding_Lost := "Const_Holding_Lost"

;~ �����
Const_Comp_BUY_UP := "Const_Comp_BUY_UP"
Const_Comp_BUY_DOWN := "Const_Comp_BUY_DOWN"

;~ ����
Const_Comp_SELL := "Const_Comp_SELL"

;~ [Global Var]
GV_CNIClientPath := 0
GV_iSkyPath := 0

;~ �Զ�ƽ�ּ���
GV_autoSellPrice := 10000

;~ ����/ƽ�� ģʽ
GV_CompMode := 0

;~ ��������
GV_CompNumb := 1

;~ ����ֹͣɨ��۸�.����ֹ��ǰ���Զ����ֲ���.
GV_isBusy := 0

;~ �ֲַ���,ָ���ж൥���ǿյ�
GV_HoldingDrt := 0

;~ �ֲ�Ŀǰ��ӯ������,��λ����ʾ,ӯ��ʱΪ����,����Ϊ����
GV_HoldingProceedLevel := 0

;~ �۸�仯����ɫ
GV_priceUpGreenColor := "0x009401"
GV_priceDownRedColor := "0x0000F0"
;~ GV_priceNormalColor := "0xE2C1D0"

;~ �ֲ�����һ�еı�����ɫ
GV_HoldingBGColor := "0xF3DEE7"

;~ ��ǰ�۸�仯�ķ���
GV_PriceDrt := Const_Nothing
;~ GV_fontBlackColor := "0x000000"

;~ ��ǰ�Ƿ������Զ�ƽ��
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
;~ [���ֲ���]
^NumpadAdd::
	;~ trace("buy return: " . KL_Buy(Const_Comp_BUY_UP))
	KL_Buy(Const_Comp_BUY_UP)
return

^NumpadSub::
	;~ trace("buy return: " . KL_Buy(Const_Comp_BUY_DOWN))
	KL_Buy(Const_Comp_BUY_DOWN)
return

;~ [ƽ�ֲ���]
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

;~ [ϵͳѡ��]
!0::
	KL_SetAutoSellPrice()
return
!1::
	KL_SetCompNumb()
return
!2::
	KL_SetCompMode()
return

;~ [ϵͳ����]
;~ ����iSky����
#^f::
	KL_ISkyWinFormat()
return

#x::
	Reload
#F8::
	ExitApp


;~ [Timer and Handler]
;~ ֹͣ�Զ�ƽ��
Timer_AutoSellStop:
	trace("�Զ�ƽ�� `- �ر�")
	SetTimer, Handler_AutoSell, Off
return

;~ ��ʼ�Զ�ƽ��
Timer_AutoSellStart:
	;~ SetTimer, Handler_AutoSell, Off
	;~ ���㷨��ɨ��һ�ε�ʱ����ٵ�200ms����,���Կ���ɨ��
	;~ ��Ҫע��ƽ�ֲ������ӳ�,�����ϳ���ƽ���ӳٽ����Զ�����
	;~ ��ò�ҪС��300ms��Ƶ��
	gosub, Handler_AutoSell
	SetTimer, Handler_AutoSell, 500
return

Handler_AutoSell:
	;~ TM_MSec_Before := A_TickCount
	;~ trace("Handler_AutoSell`nSYS_GetHoldingDirection: " . SYS_GetHoldingDirection().2)

	;~ SYS_GetHoldingDirection�ǿ��ٵķ���
	if SYS_GetHoldingDirection() = Const_Nothing
	{
		gosub, Timer_AutoSellStop
		return
	}

	trace("�Զ�ƽ��`(��Alt 0ȡ��`)",4)

	;~ �°�ļ��ӯ������㷨Ҳ���൱���ٵ�
	_newPro := SYS_GetHoldingProceedNew()

	if (_newPro < 0)
	{
		;~ [TODO] if losing, 10000 is the line
		_newPro /= 10
		;~ Lost
		Trace("�Զ�ƽ����!`n����`: " . _newPro . "`nĿ����: " . GV_autoSellPrice)

	}
	else
	{
		;~ Proceeds
		Trace("�Զ�ƽ����!`n����`: " . _newPro . "`nĿ����: " . GV_autoSellPrice)
	}
	;~ Trace("Auto Ping Cang ing",3)
	;~ TM_MSec_After := A_TickCount
	;~ if Trace("��ʱ: " . TM_MSec_After - TM_MSec_Before . " ����")
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
			Trace("����ģʽ ����`: " . GV_CompNumb,3)
		}
		else
		{
			Trace("����ģʽ ����`: " . GV_CompNumb,3)
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
	Menu,tray,Add, ���� %SYS_ScriptInfo%, Handler_Help
	Menu,tray,Add ;The line
	Menu,tray,Add, ��������, Handler_SetCompNumb
	Menu,tray,Add, ����ģʽ, Handler_SetCompMode
	Menu,tray,Add ;The line
	Menu,tray,Add, ��������, Handler_Reload
	Menu,tray,Add, �˳�, SYS_Exit
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