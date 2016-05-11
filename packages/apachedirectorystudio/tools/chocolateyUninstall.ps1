$tools  = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut `
    -Link 'Apache Directory Studio' `
    -SpecialFolder 'CommonPrograms'
