;==================================================
; Recommendations for all new scripts for speed, compatibility, and consistency
;==================================================
#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

;==================================================
; Sexy tray icon and text
;==================================================
Menu, Tray, Tip, Reconsole
Menu, Tray, Icon, reconsole.ico,

;==================================================
; Capture the keystrokes that need to be paired
;==================================================
#IfWinActive ahk_class ConsoleWindowClass

    %::Send `%`%{Left}
    (::Send (){Left}
    "::Send ""{Left}
    '::Send ''{Left}
    {::Send {{}{}}{Left}
    [::Send []{Left}

#IfWinActive