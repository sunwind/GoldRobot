;~ ��ȡ��ǰӯ������
;~ 2013-7-16 4:41:18 ȷ�����.�����Ҫһ���ӵ�ʱ������
;~ ͨ���ж�"����ӯ��"����Ĳ�ɫ����λ�ú���ɫ�õ�ӯ����λ��
;~ ����:
;~ �ﵽλ�������,��:100,1000��,��ʾ����һ��,һǧ
;~ ����,û�гֲ־�ֱ�ӷ���false
SYS_GetHoldingProceed()
{
    global GV_HoldingDrt, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing

    _numb := 1

    ;~ number 10's Area
    x1 := 943
    y1 := 183
    x2 := 949
    y2 := 187

    ;~ get the direction first


    ;~ trace("Holding direction is: " . _drt,2)
    ;~ while (SYS_CheckColor(x1,y1,x2,y2,GV_priceDownRedColor) or SYS_CheckColor(x1,y1,x2,y2,GV_priceUpGreenColor))
    while (SYS_GetHoldingDirection() <> Const_Nothing)
    {
        _numb *= 10
        ;~ Sleep, 2000
        ;~ MouseMove, x1,y1,10
        ;~ trace("ѭ����: " . A_Index . "��`nx1: " . x1 . "��x2:" .x2)
        if A_Index < 3
        {
            ;~ ��λ������7����
            x1 -= 7
            x2 -= 7
        }
        else if a_index = 3
        {
            x1 -= 10
            x2 -= 10
        }
        else if A_Index > 3 and A_Index < 6
        {
            x1 -= 7
            x2 -= 7
        }
        else if a_index = 6
        {
            x1 -= 10
            x2 -= 10
        }
        else if a_index > 5 and A_Index < 8
        {
            x1 -= 7
            x2 -= 7
        }
        else if a_index = 9
        {
            x1 -= 10
            x2 -= 10
        }
        else if a_index > 9
        {
            x1 -= 7
            x2 -= 7
        }

        if (SYS_GetHoldingProceedLevel(x1,y1,x2,y2) = Const_Nothing)
        {
            ;~ GV_HoldingDrt := SYS_GetHoldingDirection()
            if (SYS_GetHoldingProceedLevel() = Const_Holding_DOWN)
            {
                _numb := -_numb
                ;~ trace("_drt is :" . _drt,2)
            }
            ;~ trace("����ѭ��`,����ֵ: " . _numb,2)
            return %_numb%
            break
        }
    }
}

;~ check is user have holding
;~ returns : down ; up; nothing
SYS_GetHoldingProceedLevel(x1 = 943 ,y1 = 183 ,x2 = 949, y2 = 187)
{
    Global GV_priceDownRedColor, GV_priceUpGreenColor, GV_HoldingDrt, Const_Holding_UP, Const_Holding_DOWN, Const_Nothing
	;~ number 10's Area
    ;~ x1 := 943
    ;~ y1 := 183
    ;~ x2 := 949
    ;~ y2 := 187
	if SYS_CheckColor(x1,y1,x2,y2,GV_priceDownRedColor)
    {
        GV_HoldingDrt := Const_Holding_DOWN
    }
    else if SYS_CheckColor(x1,y1,x2,y2,GV_priceUpGreenColor)
    {
        GV_HoldingDrt := Const_Holding_UP
    }
    else
    {
        GV_HoldingDrt := Const_Nothing
    }
	return GV_HoldingDrt
}