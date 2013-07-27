KL_ISkyWinFormat()
{
    IfWinExist, ahk_class MAINWND_WX
    {
        WinActivate
        WinGetPos, vx, vy, vw, vh, ahk_class MAINWND_WX
        SysGet, SYS_MonitorCount, MonitorCount
        if (SYS_MonitorCount>1)
        {
            ;one more monitor
            wt_x := A_ScreenWidth + 2
            wt_w := A_ScreenWidth - 4
        }
        else if (SYS_MonitorCount = 1)
        {
            ;single monitor
            wt_x := 2
            wt_w := A_ScreenWidth - 84
        }
        wt_y := 2
        wt_h := A_ScreenHeight - 4
        WinMove, ahk_class MAINWND_WX, ,wt_x, wt_y, wt_w, wt_h
    }
    else
    {
        trace("SW_SetISkyWin WRONG!`niSky client not exist")
    }
}