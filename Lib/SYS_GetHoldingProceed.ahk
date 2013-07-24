;~ 获取当前盈利级别
;~ 2013-7-16 4:41:18 确保完成.大概需要一秒钟的时间运行
;~ 通过判断"浮动盈亏"下面的彩色数字位置和颜色得到盈亏的位数
;~ 返回:
;~ 达到位数的起点,如:100,1000等,表示超过一百,一千
;~ 否则,没有持仓就直接返回false
SYS_GetHoldingProceed()
{
    global GV_HoldingDrt, Const_PRICE_UP, Const_PRICE_DOWN, Const_Nothing

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
        ;~ trace("循环了: " . A_Index . "次`nx1: " . x1 . "和x2:" .x2)
        if A_Index < 3
        {
            ;~ 百位数减少7像素
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
            if (SYS_GetHoldingProceedLevel() = Const_PRICE_DOWN)
            {
                _numb := -_numb
                ;~ trace("_drt is :" . _drt,2)
            }
            ;~ trace("跳出循环`,返回值: " . _numb,2)
            return %_numb%
            break
        }
    }
}