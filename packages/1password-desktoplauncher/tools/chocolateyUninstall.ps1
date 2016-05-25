$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
  -Link          '1Password Desktop Launcher' `
  -SpecialFolder 'CommonStartup'
