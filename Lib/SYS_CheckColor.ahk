;~ ��������
;~ �����ɫ
;~ ��ָ�����귶Χ����tColor��ɫ
;~ ���� true=�ҵ�; false=û�ҵ�
;~ ���᷵������ֵ,���� ���� ������˳�����
SYS_CheckColor(x1,y1,x2,y2,tColor)
{
	;~ trace("����������ɫ:" . tColor . "�Ƿ����`?",2)
	SYS_ActiveCNIClient()

	PixelSearch, varX, varY, x1, y1, x2, y2, tColor, 0, Fast
	if (ErrorLevel = 0)
	{
		;~ �ҵ���Ŀ����ɫ
		return 1
	}
	else if (ErrorLevel = 1)
	{
		;~ �Ҳ���
		return 0
	}
	else if (ErrorLevel = 2)
	{
		;~ ������ɫ����δ֪����
		trace("SYS_CheckColor ����δ֪����!",1)
	}
}