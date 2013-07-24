;~ 更新程序内置变量
;~ 注意:
;~ 这个方法和修改操作数量不是一个意思
;~ 这里的修改是方便后续的操作直接读取上次操作的情况
funcChangeVars1(drt,compNumb)
{
	global GV_holdingDrt := drt
	global GV_holdingNumb := compNumb
}