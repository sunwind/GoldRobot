;~ 设置系统托盘菜单和图标
funcSetTray()
{
		;~ 托盘图标设置
		Menu,tray,NoStandard
		Menu,tray,Icon, goldrobot.ico
		Menu,tray,Add,帮助说明,subTrayHelper

	return
}

;~ 系统栏图标的帮助提示
subTrayHelper:
IfExist, %A_ScriptDir%\readme.txt
	Run, "%A_ScriptDir%\readme.txt"
return