﻿/*!
log
第二版
;~ 2013年7月15日
;~ 缩减快捷键为:开仓(多或空),平仓三个,以适应第二版更加智能的全自动平仓.
;~ 可随时根据持仓盈利或亏损设置止盈止损点全自动平仓.

第一版
;~ 2013年7月13日
;~ 增加初始化功能,减少手动操作.自动开启行情和交易客户端,并设置好位置.
;~ 增加对一键反向开仓功能的价格延迟等待功能.
;~ 目前可实战测试.
;~ 2013年7月12日
;~ 更改颜色搜索算法,增强可靠性
;~ 使用新算法判断持仓仓位详细信息
;~ 2013年7月9日
;~ 纠正检查颜色时方向不对的问题
;~ 2013年7月1日
;~ 新增开仓等待价格反向变化一次模块
;~ 2013年6月24日
;~ 新增快速开多/空单快捷键
;~ 修改inputbox参数,适应最新版AHK
;~ 2013年6月14日
;~ 加入一键设置行情窗口位置和大小,支持多显示器.默认设置为第二显示器的满屏(非全屏)
;~ 2013年5月27日
;~ 开启有编程键的键盘(PC)和无编程键的键盘(NT)两种个版本

;~ 初版
;~ 2013年5月23日
 ;~ 功能:
	;~ 1:快捷键实现以下功能:
		;~ 一键开仓准备(需确定);
		;~ 一键平仓准备(需确定);
		;~ 一键确定和取消;
		;~ 一键立即平仓并反向开仓(价格波动快时无法保证准确的平仓价格)(必须是用本脚本开的仓位);
	;~ 2:自动校正客户端面板的位置(屏幕坐标)(面板高度为750px)(坐标为:x=5, y=屏幕高度-755px)
	;~ 3:自动校正交易面板的相对位置(避免遮挡持仓信息)
*/