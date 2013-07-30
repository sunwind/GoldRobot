/*!
	Library: [SYS] System library, version 1.0
		ϵͳ��������
	Author: Fonny
		fjxhkj@gmail.com
	License: ����
*/

/*!
	Function: trace(vText, isDie = 0)
		�ṩ���ּ򵥵��û�������ʽ.

	Parameters:
		vText - String
			��ʾ��ʾ����(��title)
		isDie - Number
			����ѡ�񻥽���ʽ.
			0=TrayTip��ʾ(Ĭ��Ϊ0);
			1=��ֹ���������������ʾ;
			2=���ز���ֵ��MsgBox��ʾ��.

	Remarks:
		��һ���������������ʾ���;
		�ڶ�������ѡ����ʾ��ʽ.

	Returns:
		���ҽ���isDie=2ʱ,���ز���ֵ(0 or 1).

	Extra:
		��

	Throws:
		��
*/

trace(vText, isDie = 0)
{
	if (isDie = 1)
	{
		Suspend , On
		MsgBox, 16, !!! �������� !!!, %vText%, 5
		ExitApp
	}
	else if (isDie = 2)
	{
		Suspend , On
		MsgBox, 36,���� !, %vText%
		Suspend, off
		IfMsgBox  yes
			return true
		else
			return false
	}
	else if (isDie = 3)
	{
		ToolTip, %vText%, 800, 3
		return true
	}
	else if (isDie = 4)
	{
		ToolTip, %vText%, 500, 3
		return true
	}
	else
	{
		TrayTip,! ��ע�� !, %vText%, 31,1
		return true
	}
}