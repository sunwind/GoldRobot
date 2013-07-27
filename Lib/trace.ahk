;~ Show some words to interchange informations between user and system.
;~ arg: vText String : Some words
;~ arg: isDie String :
;~ 	"" = Normal traytip
;~ 	1 = Stop and DYING ERROR
;~ 	2 = User can choice YES or NO.Then return TRUE or FALSE.
;~ 3 = Only use for GoldRobot
trace(vText, isDie = 0)
{
	if (isDie = 1)
	{
		Suspend , On
		MsgBox, 16, !!! I'm DIED !!!, %vText%, 5
		ExitApp
	}
	else if (isDie = 2)
	{
		Suspend , On
		MsgBox, 36,Question !, %vText%
		Suspend, off
		IfMsgBox  yes
			return true
		else
			return false
	}
	else if (isDie = 3)
	{
		ToolTip, %vText%, 950, 3
		return true
	}
	else if (isDie = 4)
	{
		ToolTip, %vText%, 800, 3
		return true
	}
	else
	{
		TrayTip, Attention please !, %vText%, 31,1
		return true
	}
}