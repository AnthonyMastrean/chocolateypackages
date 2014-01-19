#NoEnv
#SingleInstance force 
SendMode Input
SetWorkingDir %A_ScriptDir%

enabled := false 
set(enabled) 

set(on) { 
  enabled := on 

  path  := enabled ? "underscore_on.ico" : "underscore_off.ico"
  state := enabled ? "ON" : "OFF"

  Menu, Tray, Icon, %path%
  Menu, Tray, Tip, %state%

  Send {Shift Up} 
} 

; Toggle
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
