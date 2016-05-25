$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Uninstall-Shortcut -Link 'NetHack for Windows (Tiles)' -SpecialFolder 'CommonPrograms'
Uninstall-Shortcut -Link 'NetHack for Windows (Classic)' -SpecialFolder 'CommonPrograms'
