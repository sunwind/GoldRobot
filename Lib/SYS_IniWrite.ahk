SYS_IniWrite(isForce = 0)
{
	global GV_CompMode, GV_CompNumb, GV_CNIClientPath, GV_iSkyPath, File_Ini

	if !isForce
		if !trace("Do you want SAVE those settings for next time?`nComport Mode: " . GV_CompMode
			. "`nComport Number: " . GV_CompNumb
			. "`nCNIClient Path: " . GV_CNIClientPath
			. "`niSky Path: " . GV_iSkyPath,2)
		return

	IniWrite, %GV_CompMode%, %File_Ini%, GlobalVars, ComportMode
	IniWrite, %GV_CompNumb%, %File_Ini%, GlobalVars, ComportNumber
	IniWrite, %GV_CNIClientPath%, %File_Ini%, Clients, CNIClientPath
	IniWrite, %GV_iSkyPath%, %File_Ini%, Clients, iSkyPath
}