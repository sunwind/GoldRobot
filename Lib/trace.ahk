/*!
	Library: [SYS] System library, version 1.0
		系统级函数库
	Author: Fonny
		fjxhkj@gmail.com
	License: 自用
*/

/*!
	Function: trace(vText, isDie = 0)
		提供四种简单的用户互交方式.

	Parameters:
		vText - String
			显示提示内容(非title)
		isDie - Number
			用于选择互交方式.
			0=TrayTip提示(默认为0);
			1=终止程序的致命错误提示;
			2=返回布尔值的MsgBox提示框.

	Remarks:
		第一个参数输入你的提示语句;
		第二个参数选择提示方式.

	Returns:
		当且仅当isDie=2时,返回布尔值(0 or 1).

	Extra:
		无

	Throws:
		无
*/

trace(vText, isDie = 0)
{
	if (isDie = 1)
	{
		Suspend , On
		MsgBox, 16, !!! 致命错误 !!!, %vText%, 5
		ExitApp
	}
	else if (isDie = 2)
	{
		Suspend , On
		MsgBox, 36,提问 !, %vText%
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
		TrayTip,! 请注意 !, %vText%, 31,1
		return true
	}
}