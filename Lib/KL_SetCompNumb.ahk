;~ set buying number
KL_SetCompNumb()
{
	;~ Force to stop any comport
    SYS_CompReady()

    Global File_Ini, GV_CompNumb


	InputBox, newNumb, ���ÿ�������,��������ÿ�ο��ֵ�����`n��ǰΪ: %GV_CompNumb%,, 400,200
	if Errorlevel
    {
		Trace("Comport Number`n NOT change!")
    }
	else
	{
		if newNumb is not Integer
		{
			Trace("��������`nû�и���")
		}
		else
		{
			newNumb := Abs(newNumb)
			if (newNumb <> GV_CompNumb)
				GV_CompNumb = %newNumb%
			if GV_CompNumb > 10
				GV_CompNumb = 10
			Trace("������������Ϊ:`n" . GV_CompNumb)
		}
	}
	;~ IniWrite, %GV_CompNumb%, %File_Ini%, GlobalVars, ComportNumber
	SYS_CompFinish()
}