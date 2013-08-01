;~ Just Ping Cang with line number
KL_Sell(lineNumb, isAuto = 0)
{
	global GV_priceDownRedColor, GV_priceUpGreenColor, GV_HoldingDrt, GV_CompMode, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing, Const_Comp_SELL

	SYS_GetHoldingDirection()

	if (GV_HoldingDrt = Const_Nothing)
	{
		SYS_CompFinish()
		Trace("Ŀǰû�гֲ�...")
		return 0
	}
	
	;~ �Զ�ƽ��ʱֱ�ӿ���ƽ��
	if ( GV_CompMode and !isAuto )
	{
		_drt := SYS_GetHoldingLikeDrt()
		If !SYS_PriceWatcher(_drt) ;if buying down drt is red, so more red is good for me)
		{
			trace("ƽ�� ��ֹ!")
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
	
;~ if !trace("Sell click")
	SYS_Click("ok")
	
	SYS_CompFinish()
	SYS_LogComport(Const_Comp_SELL,isAuto) ; is auto sell
	return 1
}