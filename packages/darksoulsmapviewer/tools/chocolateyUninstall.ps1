$id   = "darksoulsmapviewer"
$name = "Dark Souls Map Viewer"

$tools   = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonDesktop"
Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
