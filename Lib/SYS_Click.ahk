;~ Click the buy or ping cang window
;arg where String: allow "ok" or "cancel"
SYS_Click(where)
{
    SYS_CompReady()
    
	WinWait, ahk_class SunAwtDialog,,5
    if ErrorLevel
    {
        SYS_CompFinish()
        trace("No where I can click...",2)
        return
    }
	
	WinActivate, ahk_class SunAwtDialog, , 5
    {
        if (where = "ok")
        {
            Send, {click 52,350}
            Sleep, 100
            WinWait, 注意 ahk_class SunAwtDialog,,5
                WinKill
        }
        else if (where = "cancel")
        {
            Send, {click 155,350}
        }
        else
        {
            trace("funcClick arg wrong",1)
        }
	}
    SYS_CompFinish()
    return 1
}