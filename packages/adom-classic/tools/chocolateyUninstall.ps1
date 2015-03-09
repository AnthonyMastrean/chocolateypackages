$id = "adom-classic"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$link = "Adom"
$folder = "CommonPrograms"

. $tools\shortcut.ps1

Remove-Shortcut -Link $link -SpecialFolder $folder
