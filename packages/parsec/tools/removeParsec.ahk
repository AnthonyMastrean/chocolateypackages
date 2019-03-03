#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1
SetControlDelay -1
 
winTitleUninstall = Parsec Uninstall

WinWait, %winTitleUninstall%, Remove , 300
WinMinimize, %winTitleUninstall%, Remove
ControlClick , Button2, %winTitleUninstall%, Remove

WinWait, %winTitleUninstall%, Complete , 300
ControlClick , Button2, %winTitleUninstall%, Complete