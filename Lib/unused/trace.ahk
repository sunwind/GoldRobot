;~ Show some words to interchange informations between user and system.
;~ arg: vText String : Some words
;~ arg: isDie String :
;~ 	"" = Normal traytip
;~ 	1 = Stop and DYING ERROR
;~ 	2 = User can choice YES or NO.Then return TRUE or FALSE.
trace(vText, isDie = 0)
{
	if (isDie = 1)
	{
		MsgBox, 16, !!! I'm DIED !!!, %vText%, 5
		ExitApp
	}
	else if (isDie = 2)
	{
		MsgBox, 4,! Problem !, %vText%
		IfMsgBox  yes
			return true
		else
			return false
	}
	else if (isDie = 3)
	{
		ToolTip, %vText%, 950, 2
		return true
	}
	else
	{
		TrayTip, Attention please ..., %vText%, 31,1
		return true
	}
}