$id    = "pwnadventure3"
$name  = "Pwn Adventure 3 - Pwnie Island"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
Remove-Shortcut -Link $name -SpecialFolder "CommonDesktop"
