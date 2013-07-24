;~ [SW] Set CNIClient Windows
OpenWin_CNIClient()
{
    global GV_CNIClientPath

    IfWinNotExist, ahk_class SunAwtFrame
    {
        IfWinNotExist, 登录 ahk_class SunAwtDialog
        {
            try
			{
                Run, %GV_CNIClientPath%
				WinWait, 登录 ahk_class SunAwtDialog,,10
			}
            catch
                Trace("OpenWin_CNIClient is wrong!",1)
		}
		WinActivate, 登录 ahk_class SunAwtDialog
		{
			Sleep, 100
			Send, {Click 330,187}111555{Enter}
		}
	}
	
	SYS_CompReady()
	
	WinWait, ahk_class SunAwtFrame,,10
	WinActivate, ahk_class SunAwtFrame
	{
		WinGetPos,cniX,cniY,cniW,cniH
		tarW := 1200
		tarH := 760
		tarX := 2
		;~ tarY := A_ScreenHeight - tarH - 2 + 20 * 10
		tarY := A_ScreenHeight - tarH - 2
		if (cniX != tarX or cniY != tarY or cniW != tarW or cniH != tarH)
		{
			WinMove, ahk_class SunAwtFrame,,tarX,tarY,tarW,tarH
		}
	}
	SYS_CompFinish()
}