$id     = "openra"
$name   = "OpenRA"
$kind   = "EXE"
$silent = "/S"

$tools  = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -SilentArgs $silent -File $uninstaller
