$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
    -Link 'Prime95' `
    -SpecialFolder 'CommonPrograms'
