$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
  -Link          'DTK Sneak' `
  -SpecialFolder 'CommonStartup'
