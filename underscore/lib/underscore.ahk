;==================================================
; Underscore Mode for Windows
;==================================================
#NoEnv
#SingleInstance force 
SendMode Input
SetWorkingDir %A_ScriptDir%

;==================================================
; Initialize off
;==================================================
enabled := false 
set(false) 

;==================================================
; Stash and update the state
;==================================================
set(on) { 
  local icon := on ? "underscore_on.ico" : "underscore_off.ico" 
  local state := on ? "ON" : "OFF" 

  enabled := on 

  ; Sexy tray icon and text
  Menu, Tray, Icon, %icon%, 
  Menu, Tray, Tip, Underscore Mode is %state% 

  Send {Shift Up} 
} 

;==================================================
; Toggle
;==================================================
^+u:: 
set(!enabled) 
return 

$Escape:: 
if (enabled) { 
  set(!enabled) 
} 
Send, {Escape} 
return 

^[:: 
if (enabled) { 
  set(!enabled) 
} 
Send, ^[ 
return 

$Enter:: 
if (enabled) { 
  set(!enabled) 
} else { 
  Send, {Enter} 
} 
return 

$Space:: 
if (enabled) { 
  Send, _ 
} else { 
  Send, {Space} 
} 
