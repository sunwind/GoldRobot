;~ �����е�ĳ�ֲ�λƽ��
;~ ����isPro: 1=ӯ���Ĳ�λ; 2=����Ĳ�λ
;~ ����: 1=�ɹ�(���Լ���ƽ��); 0=ʧ��(���ɼ���ƽ��)
SYS_SellHoldingWhat(isPro = 1)
{
	global Const_Nothing

	_d1 := SYS_GetHoldingDirection()
	_d2 := SYS_GetHoldingDirection(2)
	;~ �ղ���������
	if _d1 = Const_Nothing
	{
		;~ gosub, Timer_AutoSellStop
		return 0
	}
	
	_p1 := SYS_GetHoldingProceedNew()
	_p2 := SYS_GetHoldingProceedNew(2)

	if (_p1 > 0)
	{
		if KL_Sell(1,1) and (_d2 <> Const_Nothing) and (_p2 > 0) 
		{
			return 1
		}
		else
		{
			return 0
		}
	}
}