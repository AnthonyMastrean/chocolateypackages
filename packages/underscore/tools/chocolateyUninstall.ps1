$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
  -Link          'Underscore Mode' `
  -SpecialFolder 'CommonStartup'
