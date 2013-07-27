;~ Prepare to Comport
;~ return: true or false
SYS_CompReady()
{
    Suspend, On

    global GV_isBusy := 1

    gosub, Timer_AutoSellStop

    return 1
}