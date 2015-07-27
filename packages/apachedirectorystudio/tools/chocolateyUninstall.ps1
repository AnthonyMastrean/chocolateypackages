$id     = "apachedirectorystudio"
$name   = "Apache Directory Studio"

$tools  = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
