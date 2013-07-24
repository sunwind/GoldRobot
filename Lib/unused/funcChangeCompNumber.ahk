;~ 根据操作更改操作数量,递增到 4
;~ 参数: comp String
;~ 接受: "add" 增加(开仓后); "sub" 减少(平仓后)
funcChangeCompNumber1(comp)
{
	;~ trace("现在的操作手数是:`n" . GV_compNumb,2)
	if (comp = "add")
	{
		;~ 下了买单
		if (GV_compNumb < 4)
		{
			;~ MsgBox 买单`,GV_compNumb 加一
			global GV_compNumb += 1
		}
		else if (GV_compNumb = 4)
		{
			;~ 前几次操作已经达到了最高手数10,如果继续下单就重置为1
			global GV_compNumb = 2

			;~ 累计达到10手持仓后继续加仓
			str := "超过10的仓位操作开始`|0"
			funcLog_Write(str)
		}
	}
	else if (comp = "sub")
	{
		;~ 平仓
		if (GV_compNumb > 0)
		{
			;~ MsgBox 平仓`,GV_compNumb 减一
			global GV_compNumb -= 1
		}
		else if (GV_compNumb = 0)
		{
			;~ 前几次操作已经达到了最高手数10,如果继续下单就重置为1
			global GV_compNumb = 1

			;~ 录入log文件
			str := "空仓后的新操作开始"
			funcLog_Write(str)

		}
	}
	else
	{
		trace("funcChangeCompNumber 错误参数",1)
	}

	trace("现在的操作手数是:`n" . GV_compNumb)
}