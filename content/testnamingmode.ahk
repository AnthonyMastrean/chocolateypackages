;==================================================
; Test Naming Mode
;
; Enable easy BDD-styled test naming by pressing `CTRL+SHIFT+U`. That is, spaces
; become underscores '_' automatically! You can exit this mode by pressing `Tab`,
; `Esc`, or `Enter`. This should work nicely with tools like ReSharper that use 
; those same keys as template hotkeys.
;==================================================

enabledIcon := "testnamingmode_16.ico" 
disabledIcon := "testnamingmode_disabled_16.ico" 

;==================================================
; Recommendations for all new scripts for speed, compatibility, and consistency
;==================================================
#NoEnv
#SingleInstance force 
SendMode Input
SetWorkingDir %A_ScriptDir%

;==================================================
; Initialize off
;==================================================
IsInTestNamingMode := false 
SetTestNamingMode(false) 

;==================================================
; Stash and update the state
;==================================================
SetTestNamingMode(toActive) { 
    local iconFile := toActive ? enabledIcon : disabledIcon 
    local state := toActive ? "ON" : "OFF" 

    IsInTestNamingMode := toActive 

    ; Sexy tray icon and text
    Menu, Tray, Icon, %iconFile%, 
    Menu, Tray, Tip, Test naming mode is %state% 

    Send {Shift Up} 
} 

;==================================================
; Toggle
;==================================================
^+u:: 
SetTestNamingMode(!IsInTestNamingMode) 
return 

$Escape:: 
if (IsInTestNamingMode) { 
SetTestNamingMode(!IsInTestNamingMode) 
} 
Send, {Escape} 
return 

^[:: 
if (IsInTestNamingMode) { 
SetTestNamingMode(!IsInTestNamingMode) 
} 
Send, ^[ 
return 

$Enter:: 
if (IsInTestNamingMode) { 
SetTestNamingMode(!IsInTestNamingMode) 
} else { 
Send, {Enter} 
} 
return 

$Space:: 
if (IsInTestNamingMode) { 
Send, _ 
} else { 
Send, {Space} 
} 