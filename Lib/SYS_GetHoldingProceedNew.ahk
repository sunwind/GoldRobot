;~ ��ȡ��ǰӯ������
;~ ���Զ�����ȫ�ֱ���GV_HoldingDrtΪ��ǰ�ķ���

;~ 1.3�����ӵڶ��е��ж�����
;~ ����lineNumber: ����ֵ 1,2,3 ��ʾ����.����1���ض��ĵ�һ��,2��ʾ������˫����,3��ʾ�����ĵ�����.
;~ ��Ϊ��һ�б�tab����,��������ͺ����������1����. ������ x + 1

;~ ����:
;~ �ﵽλ�������,��:10,100,1000��,��ʾ����ʮλ��,��λ��,ǧλ��
;~ ����,û�гֲ־�ֱ�ӷ���0
SYS_GetHoldingProceedNew(lineNumber = 1)
{
    ;~ ��һ�е�����
    ;~ ʮλ��Ϊֹ.
    ;~ С��950����957���ǰ�λ��,��λ��֮����һ������3����
    ;~ С��957����964+3=967����ǧλ��
    ;~ С��967����974������

    global GV_priceUpGreenColor, GV_priceDownRedColor, Const_Nothing
        
    ;~ ������ɫ�Ľ��䷶Χ
    _jb := 100
    
    ;~ ��һ�е�����
    x1 := 919
    x2 := 950

    y1 := 183
    y2 := y1
    
    ;~ 10�����x��Χ
    ;~ 950
    levelx10 := x2
    ;~ 943
    levely10 := levelx10 - 7
    ;~ 936
    levely100 := levely10 - 7
    ;~ 926
    levely1000 := levely100 - 10

    
    
    ;~ ��֮���Y������Ϊ18
    addY := 18
    
    if (lineNumber > 1)
    {
        ;~ ���ǵ�һ��
        x1 += 1
        y1 += 1
        
        y1 += (addY * lineNumber)
        y2 := y1
        
        ;~ 10�����x��Χ
        levelx10 += 1
        levely10 += 1
        ;~ 100�����x��Χ
        levely100 += 1
        ;~ 1000����
        levely1000 += 1

    }
    
    ;~ trace("levelx10: " . levelx10
            ;~ . "`nlevely10: " . levely10
            ;~ . "`nlevely100: " . levely100
            ;~ . "`nlevely1000: " . levely1000
            ;~ ,2)
    
    try
    {
        ;~ �ȼ�����ǵ���ɫ,��Ϊ�Զ�ƽ�ֵ�ʱ���������ɫ
        PixelSearch, proX, proY, x1, y1, x2, y2, GV_priceUpGreenColor, _jb, Fast
        ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor
        
        if (ErrorLevel = 0)
        {
            ;~ trace("�ҵ���: ӯ����ɫ`nx: " . proX ,2)
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
            ;~ ����µ��ĺ�ɫ
            PixelSearch, proX, proY, x1, y1, x2, y2, GV_priceDownRedColor, _jb, Fast
            ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor

            if (ErrorLevel = 0)
            {
                ;~ trace("�ҵ���: �����ɫ`nx: " . proX,2)
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
                ;~ ������ɫ���Ҳ���,Ӧ�þ��ǿղ�
                return 0
            }
        }
    }
    catch
    {
        trace("Obj_HoldingProceedArea ������ɫ����!",1)
    }
    
}