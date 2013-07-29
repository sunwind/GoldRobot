SYS_GetHoldingLikeDrt()
{
	global GV_HoldingDrt, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing, Const_PRICE_UP, Const_PRICE_DOWN

	SYS_GetHoldingDirection()

	if (GV_HoldingDrt = Const_Holding_UP)
	{
		return Const_PRICE_DOWN
	}
	else if (GV_HoldingDrt = Const_Holding_DOWN)
	{
		return Const_PRICE_UP
	}
}