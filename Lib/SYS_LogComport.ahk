;~ record comport to local log file
;~ arg: drt string , allow: Const_Comp_BUY_UP, Const_Comp_BUY_DOWN and Const_Comp_SELL
SYS_LogComport(drt,isAuto = 0)
{
	global GV_CompNumb, Const_Comp_SELL

    if (drt <> Const_Comp_SELL)
    {
        ;~ drt .= "Buy"
        _str := drt . "`|" . GV_CompNumb
    }
    else if (drt = Const_Comp_SELL)
    {
        if isAuto
            drt .= "_auto"
        _str := drt . "`|" . GV_CompNumb
    }
	else
		trace("SYS_LogComport arg1 wrong",1)

    File_log = %A_ScriptDir%\goldrobot_log.txt
	compTime := A_YYYY . "-" . A_MM . "-" . A_DD . "`|" . A_Hour . "`:" . A_Min . "`:" .  A_Sec
	appendStr := compTime . "`|" . _str . "`r`n"
	try
	{
		FileAppend, %appendStr%, %File_Log%, CP936
	}
	catch e
	{
		trace("funcLog_Write Ê§°Ü",1)
	}
}