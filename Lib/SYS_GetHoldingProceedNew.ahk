;~ 获取当前盈利级别
;~ 会自动设置全局变量GV_HoldingDrt为当前的方向

;~ 1.3版增加第二行的判断能力
;~ 参数lineNumber: 整数值 1,2,3 表示行数.其中1是特定的第一行,2表示后续的双数行,3表示后续的单数行.
;~ 因为第一行被tab激活,所以坐标和后续的行相差1像素. 后续行 x + 1

;~ 返回:
;~ 达到位数的起点,如:10,100,1000等,表示超过十位数,百位数,千位数
;~ 否则,没有持仓就直接返回0
SYS_GetHoldingProceedNew(lineNumber = 1)
{
    ;~ 第一行的坐标
    ;~ 十位数为止.
    ;~ 小于950大于957的是百位数,百位数之后有一个逗号3像素
    ;~ 小于957大于964+3=967的是千位数
    ;~ 小于967大于974的是万

    global GV_priceUpGreenColor, GV_priceDownRedColor, Const_Nothing
        
    ;~ 查找颜色的渐变范围
    _jb := 100
    
    ;~ 第一行的坐标
    x1 := 919
    x2 := 950

    y1 := 183
    y2 := y1
    
    ;~ 10级别的x范围
    ;~ 950
    levelx10 := x2
    ;~ 943
    levely10 := levelx10 - 7
    ;~ 936
    levely100 := levely10 - 7
    ;~ 926
    levely1000 := levely100 - 10

    
    
    ;~ 行之间的Y轴增量为18
    addY := 18
    
    if (lineNumber > 1)
    {
        ;~ 不是第一行
        x1 += 1
        y1 += 1
        
        y1 += (addY * lineNumber)
        y2 := y1
        
        ;~ 10级别的x范围
        levelx10 += 1
        levely10 += 1
        ;~ 100级别的x范围
        levely100 += 1
        ;~ 1000级别
        levely1000 += 1

    }
    
    ;~ trace("levelx10: " . levelx10
            ;~ . "`nlevely10: " . levely10
            ;~ . "`nlevely100: " . levely100
            ;~ . "`nlevely1000: " . levely1000
            ;~ ,2)
    
    try
    {
        ;~ 先检查上涨的绿色,因为自动平仓的时候多数是绿色
        PixelSearch, proX, proY, x1, y1, x2, y2, GV_priceUpGreenColor, _jb, Fast
        ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor
        
        if (ErrorLevel = 0)
        {
            ;~ trace("找到了: 盈利绿色`nx: " . proX ,2)
            if (proX < levely1000)
            {
                return 10000
            }
            else if proX between %levely1000% and %levely100%
            {
                return 1000
            }
            else if proX between %levely100% and %levely10%
            {
                return 100
            }
            else if proX between %levely10% and %levelx10%
            {
                return 10
            }
        }
        else if	(ErrorLevel = 1)
        {
            ;~ 检查下跌的红色
            PixelSearch, proX, proY, x1, y1, x2, y2, GV_priceDownRedColor, _jb, Fast
            ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor

            if (ErrorLevel = 0)
            {
                ;~ trace("找到了: 亏损红色`nx: " . proX,2)
                if (proX < levely1000)
                {
                    return -10000
                }
                else if proX between %levely1000% and %levely100%
                {
                    return -1000
                }
                else if proX between %levely100% and %levely10%
                {
                    return -100
                }
                else if proX between %levely10% and %levelx10%
                {
                    return -10
                }
            }
            else if	(ErrorLevel = 1)
            {
                ;~ 两种颜色都找不到,应该就是空仓
                return 0
            }
        }
    }
    catch
    {
        trace("Obj_HoldingProceedArea 查找颜色出错!",1)
    }
    
}