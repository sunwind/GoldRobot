funcSetHangqingWin()
{
	IfWinNotExist, CNI北方金银 ahk_class MAINWND_WX
	{
		try
		{
			Run, %sys_pathHangqingWin%
		}
		catch e
		{
			return
		}

		;~ 行情软件的"自动页面"无法替代,必须点击一次
		;~ 如果窗口已经手动开启,就不再点击了
		WinWait, CNI北方金银 ahk_class MAINWND_WX,,5
		{
			WinActivate
			Sleep, 500
			Send, {Click 133,40}
		}
	}
	else IfWinExist, CNI北方金银 ahk_class MAINWND_WX
	{
		WinActivate
		WinGetPos, vx, vy, vw, vh, CNI北方金银 ahk_class MAINWND_WX
		SysGet, mtCount, MonitorCount
		if (mtCount>1)
		{
			;多显示器
			wt_x := A_ScreenWidth + 2
			wt_w := A_ScreenWidth - 4
		}
		else if (mtCount = 1)
		{
			;单显示器
			wt_x := 2
			wt_w := A_ScreenWidth - 84 ;将Windows任务栏放在右侧时.
		}
		wt_y := 2
		wt_h := A_ScreenHeight - 4
		WinMove, CNI北方金银 ahk_class MAINWND_WX, ,wt_x, wt_y, wt_w, wt_h
	}
	return
}
;~ end 设置北方金银行情窗口