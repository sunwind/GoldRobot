;~ [SW] Set CNIClient Windows
SW_RunCNIClient()
{
    IfWinNotExist, ahk_class SunAwtFrame
    {
        IfWinNotExist, 登录 ahk_class SunAwtDialog
        {
            try
            {
                Run, %WIN_CNIClientPath%
				Sleep, 2000
            }
            catch
            {
                Trace("SW_RunCNIClient is wrong!",1)
            }
		}
		SW_DoCNILogin()
    }
	return 1
}

SW_DoCNILogin()
{
	IfWinExist, 登录 ahk_class SunAwtDialog
	{
		WinActivate
		Sleep, 800
		SendInput, {Click 330,187}111555{Enter}
		WinWait, ahk_class SunAwtFrame,, 10
		if ErrorLevel
			Trace("SW_DoCNILogin is wrong!",1)
		else
			return 1
	}
	else
	{
		Trace("SW_RunCNIClient is wrong!",1)
	}
}