$tools   = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
    -Link 'Dark Souls Map Viewer' `
    -SpecialFolder 'CommonPrograms'
