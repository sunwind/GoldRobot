;~ check is user have holding
;~ returns : down ; up; nothing
SYS_GetHoldingDirection()
{
    Global GV_HoldingBGColor, GV_HoldingDrt, Const_HoldingUp, Const_HoldingDown, Const_Nothing

    SYS_ActiveCNIClient()
    ;~ 检查空单
    ;~ line 1: 0x610034,684, 191 (focus)
    ;~ line 2: 0x610036,685, 209
    ;~ line 2: 0x610036,684, 209 (focus)
    PixelGetColor, _colorUp,820,191 ; final
	PixelGetColor, _colorDown,752,191 ;final

    if ErrorLevel
        trace("SYS_GetHoldingDirection Error!", 1)
	else if (_colorDown <> GV_HoldingBGColor)
	{
		;~ 持有空单
		GV_HoldingDrt := Const_HoldingDown
        ;~ return GV_HoldingDrt
	}
	else if (_colorUp <> GV_HoldingBGColor)
    {
        ;~ 持有多单
        GV_HoldingDrt := Const_HoldingUp
        ;~ return GV_HoldingDrt
    }
    else
    {
        ;~ 没有持仓
        GV_HoldingDrt := Const_Nothing
    }
    ;~ trace("SYS_GetHoldingDirection func: " . GV_HoldingDrt , 2)
	return GV_HoldingDrt
}