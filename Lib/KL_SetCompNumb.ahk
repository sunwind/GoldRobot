;~ set buying number
KL_SetCompNumb()
{
	;~ Force to stop any comport
    SYS_CompReady()

    Global File_Ini, GV_CompNumb


	InputBox, newNumb, 设置开仓数量,请输入您每次开仓的手数`n当前为: %GV_CompNumb%,, 400,200
	if Errorlevel
    {
		Trace("Comport Number`n NOT change!")
    }
	else
	{
		if newNumb is not Integer
		{
			Trace("开仓手数`n没有更改")
		}
		else
		{
			newNumb := Abs(newNumb)
			if (newNumb <> GV_CompNumb)
				GV_CompNumb = %newNumb%
			if GV_CompNumb > 10
				GV_CompNumb = 10
			Trace("开仓手数更新为:`n" . GV_CompNumb)
		}
	}
	;~ IniWrite, %GV_CompNumb%, %File_Ini%, GlobalVars, ComportNumber
	SYS_CompFinish()
}