Mouse_2Center()
{
	;~ CoordMode, Screen
	_x := A_ScreenWidth / 2
	_y := A_ScreenHeight / 2
	MouseMove, _x, _y
	;~ CoordMode, Window
	return
}