funcGetUserHolding()
{
    global sys_holdingDrt := funcGetHoldingWhat()
    if (sys_holdingDrt = "nothing")
    {
        trace("I'm ready!")
    }
    else
    {
        funcLog_Comport(sys_holdingDrt)
        trace("Now you having:`n" . sys_holdingNumb . " Directiong " . sys_holdingDrt)
    }    
}