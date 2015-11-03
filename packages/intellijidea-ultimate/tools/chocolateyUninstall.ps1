$id     = "intellijidea-ultimate"
$name   = "IntelliJ IDEA Ultimate Edition 15.0"
$kind   = "EXE"
$silent = "/S"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
