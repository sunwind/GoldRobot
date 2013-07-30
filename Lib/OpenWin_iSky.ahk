
OpenWin_iSky()
{
	global GV_iSkyPath, Const_Nothing

	SYS_CompReady()

	if (GV_iSkyPath = Const_Nothing) or !GV_iSkyPath
    {
		Trace("找不到iSky客户端")
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
			Trace("找不到iSky客户端")
			return 0
		}
	}


	WinActivate, ahk_class MAINWND_WX
	{
		Sleep, 500
		MouseGetPos,_x,_y,_win
		Send, {Click 130,40}
		MouseMove, _x,_y
	}
	SYS_CompFinish()
	return 1
}