;======================================================================
;Initialize the script
;======================================================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;======================================================================
;Now give it a sexy icon!
;======================================================================
Menu, Tray, Icon, dtk.ico, 
Menu, Tray, Tip, Watching for the DTK SDK dialog...

;======================================================================
;Wait for the DTK dialog and close it
;======================================================================
Loop 
{
  IfWinExist, DTK Barcode Reader SDK Activation
  {
    WinActivate
    ControlClick, Close, DTK Barcode Reader SDK Activation
  }
  
  Sleep, 300
}