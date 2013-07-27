SYS_GetPriceDirection()
{
	global GV_PriceDrt, Const_PRICE_UP, Const_PRICE_DOWN, GV_priceUpGreenColor, GV_priceDownRedColor, Const_Nothing

	PixelGetColor, pgColor, 88, 280 ;这个坐标用来检查价格变化方向
	;trace("price color: " . pgColor)
	if ErrorLevel
		trace("SYS_GetPriceDrt Error!", 1)
	else if (pgColor = GV_priceUpGreenColor)
	{
		GV_PriceDrt := Const_PRICE_UP
	}
	else if (pgColor = GV_priceDownRedColor)
	{
		GV_PriceDrt := Const_PRICE_Down
	}
	else
	{
		GV_PriceDrt := Const_Nothing
	}

	return %GV_PriceDrt%
}