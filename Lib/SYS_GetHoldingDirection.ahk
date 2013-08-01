;~ ����û����в�λ�ķ���
;~ �����������,�൥,�յ�,�ղ�
;~ ����lineNumber: ��ʾ���ڼ��гֲ�,Ĭ��Ϊ��һ��(������)
SYS_GetHoldingDirection(lineNumber = 1)
{
    Global GV_HoldingBGColorOne, GV_HoldingBGColorTwo, GV_HoldingDrt, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing

    SYS_ActiveCNIClient()
    ;~ ���յ�
    ;~ line 1: 0x610034,684, 191 (focus)
    ;~ line 2: 0x610036,685, 209
    ;~ line 2: 0x610036,684, 209 (focus)
    
    y := 191
    
    upX := 820
    dwX := 752
    
    addY := 18
    
    
    bgColor := GV_HoldingBGColorOne
    
    ;~ �ж���������ż
    modLn := mod(lineNumber,2)
    
    if (lineNumber > 1)
    {
        ;~ ������ǵ�һ��,x����ƫ��1����
        upX += 1
        y += lineNumber * addY
    }
    
    if (modLn = 0)
    {
        ;~ ż����
        bgColor := GV_HoldingBGColorTwo
    }

    
    PixelGetColor, _colorUp,upX,y ; final
	PixelGetColor, _colorDown,dwX,y ;final

    if ErrorLevel
        trace("SYS_GetHoldingDirection Error!", 1)
	else if (_colorDown <> bgColor)
	{
		;~ ���пյ�
		GV_HoldingDrt := Const_Holding_DOWN
        ;~ return GV_HoldingDrt
	}
	else if (_colorUp <> bgColor)
    {
        ;~ ���ж൥
        GV_HoldingDrt := Const_Holding_UP
        ;~ return GV_HoldingDrt
    }
    else
    {
        ;~ û�гֲ�
        GV_HoldingDrt := Const_Nothing
    }
    ;~ trace("SYS_GetHoldingDirection func: " . GV_HoldingDrt , 2)
	return GV_HoldingDrt
}