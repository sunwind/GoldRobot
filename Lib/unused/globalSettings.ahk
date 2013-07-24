;~ globalSettings 全局设置
#Persistent ;开启持久选项就自动开启了单例模式
#SingleInstance force ;强制单例模式
#NoEnv ; 环境变量使用模式
#Warn  ; 错误警告模式

;SendMode Input  ; 更改按键发送模式
SetWorkingDir %A_ScriptDir%  ; 设置工作目录
Process, Priority, , High ; 设置优先级
SetTitleMatchMode, 1 ; 设置必须以匹配字符开头的
CoordMode, Window
SetDefaultMouseSpeed, 0 ; 瞬时移动鼠标.
SetMouseDelay, 0
SetKeyDelay, 0
