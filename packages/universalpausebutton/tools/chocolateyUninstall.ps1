$id   = "universalpausebutton"
$name = "Universal Pause Button"

$tools   = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
Remove-Shortcut -Link $name -SpecialFolder "CommonStartup"
