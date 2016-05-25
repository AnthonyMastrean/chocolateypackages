$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
    -Link 'Screen to Gif' `
    -SpecialFolder 'CommonPrograms'
