;~ watch the price color to beter
SYS_PriceWatcher(target)
{
    global GV_PriceDrt, GV_CompMode, GV_HoldingDrt, Const_PRICE_UP, Const_PRICE_DOWN, Const_Nothing

	if (!target)
		trace("SYS_PriceWatcher ��������",1)

	SYS_ActiveCNIClient()

	while SYS_GetPriceDirection() <> target
	{
		;~ trace("target: " . target . "`nSYS_GetPriceDirection(): " . GV_PriceDrt . "`n`nChecking price " . A_Index . " times.")
		trace("ɨ��۸�仯 " . A_Index . " ��")

		If (((target = Const_PRICE_UP) and (GV_PriceDrt = Const_PRICE_DOWN))
		or ((target = Const_PRICE_DOWN) and (GV_PriceDrt = Const_PRICE_UP))
		or ((!GV_CompMode)))
		{
				return 0
		}
		Sleep, 100
	}
	return 1
	;trace("target: " . target . "`nSYS_GetPriceDirection(): " . SYS_GetPriceDirection())
	;trace("target: " . target . "`nSYS_GetHoldingDirection(): " . SYS_GetHoldingDirection(),2)
	;~ trace("I'm checking price " . A_Index . " times.")
}