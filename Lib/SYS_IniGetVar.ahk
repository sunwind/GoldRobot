SYS_IniGetVar()
{
	global GV_CompMode,	GV_CompNumb, GV_CNIClientPath, GV_iSkyPath, File_Ini, Const_Nothing


	IniRead, GV_CNIClientPath, %File_Ini%, Clients, CNIClientPath, 0
	if (GV_CNIClientPath = 0)
    {
		if !trace("请指定CNIClient.exe文件路径.`n`n您只需要查找一次`,我会记住它的位置下次自动开启.",2)
		{
			trace("好吧,再见`~",1)
		}
        ;~ first time run me
        ;~ [ini] let user choice the CNIClient client exe file to save to ini file
        FileSelectFile, SelectedFile, S3, CNIClient.exe , select CNIClient luncher, CNIClient (*.exe)
        if SelectedFile =
		{
            Trace("CNI交易客户端是必须的!`n请删除同名ini文件并重试`.`n程序即将自动退出`~",1)
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
		if !trace("如果您使用iSky系列行情软件`,我能协助您自动开启它并设置位置.`n`n您只需要查找一次`,我会记住它的位置下次自动开启.",2)
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
				Trace("你没有选择iSky`,以后不再提示`.")
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

	if !trace("你好~`n我准备好了!`n`n点击确定`,我开始工作`.",2)
		ExitApp
	return
}