KL_SetCompMode()
{
	SYS_CompReady()

    global GV_CompMode
	
	_str := getCompModeName()
	
	InputBox, _CompMode, ���ò���ģʽ
		,��ϣ��ʹ�����ֲ���ģʽ`? ��ǰΪ`: %_str%`n`n1 `= ����ģʽ`n`n2 `= ����ģʽ`n`n�س�=���ֵ�ǰģʽ`n`nESC=�л�ģʽ
		,,350, 300
    if (errorlevel = 0)
    {
		if (_CompMode = 1)
		{
			GV_CompMode := 1
			;~ trace("����ģʽ����Ϊ`:`n����ģʽ")
		}
		else if (_CompMode = 2)
		{
			GV_CompMode := 0
			;~ trace("����ģʽ����Ϊ`:`n����ģʽ")
		}
		else
		{
			trace("����ģʽû�и���!")
		}
	}
	else
	{
		GV_CompMode := !GV_CompMode
	}
	
	trace("����ģʽ����Ϊ: " . getCompModeName())
	SYS_CompFinish()
}

getCompModeName()
{
	global GV_CompMode
	
	if (GV_CompMode = 0)
	{
		str_CompMode := "����ģʽ"
	}
	else if (GV_CompMode = 1)
	{
		str_CompMode := "����ģʽ"
	}
	return %str_CompMode%
}