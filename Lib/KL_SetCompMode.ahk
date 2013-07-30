KL_SetCompMode()
{
	SYS_CompReady()

    global GV_CompMode
	
	_str := getCompModeName()
	
	InputBox, _CompMode, 设置操作模式
		,您希望使用哪种操作模式`? 当前为`: %_str%`n`n1 `= 智能模式`n`n2 `= 快速模式`n`n回车=保持当前模式`n`nESC=切换模式
		,,350, 300
    if (errorlevel = 0)
    {
		if (_CompMode = 1)
		{
			GV_CompMode := 1
			;~ trace("操作模式更新为`:`n智能模式")
		}
		else if (_CompMode = 2)
		{
			GV_CompMode := 0
			;~ trace("操作模式更新为`:`n快速模式")
		}
		else
		{
			trace("操作模式没有更改!")
		}
	}
	else
	{
		GV_CompMode := !GV_CompMode
	}
	
	trace("操作模式更新为: " . getCompModeName())
	SYS_CompFinish()
}

getCompModeName()
{
	global GV_CompMode
	
	if (GV_CompMode = 0)
	{
		str_CompMode := "快速模式"
	}
	else if (GV_CompMode = 1)
	{
		str_CompMode := "智能模式"
	}
	return %str_CompMode%
}