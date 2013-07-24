;~ watch the price color to beter
SYS_PriceWatcher(tarColor)
{
	IfWinExist, ahk_class SunAwtFrame
		WinActivate
	else
	{
		trace("Here is no client?",1)
	}

	l1x1 := 60
	l1y1 := 250
	l1x2 := 80
	l1y2 := 280

	trace("Scaning`nplease wait and don't move mouse...")

	while !SYS_CheckColor(l1x1,l1y1,l1x2,l1y2,tarColor)
	{
		if GV_CompMode
		{
			;~ trace("funcCheckPriceColor return false",2)
			return false
		}
		;~ trace("I'm checking price" . A_Index)
		Sleep, 100
	}
	;~ trace("Go !!!")
	return true
}