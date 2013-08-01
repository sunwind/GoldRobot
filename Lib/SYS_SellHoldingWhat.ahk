;~ 将持有的某种仓位平掉
;~ 参数isPro: 1=盈利的仓位; 2=亏损的仓位
;~ 返回: 1=成功(可以继续平仓); 0=失败(不可继续平仓)
SYS_SellHoldingWhat(isPro = 1)
{
	global Const_Nothing

	_d1 := SYS_GetHoldingDirection()
	_d2 := SYS_GetHoldingDirection(2)
	;~ 空仓立即返回
	if _d1 = Const_Nothing
	{
		;~ gosub, Timer_AutoSellStop
		return 0
	}
	
	_p1 := SYS_GetHoldingProceedNew()
	_p2 := SYS_GetHoldingProceedNew(2)

	if (_p1 > 0)
	{
		if KL_Sell(1,1) and (_d2 <> Const_Nothing) and (_p2 > 0) 
		{
			return 1
		}
		else
		{
			return 0
		}
	}
}