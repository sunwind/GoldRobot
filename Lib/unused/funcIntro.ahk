;~ subIntro
;~ 不会返回其他值,出现 极端 错误就退出程序
funcIntro()
{
	if !funcSetJiaoyiWin()
	{
		trace("funcSetJiaoyiWin 内部错误",1)
	}

	WinActivate, 中国北方金银业有限公司 ahk_class SunAwtFrame
		;~ 保留鼠标当前的位置,设置窗口之后回到这里
		MouseGetPos, msx,msy

	;~ 点一下按编号排序,默认的排序乱七八糟
	;~ Send, {click 405,170}

	;~ 开启行情客户端,并设置位置大小
	funcSetHangqingWin()

	;~ 设置系统栏图标
	funcSetTray()

	;~ 让用户一开始就可以修改自动平仓级别
	;~ funcSetAutoPingcangPrice()

	;~ 发现未知持仓,让用户输入
	funcGetUserHolding()

	;~ 鼠标回到原处
	WinActivate, 中国北方金银业有限公司 ahk_class SunAwtFrame
		MouseMove, %msx%,%msy%

	return
}
;~ end subIntro