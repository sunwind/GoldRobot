;~ /* globalVar */
;~ 自动平仓价格级别,可选10的10倍数
;~ 10的时候为盈利就走(对不起观众啊)
global sys_autoPingcangPrice := 10000

;~ 本地化文件
;~ 系统设置文件路径
global sys_IniFilePath := A_ScriptDir . "\setting.ini"
;~ 操作记录文件路径
global sys_LogFilePath := A_ScriptDir . "\robot_logs.txt"

global sys_pathJiaoyiWin := "C:\Program Files (x86)\CNI Bullion\ClientDemo\CNIClient.exe"
global sys_pathHangqingWin := "E:\GreenSoft\北方金银\iSky.exe"

;~ 临时取消等待检测价格
global sys_isCancelWaitPrice := false

;~ 等待扫描颜色的过程中设为true
global sys_isProgressBusy := false

;~ 用于保存当前脚本自动填写的建仓数量
global sys_compNumb := 1

;~ 用于保存当前持仓第一行的数量
global sys_holdingNumb := 0
;~ 持仓方向
global sys_holdingDrt := "nothing"

;~ 持仓行和价格中的盈利绿色
global sys_priceUpColor := "0x009401"
;~ 持仓行和价格中的亏损红色
global sys_priceDownColor := "0x0000F0"

global sys_priceNormalColor := "0xE2C1D0"
;~ 存在持仓时,特定位置是黑色字体
global sys_fontColor := "0x000000"