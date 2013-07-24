;~ 设置北方金银交易客户端窗口
funcSetJiaoyiWin()
{
	IfWinNotExist, 中国北方金银业有限公司 ahk_class SunAwtFrame
	{
		IfWinNotExist, 登录 ahk_class SunAwtDialog
		try
		{
			Run, sys_pathJiaoyiWin
			;~ Run, "C:\Program Files (x86)\CNI Bullion\ClientDemo\CNIClient.exe"
		}
		catch e
		{
			trace(e,1)
			return
		}
		;等待登录窗口
		WinWait, 登录 ahk_class SunAwtDialog ,, 5
		if (ErrorLevel = 0)
		{
		    WinActivate
			Sleep, 500
			Send, {Click 330,187}111555{Enter}
		}
		else
		{
			trace("无法开启北方金银客户端.",1)
		    ;~ ExitApp
		}

		WinWait, 中国北方金银业有限公司 ahk_class SunAwtFrame,, 5
			WinActivate

		IfWinExist, 中国北方金银业有限公司 ahk_class SunAwtFrame
		{
			WinActivate

			tarW := 1200
			tarH := 760
			tarX := 2
			;~ tarY := A_ScreenHeight - tarH - 2 + 20 * 10 ; 遮掉命令面板的一部分
			tarY := A_ScreenHeight - tarH - 2 ; 完全显示
			;~ WinGetPos,cniX,cniY,cniW,cniH,中国北方金银业有限公司 ahk_class SunAwtFrame
			WinGetPos,cniX,cniY,cniW,cniH,A
			if (cniX != tarX or cniY != tarY or cniW != tarW or cniH != tarH)
			{
				; 设置cni客户端位置和大小
				WinMove,中国北方金银业有限公司 ahk_class SunAwtFrame,,tarX,tarY,tarW,tarH
			}
		}
	}
}