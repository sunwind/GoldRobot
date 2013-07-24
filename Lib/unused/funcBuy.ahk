;~ buy
;~ arg: what string allow:"up" and "down"
funcBuy(drt)
{
	if !SC_CompReady()
		return false
		
	SW_ActiveCNIWin()
	
	if (drt = "up")
	{		
		if GV_isWaitPrice and funcCheckPriceColor(GV_priceDownColor)
		{
			Send,{click 175,265 2}
		}
		else if !GV_isWaitPrice
			Send,{click 175,265 2}
		else
			return false
	}
	else if (drt = "down")
	{
		if GV_isWaitPrice and funcCheckPriceColor(GV_priceUpColor)
		{
			Send,{click 75,265 2}
		}
		else if !GV_isWaitPrice
			Send,{click 75,265 2}
		else
			return false
	}
	else
	{
		trace("funcBuy arg Wrong!",1)
	}
	;~ xinzeng shijiadan WINDOW
	WinWait, ahk_class SunAwtDialog,,5
	{
		WinActivate, ahk_class SunAwtDialog
		Sleep, 200
		Send, {click 155,144} ;click the comprot number
		Send, {End}{ShiftDown}{Home}{ShiftUp}%GV_compNumb%
		Send, {click 52, 380}{Tab}
	}
	funcClick("ok")
	
	funcLog_Comport(drt)

	SC_CompFinished()
	
	return true
}