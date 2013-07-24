;~ set buying number
KL_SetCompNumb()
{
	;~ Force to stop any comport
    SYS_CompReady()
	
    Global File_Ini, GV_CompNumb
	

	InputBox, newNumb, title,Please input your BUY`-Number`nNOW is: %GV_CompNumb%,, 400,200
	if Errorlevel
    {
		Trace("Comport Number`n NOT change!")
    }
	else
	{
		if newNumb is not Integer
		{
			Trace("Are U kidding me?`nNothing changed!")
		}
		else
		{
			newNumb := Abs(newNumb)
			if (newNumb <> GV_CompNumb)
				GV_CompNumb = %newNumb%
			if GV_CompNumb > 10
				GV_CompNumb = 10
			Trace("Comport Number change to:`n" . GV_CompNumb)
		}
	}
	;~ IniWrite, %GV_CompNumb%, %File_Ini%, GlobalVars, ComportNumber
	SYS_CompFinish()
}