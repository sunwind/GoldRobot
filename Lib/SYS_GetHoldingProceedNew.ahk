;~ ��ȡ��ǰӯ������
;~ ���Զ�����ȫ�ֱ���GV_HoldingDrtΪ��ǰ�ķ���
;~ ����:
;~ �ﵽλ�������,��:10,100,1000��,��ʾ����ʮλ��,��λ��,ǧλ��
;~ ����,û�гֲ־�ֱ�ӷ���0
SYS_GetHoldingProceedNew()
{
    global Const_Nothing
    , GV_priceUpGreenColor
    , GV_priceDownRedColor

    _numb := 1

    ;~ ʮλ��Ϊֹ.
    ;~ С��950����957���ǰ�λ��,��λ��֮����һ������3����
    ;~ С��957����964+3=967����ǧλ��
    ;~ С��967����974������
    
    x1 := 919
    x2 := 950
    
    y1 := 183
    y2 := y1
    
    ;~ ��������ֻ��Ҫɨ��һ�ξͿ���֪����ɫ������,��λ�ÿ����ж��Ǽ�λ��
    try
    {
        ;~ �ȼ�����ǵ���ɫ,��Ϊ�Զ�ƽ�ֵ�ʱ���������ɫ
        PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor, 100, Fast
        ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceUpGreenColor

        if (ErrorLevel = 0)
        {
            ;~ trace("�ҵ���: ӯ����ɫ`nx: " . proX . "`ny: " . proY)
            
           
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
            ;~ ����µ��ĺ�ɫ
            PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor, 100, Fast
            ;~ PixelSearch, proX, proY,x1, y1, x2, y2, GV_priceDownRedColor

            if (ErrorLevel = 0)
            {
                ;~ trace("�ҵ���: �����ɫ`nx: " . proX . "`ny: " . proY)
                
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