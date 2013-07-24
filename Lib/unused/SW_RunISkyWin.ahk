SW_RunISkyWin()
{
    if (WIN_iSkyPath = "nothing") and IfWinNotExist, ahk_class MAINWND_WX
    {
            try
            {
                Run, %WIN_iSkyPath%
                Sleep, 2000
            }
            catch
            {
                Trace("iSky client can't run",1)
            }
            WinWait, ahk_class MAINWND_WX,,10
            WinActivate
            MouseGetPos,_x,_y,_win
            Send, {Click 133,40}
            MouseMove, _x,_y
    }
}