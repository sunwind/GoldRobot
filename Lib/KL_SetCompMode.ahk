KL_SetCompMode()
{
	SYS_CompReady()

    global GV_CompMode, File_Ini

	InputBox, _CompMode, ��ϣ��ʹ�����ֲ���ģʽ?
		,��ǰΪ`: %GV_CompMode%`n`n1 `= ����ģʽ`n2 `= ����ģʽ,,350, 250
    if (errorlevel = 0)
    {
		if (_CompMode = 1)
		{
			GV_CompMode := 1
			trace("����ģʽ����Ϊ`: ����ģʽ")
		}
		else if (_CompMode = 2)
		{
			GV_CompMode := 0
			trace("����ģʽ����Ϊ`: ����ģʽ")
		}
	}
	else
	{
		GV_CompMode := 0
		trace("����ģʽ����Ϊ`: ����ģʽ")
	}
	;~ GV_CompMode := Trace("Do you like me help you watch the price?`n`nYes `= Wait price better.`nNo `= Fast.",2)

	;~ GV_CompMode ? _mStr := "1: NORMAL" : _mStr := "0: FAST"

	;~ trace("����ģʽ����Ϊ`: " . GV_CompMode)
	;~ IniWrite, %GV_CompMode%, %File_Ini%, GlobalVars, ComportMode

	SYS_CompFinish()
}