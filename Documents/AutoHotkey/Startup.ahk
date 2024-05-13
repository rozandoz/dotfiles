#Requires AutoHotkey v1
#NoTrayIcon

Loop *.ahk
 if (A_LoopFileName != A_ScriptName)
    Run %A_LoopFileFullPath%
