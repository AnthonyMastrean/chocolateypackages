;==================================================
; Recommended settings for all new scripts
;==================================================
#NoEnv
#SingleInstance force 
SendMode Input
SetWorkingDir %A_ScriptDir%

;======================================================================
; Now give it a sexy icon!
;======================================================================
Menu, Tray, Icon, wincommandpaste.ico, 
Menu, Tray, Tip, Press CTRL+V to paste in any console window!

;==================================================
; If the window is a console, capture CTRL+V!
;==================================================
#IfWinActive ahk_class ConsoleWindowClass
	^v::Send !{Space}EP
	^c::Send !{Space}EY
#IfWinActive

#IfWinActive ahk_class Console_2_Main
  ^v::Send {Raw}%clipboard%
#IfWinActive