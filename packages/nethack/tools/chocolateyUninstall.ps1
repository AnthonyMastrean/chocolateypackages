$id = "nethack"
$name = "NetHack for Windows"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link "$name (Tiles)" -SpecialFolder "CommonPrograms"
Remove-Shortcut -Link "$name (Classic)" -SpecialFolder "CommonPrograms"
