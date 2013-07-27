;~ Finished the Comport
;~ return: true or false
SYS_CompFinish()
{
    global GV_isBusy := 0
    Suspend, Off
    return
}