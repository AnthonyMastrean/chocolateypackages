$id   = "cavesofqud"
$name = "Caves of Qud"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$install  = Join-Path (@{32=$ENV:PROGRAMFILES;64=${ENV:PROGRAMFILES(X86)}}[(Get-ProcessorBits)]) $name
$shortcut = Join-Path ([System.Environment]::GetFolderPath("CommonPrograms")) $name

Remove-Item $install -Force -Recurse
Remove-Item $shortcut -Force -Recurse
