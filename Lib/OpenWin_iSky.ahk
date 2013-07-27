
OpenWin_iSky()
{
	global GV_iSkyPath

	SYS_CompReady()

	if (GV_iSkyPath = "nothing") or !GV_iSkyPath
    {
		Trace("iSky client not found")
		return 0
	}

	IfWinNotExist, ahk_class MAINWND_WX
	{
		try
		{
			Run, %GV_iSkyPath%
			WinWait, ahk_class MAINWND_WX,,15
		}
		catch
		{
			Trace("iSky client not found")
			return 0
		}
	}


	WinActivate, ahk_class MAINWND_WX
	{
		Sleep, 500
		MouseGetPos,_x,_y,_win
		Send, {Click 133,40}
		MouseMove, _x,_y
	}
	SYS_CompFinish()
	return 1
}