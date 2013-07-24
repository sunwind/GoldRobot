SW_ActiveCNIWin()
{
	IfWinExist, ahk_class SunAwtFrame
        WinActivate
	else
		trace("CNIClient not run",1)
}