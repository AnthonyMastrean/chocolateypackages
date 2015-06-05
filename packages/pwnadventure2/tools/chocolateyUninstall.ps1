$id    = "pwnadventure2"
$name  = "Choose Your Pwn Adventure 2"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
Remove-Shortcut -Link $name -SpecialFolder "CommonDesktop"
