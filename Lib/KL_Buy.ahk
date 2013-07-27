;~ buy
;~ arg: what string allow:"up" and "down"
KL_Buy(drt)
{
	global GV_CompMode, GV_CompNumb, Const_PRICE_UP, Const_PRICE_DOWN

	SYS_ActiveCNIClient()

	if (drt = "up")
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
			trace("Buy UP`nCANCELED!")
			return 0 ; is user abort watcher
		}

	}
	else if (drt = "down")
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
			trace("Buy DOWN`nCANCELED!")
			return 0 ; is user abort watcher
		}
	}
	else
	{
		trace("KL_Buy arg Wrong!",1)
	}


	SYS_CompReady()

	;~ xinzeng shijiadan WINDOW
	WinWait, ahk_class SunAwtDialog,,5
	{
		WinActivate, ahk_class SunAwtDialog
		Sleep, 200
		Send, {Click 183, 149} ;click the comprot number
		Send, {End}
		Send, +{Home}
		Send, %GV_CompNumb%
		Send, {Tab}
		Send, {click 58, 358}{Tab}
	}
	SYS_CompFinish()
	if trace("buying and click`nGV_CompMode: " . GV_CompMode,2)
	SYS_Click("ok")

	SYS_LogComport(drt)

	return 1
}