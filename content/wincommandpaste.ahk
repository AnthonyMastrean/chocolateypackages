;==================================================
;Windows Command Prompt Paste!
;--------------------------------------------------
;Allow the command prompt (cmd.exe) and powershell
;console (powershell.exe) to take clipboard input
;when using CTRL+V.
;
;If you want this to work on Administrative prompts,
;you have to run the script as administrator.
;==================================================

;==================================================
;Initialise 
;==================================================
#NoEnv ;Recommended for performance and compatibility with future AutoHotkey releases. 
#SingleInstance force 
SendMode Input ;Recommended for new scripts due to its superior speed and reliability. 
SetWorkingDir %A_ScriptDir% ;Ensures a consistent starting directory. 

;======================================================================
;Now give it a sexy icon!
;======================================================================
Menu, Tray, Icon, wincommandpaste.ico, 
Menu, Tray, Tip, Press CTRL+V to paste in any console window!

;==================================================
;If the window is a console, capture CTRL+V!
;==================================================
#IfWinActive ahk_class ConsoleWindowClass
^v::
Send !{Space}EP
return
#IfWinActive

#IfWinActive ahk_class Console_2_Main
^v::
Send {Raw}%clipboard%
return
#IfWinActive