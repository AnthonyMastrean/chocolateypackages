$id   = "screentogif"
$link = "Screen to Gif"

$tools   = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $link -SpecialFolder "CommonPrograms"
