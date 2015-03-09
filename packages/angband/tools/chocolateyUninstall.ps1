$id = "angband"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$link = "Angband"
$folder = "CommonPrograms"

. $tools\shortcut.ps1

Remove-Shortcut -Link $link -SpecialFolder $folder
