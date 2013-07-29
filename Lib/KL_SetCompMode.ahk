KL_SetCompMode()
{
	SYS_CompReady()

    global GV_CompMode, File_Ini

	InputBox, _CompMode, 你希望使用哪种操作模式?
		,当前为`: %GV_CompMode%`n`n1 `= 常规模式`n2 `= 快速模式,,350, 250
    if (errorlevel = 0)
    {
		if (_CompMode = 1)
		{
			GV_CompMode := 1
			trace("操作模式更新为`: 常规模式")
		}
		else if (_CompMode = 2)
		{
			GV_CompMode := 0
			trace("操作模式更新为`: 快速模式")
		}
	}
	else
	{
		GV_CompMode := 0
		trace("操作模式更新为`: 快速模式")
	}
	;~ GV_CompMode := Trace("Do you like me help you watch the price?`n`nYes `= Wait price better.`nNo `= Fast.",2)

	;~ GV_CompMode ? _mStr := "1: NORMAL" : _mStr := "0: FAST"

	;~ trace("操作模式更新为`: " . GV_CompMode)
	;~ IniWrite, %GV_CompMode%, %File_Ini%, GlobalVars, ComportMode

	SYS_CompFinish()
}