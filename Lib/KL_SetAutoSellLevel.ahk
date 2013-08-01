KL_SetAutoSellLevel()
{
    ;~ Force to stop any comport
    SYS_CompReady()

    global GV_autoSellPrice

	InputBox, vPrice, Change AutoPingCang Level
		,NOW`: %GV_autoSellPrice%`n`n1 `= 100`n2 `= 1`,000`n3 `= 10`,000,,350, 250
    if (errorlevel = 0)
    {
        if (vPrice = 1)
        {
            GV_autoSellPrice := 100
        }
        else if (vPrice = 2)
        {
            GV_autoSellPrice := 1000
        }
        else if (vPrice = 3)
        {
            GV_autoSellPrice := 10000
        }
        gosub, Timer_AutoSellStart
    }
    else
    {
        gosub, Timer_AutoSellStop
    }
    SYS_CompFinish()
    ;~ Suspend, Off
	return
}