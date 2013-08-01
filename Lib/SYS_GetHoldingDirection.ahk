;~ 检查用户持有仓位的方向
;~ 返回三种情况,多单,空单,空仓
;~ 参数lineNumber: 表示检查第几行持仓,默认为第一行(最上面)
SYS_GetHoldingDirection(lineNumber = 1)
{
    Global GV_HoldingBGColorOne, GV_HoldingBGColorTwo, GV_HoldingDrt, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing

    SYS_ActiveCNIClient()
    ;~ 检查空单
    ;~ line 1: 0x610034,684, 191 (focus)
    ;~ line 2: 0x610036,685, 209
    ;~ line 2: 0x610036,684, 209 (focus)
    
    y := 191
    
    upX := 820
    dwX := 752
    
    addY := 18
    
    
    bgColor := GV_HoldingBGColorOne
    
    ;~ 判断行数的奇偶
    modLn := mod(lineNumber,2)
    
    if (lineNumber > 1)
    {
        ;~ 如果不是第一行,x向右偏离1像素
        upX += 1
        y += lineNumber * addY
    }
    
    if (modLn = 0)
    {
        ;~ 偶数行
        bgColor := GV_HoldingBGColorTwo
    }

    
    PixelGetColor, _colorUp,upX,y ; final
	PixelGetColor, _colorDown,dwX,y ;final

    if ErrorLevel
        trace("SYS_GetHoldingDirection Error!", 1)
	else if (_colorDown <> bgColor)
	{
		;~ 持有空单
		GV_HoldingDrt := Const_Holding_DOWN
        ;~ return GV_HoldingDrt
	}
	else if (_colorUp <> bgColor)
    {
        ;~ 持有多单
        GV_HoldingDrt := Const_Holding_UP
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