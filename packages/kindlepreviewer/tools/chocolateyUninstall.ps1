$id     = "kindlepreviewer"
$name   = "Kindle Previewer"
$kind   = "EXE"
$silent = "/S"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uininstaller = Get-Uninstaller -Name $name -Local

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
