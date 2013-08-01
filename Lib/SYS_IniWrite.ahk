SYS_IniWrite()
{
	global GV_CNIClientPath, GV_iSkyPath, File_Ini

	IniWrite, %GV_CNIClientPath%, %File_Ini%, Clients, CNIClientPath
	IniWrite, %GV_iSkyPath%, %File_Ini%, Clients, iSkyPath
}