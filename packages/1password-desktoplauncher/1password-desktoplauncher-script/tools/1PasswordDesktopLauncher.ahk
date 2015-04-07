#NoEnv
#SingleInstance, Force
SendMode, Input
SetWorkingDir, %A_ScriptDir%

FileInstall, 1Password.ico, 1Password.ico

Menu, Tray, Icon, 1Password.ico
Menu, Tray, Tip, 1Password Desktop Launcher

GroupAdd, browsers, ahk_class Chrome_WidgetWin_1
GroupAdd, browsers, ahk_class IEFrame

#IfWinNotActive ahk_group browsers

^\::
  Run, "C:\Program Files (x86)\1Password 4\1Password.exe"
  return

#IfWinNotActive
