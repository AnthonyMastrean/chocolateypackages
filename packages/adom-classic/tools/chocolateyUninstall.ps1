$id = "adom-classic"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

$link = "adom"
$folder = "CommonPrograms"

Remove-Shortcut -Link $link -SpecialFolder $folder
