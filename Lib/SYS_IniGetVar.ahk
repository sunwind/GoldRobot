SYS_IniGetVar()
{
	global GV_CompMode,	GV_CompNumb, GV_CNIClientPath, GV_iSkyPath, File_Ini, Const_Nothing


	IniRead, GV_CNIClientPath, %File_Ini%, Clients, CNIClientPath, 0
	if (GV_CNIClientPath = 0)
    {
		if !trace("��ָ��CNIClient.exe�ļ�·��.`n`n��ֻ��Ҫ����һ��`,�һ��ס����λ���´��Զ�����.",2)
		{
			trace("�ð�,�ټ�`~",1)
		}
        ;~ first time run me
        ;~ [ini] let user choice the CNIClient client exe file to save to ini file
        FileSelectFile, SelectedFile, S3, CNIClient.exe , select CNIClient luncher, CNIClient (*.exe)
        if SelectedFile =
		{
            Trace("CNI���׿ͻ����Ǳ����!`n��ɾ��ͬ��ini�ļ�������`.`n���򼴽��Զ��˳�`~",1)
		}
        else
		{
			GV_CNIClientPath := SelectedFile
		}
		;~ IniWrite, %GV_CNIClientPath%, %File_Ini%, Clients, CNIClientPath
    }


	IniRead, GV_iSkyPath, %File_Ini%, Clients, iSkyPath, 0

    if (GV_iSkyPath = 0)
    {
		if !trace("�����ʹ��iSkyϵ���������`,����Э�����Զ�������������λ��.`n`n��ֻ��Ҫ����һ��`,�һ��ס����λ���´��Զ�����.",2)
		{
			GV_iSkyPath := Const_Nothing
			;~ trace("OK`, I'm going...",)
		}
		else
		{
			;~ [ini] let user choice the iSky client exe file to save to ini file
			FileSelectFile, SelectedFile, S3, iSky.exe , select iSky app luncher, iSky (*.exe)
			if SelectedFile =
			{
				Trace("��û��ѡ��iSky`,�Ժ�����ʾ`.")
				GV_iSkyPath := Const_Nothing
			}
			else
			{
				GV_iSkyPath := SelectedFile
			}
		}
		;~ IniWrite, %GV_iSkyPath%, %File_Ini%, Clients, iSkyPath
    }

	IniRead, GV_CompMode, %File_Ini%, GlobalVars, ComportMode, 5
	if (GV_CompMode = 5)
		KL_SetCompMode()

	IniRead, GV_CompNumb, %File_Ini%, GlobalVars, ComportNumber, 0
	if (GV_CompNumb = 0)
		KL_SetCompNumb()

	SYS_IniWrite(1) ; force to save

	if !trace("���~`n��׼������!`n`n���ȷ��`,�ҿ�ʼ����`.",2)
		ExitApp
	return
}