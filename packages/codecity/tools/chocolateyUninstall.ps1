$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

. $tools\shortcut.ps1

Uninstall-Shortcut `
    -Link 'CodeCity' `
    -SpecialFolder 'CommonPrograms'
