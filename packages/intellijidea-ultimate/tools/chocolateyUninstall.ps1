$id     = "intellijidea-ultimate"
$name   = "IntelliJ IDEA Ultimate Edition 14.1"
$kind   = "EXE"
$silent = "/S"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
