;~ Just Ping Cang with line number
KL_Sell(lineNumb, isAuto = 0)
{
	global GV_priceDownRedColor, GV_priceUpGreenColor, GV_HoldingDrt, GV_CompMode, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing, Const_Comp_SELL

	SYS_GetHoldingDirection()

	if (GV_HoldingDrt = Const_Nothing)
	{
		SYS_CompFinish()
		Trace("目前没有持仓...")
		return 0
	}

	if GV_CompMode
	{
		_drt := SYS_GetHoldingLikeDrt()
		If !SYS_PriceWatcher(_drt) ;if buying down drt is red, so more red is good for me)
		{
			trace("平仓 终止!")
			return 0
		}
	}

	SYS_CompReady()

    ;~ Ping cang line number
	if (lineNumb = 1)
	{
		Send, {Click Right 710,188}
		Sleep, 50
		Send, {Click 760,238}
	}
	else if (lineNumb = 2)
	{
		Send, {Click Right 710,208}
		Sleep, 50
		Send, {Click 760,258}
	}
	else if (lineNumb = 3)
	{
		Send, {Click Right 710,228}
		Sleep, 50
		Send, {Click 760,278}
	}
	else if (lineNumb = 4)
	{
		Send, {Click Right 710,248}
		Sleep, 50
		Send, {Click 760,298}
	}
	else if (lineNumb = 5)
	{
		Send, {Click Right 710,268}
		Sleep, 50
		Send, {Click 760,318}
	}

	SYS_Click("ok")
	SYS_CompFinish()

	;~ if isAuto
		SYS_LogComport(Const_Comp_SELL,isAuto) ; is auto sell
	;~ else
		;~ SYS_LogComport(Const_Comp_SELL)

	return 1
}