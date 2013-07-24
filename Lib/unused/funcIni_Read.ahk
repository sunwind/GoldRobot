;~ 辅助方法
;~ 读取INI设置文件
;~ 不会返回其他值,出现 极端 错误就退出程序
funcReadINI(sectionName,keyName)
{
	try
	{
		IniRead, outVar, %sys_IniFilePath%,%sectionName%,%keyName%
		return %outVar%
	}
	catch e
	{
		trace("ini设置文件读取失败",1)
	}
}