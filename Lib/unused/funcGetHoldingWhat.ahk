;~ check is user have holding
;~ returns : duo ; kong; nothing
funcGetHoldingWhat(x1 = 943 ,y1 = 183 ,x2 = 949, y2 = 187)
{
	_drt := ""
	;~ number 10's Area
    ;~ x1 := 943
    ;~ y1 := 183
    ;~ x2 := 949
    ;~ y2 := 187
	if funcCheckColor(x1,y1,x2,y2,GV_priceDownColor)
    {
        _drt := "kong"
    }
    else if funcCheckColor(x1,y1,x2,y2,GV_priceUpColor)
    {
        _drt := "duo"
    }
    else
    {
        _drt := "nothing"
    }
	return _drt
}