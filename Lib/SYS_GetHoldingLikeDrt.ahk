SYS_GetHoldingLikeDrt()
{
	global GV_HoldingDrt, Const_HoldingUp, Const_HoldingDown, Const_Nothing, Const_PRICE_UP, Const_PRICE_DOWN

	SYS_GetHoldingDirection()

	if (GV_HoldingDrt = Const_HoldingUp)
	{
		return Const_PRICE_DOWN
	}
	else if (GV_HoldingDrt = Const_HoldingDown)
	{
		return Const_PRICE_UP
	}
}