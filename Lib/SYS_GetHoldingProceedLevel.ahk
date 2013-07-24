;~ check is user have holding
;~ returns : down ; up; nothing
SYS_GetHoldingProceedLevel(x1 = 943 ,y1 = 183 ,x2 = 949, y2 = 187)
{
    Global GV_priceDownRedColor, GV_priceUpGreenColor, GV_HoldingDrt, Const_HoldingUp, Const_HoldingDown, Const_Nothing
	;~ number 10's Area
    ;~ x1 := 943
    ;~ y1 := 183
    ;~ x2 := 949
    ;~ y2 := 187
	if SYS_CheckColor(x1,y1,x2,y2,GV_priceDownRedColor)
    {
        GV_HoldingDrt := Const_HoldingDown
    }
    else if SYS_CheckColor(x1,y1,x2,y2,GV_priceUpGreenColor)
    {
        GV_HoldingDrt := Const_HoldingUp
    }
    else
    {
        GV_HoldingDrt := Const_Nothing
    }
	return GV_HoldingDrt
}