$id = "tome"
$name = "Tales of Maj'Eyal"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonDesktop"
Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
