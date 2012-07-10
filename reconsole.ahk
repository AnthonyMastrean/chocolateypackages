;==================================================
; Reconsole: Autocomplete common character pairs in your console
;--------------------------------------------------
; Auto complete many of the characters that commonly come in pairs, like
;   %%
;   ()
;   ''
;   ""
;   {}
;   []
;==================================================

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

#IfWinActive ahk_class ConsoleWindowClass

    %::Send `%`%{Left}
    (::Send (){Left}
    "::Send ""{Left}
    '::Send ''{Left}
    {::Send {{}{}}{Left}
    [::Send []{Left}

#IfWinActive