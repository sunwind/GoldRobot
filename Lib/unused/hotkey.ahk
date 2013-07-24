
;~ /* hotkey */
;~ 快速开多单
^NumpadAdd::
funcBuy("up")
return

;~ 快速开空单
^NumpadSub::
funcBuy("down")
return

;~ 快速平仓(第1行),自动点击确定
^Numpad1:: ;数字键盘 "1"
funcPingCang(1)
return

;~ 设置自动平仓价格级别
#1::
funcSetAutoPingcangPrice()
return

;~ 切换是否等待价格变化下单
#q::
global sys_isCancelWaitPrice := !sys_isCancelWaitPrice
;~ MsgBox 是否检测价格变化`: %sys_isCancelWaitPrice%
if sys_isCancelWaitPrice
	ToolTip, 无视价格延迟, 950, 2
else
	ToolTip
return

;~ 设置行情客户端位置和大小
#^F::
funcSetHangqingWin()
return

;~ 刷新
#x::
Reload
return

;~ 退出
#F8::
ExitApp
return

;~ hotkeys end