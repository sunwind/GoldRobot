;~ 获取当前盈利级别
;~ 会自动设置全局变量GV_HoldingDrt为当前的方向
;~ 返回:
;~ 达到位数的起点,如:10,100,1000等,表示超过十位数,百位数,千位数
;~ 否则,没有持仓就直接返回0
SYS_GetHoldingProceedNew()
{
    global Const_Nothing
    , GV_priceUpGreenColor
    , GV_priceDownRedColor

    _numb := 1

    ;~ 十位数为止.
    ;~ 小于950大于957的是百位数,百位数之后有一个逗号3像素
    ;~ 小于957大于964+3=967的是千位数
    ;~ 小于967大于974的是万
    
    x1 := 919
    x2 := 950
    
    y1 := 183
    y2 := y1
    
    ;~ 所以这里只需要扫描一次就可以知道颜色的坐标,用位置可以判断是几位数
    try
    {
        ;~ 先检查上涨的绿色,因为自动平仓的时候多数是绿色
        PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor, 100, Fast
        ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor

        if (ErrorLevel = 0)
        {
            ;~ trace("找到了: 盈利绿色`nx: " . proX . "`ny: " . proY)
            
           
            if proX < 926
                return 10000
            else if proX between 926 and 936
                return 1000
            else if proX between 936 and 943
                return 100
            else if proX between 943 and 950
                return 10
        }
        else if	(ErrorLevel = 1)
        {
            ;~ 检查下跌的红色
            PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor, 100, Fast
            ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor

            if (ErrorLevel = 0)
            {
                ;~ trace("找到了: 亏损红色`nx: " . proX . "`ny: " . proY)
                
                if proX < 926
                {
                    return -10000
                }
                else if proX between 926 and 936
                    return -1000
                else if proX between 936 and 943
                    return -100
                else if proX between 943 and 950
                    return -10
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