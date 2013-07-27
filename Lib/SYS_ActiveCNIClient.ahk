;~ 激活主界面
SYS_ActiveCNIClient()
{
	IfWinExist, 中国北方金银业有限公司 ahk_class SunAwtFrame
		WinActivate
	IfWinNotExist, 中国北方金银业有限公司 ahk_class SunAwtFrame
		trace("CNI Client not exist!",1)
}