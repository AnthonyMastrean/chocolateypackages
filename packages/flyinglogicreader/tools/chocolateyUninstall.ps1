$id     = "flyinglogicreader"
$name   = "Flying Logic Reader 2.2.11"
$kind   = "EXE"
$silent = "-q"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
