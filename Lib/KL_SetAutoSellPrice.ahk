KL_SetAutoSellPrice()
{
    ;~ Force to stop any comport
    SYS_CompReady()

    global GV_autoSellPrice

	InputBox, vPrice, Change AutoPingCang Level
		,NOW`: %GV_autoSellPrice%`n`n1 `= 100`n2 `= 1`,000`n3 `= 10,000,,350, 250
    if (errorlevel = 0)
    {
        if (vPrice = 1)
        {
            vPrice := 100
        }
        else if (vPrice = 2)
        {
            vPrice := 1000
        }
        else if (vPrice = 3)
        {
            vPrice := 10000
        }
        else if (vPrice = 4)
        {
            vPrice := 100000
        }

		global GV_autoSellPrice := vPrice
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