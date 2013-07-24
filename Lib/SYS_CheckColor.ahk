;~ 辅助方法
;~ 检查颜色
;~ 在指定坐标范围查找tColor颜色
;~ 返回 true=找到; false=没找到
;~ 不会返回其他值,出现 极端 错误就退出程序
SYS_CheckColor(x1,y1,x2,y2,tColor)
{
	;~ trace("即将查找颜色:" . tColor . "是否继续`?",2)
	SYS_ActiveCNIClient()

	PixelSearch, varX, varY, x1, y1, x2, y2, tColor, 0, Fast
	if (ErrorLevel = 0)
	{
		;~ 找到了目标颜色
		return 1
	}
	else if (ErrorLevel = 1)
	{
		;~ 找不到
		return 0
	}
	else if (ErrorLevel = 2)
	{
		;~ 查找颜色出现未知问题
		trace("SYS_CheckColor 出现未知问题!",1)
	}
}