;~ buy
;~ arg: what string allow:Const_Comp_BUY_UP and Const_Comp_BUY_DOWN
KL_Buy(drt)
{
	global GV_CompMode, GV_CompNumb, Const_PRICE_UP, Const_PRICE_DOWN, Const_Comp_BUY_UP, Const_Comp_BUY_DOWN

	SYS_ActiveCNIClient()

	if (drt = Const_Comp_BUY_UP)
	{
		if !GV_CompMode
		{
			Send,{click 175,265 2}
		}
		else if SYS_PriceWatcher(Const_PRICE_DOWN)
		{
			;~ if trace("SYS_PriceWatcher return`nGV_CompMode: " . GV_CompMode,2)
			Send,{click 175,265 2}
		}
		else
		{
			trace("开多头`n被取消!")
			return 0 ; is user abort watcher
		}

	}
	else if (drt = Const_Comp_BUY_DOWN)
	{
		if !GV_CompMode
		{
			Send,{click 75,265 2}
		}
		else if SYS_PriceWatcher(Const_PRICE_UP)
		{
			;~ if trace("SYS_PriceWatcher return`nGV_CompMode: " . GV_CompMode,2)
			Send,{click 75,265 2}
		}
		else
		{
			trace("开空头`n被取消!")
			return 0 ; is user abort watcher
		}
	}
	else
	{
		trace("KL_Buy 参数 错误!",1)
	}


	SYS_CompReady()

	;~ xinzeng shijiadan WINDOW
	WinWait, ahk_class SunAwtDialog,,5
	{
		SetKeyDelay, 1
		SetMouseDelay, 1

		WinActivate, ahk_class SunAwtDialog
		Sleep, 200
		Send, {Click 183, 149} ;click the comprot number
		Send, {End}
		Send, +{Home}
		Send, %GV_CompNumb%
		Send, {Tab}
		Send, {click 58, 358}{Tab}

		SetKeyDelay, 0
		SetMouseDelay, 0
	}
	SYS_CompFinish()
	;~ if trace("buying and click`nGV_CompMode: " . GV_CompMode,2)
	SYS_Click("ok")

	SYS_LogComport(drt)

	return 1
}