$id = "nethack"

$link = "NetHack"
$folder = "CommonPrograms"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link "$link (Tiles)" -SpecialFolder $folder
Remove-Shortcut -Link $link -SpecialFolder $folder
