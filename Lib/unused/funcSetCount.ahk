;~ 暂时停用
;~ 修改下单数量
;~ 不会返回其他值,出现 极端 错误就退出程序
funcSetCount()
{
	InputBox, varDo, title, 修改每次下单的数量`(手数`),, 400,200
	if Errorlevel
		trace("funcSetCount 函数错误",1)

	if (varDo <> GV_compNumb)
		GV_compNumb = %varDo%
	if GV_compNumb > 10
		GV_compNumb = 10
	trace("当前手数为:" GV_compNumb)
	return
}