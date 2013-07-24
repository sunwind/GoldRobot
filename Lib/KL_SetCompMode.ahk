KL_SetCompMode()
{
	SYS_CompReady()

    global GV_CompMode, File_Ini
	
	InputBox, _CompMode, Do you like me help you watch the price?
		,NOW`: %GV_CompMode%`n`n1 `= Normal`n2 `= Fast,,350, 250
    if (errorlevel = 0)
    {
		if (_CompMode = 1)
		{
			GV_CompMode := 1
		}
		else if (_CompMode = 2)
		{
			GV_CompMode := 0
		}
	}
	else
	{
		GV_CompMode := 0
	}
	;~ GV_CompMode := Trace("Do you like me help you watch the price?`n`nYes `= Wait price better.`nNo `= Fast.",2)

	;~ GV_CompMode ? _mStr := "1: NORMAL" : _mStr := "0: FAST"

	trace("Comport mode change to `n" . _mStr)
	;~ IniWrite, %GV_CompMode%, %File_Ini%, GlobalVars, ComportMode

	SYS_CompFinish()
}