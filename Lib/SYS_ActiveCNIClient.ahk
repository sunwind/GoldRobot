;~ ����������
SYS_ActiveCNIClient()
{
	IfWinExist, �й���������ҵ���޹�˾ ahk_class SunAwtFrame
		WinActivate
	IfWinNotExist, �й���������ҵ���޹�˾ ahk_class SunAwtFrame
		trace("CNI Client not exist!",1)
}