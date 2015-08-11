$id     = 'cheatengine'
$name   = 'Cheat Engine 6.4'
$kind   = 'EXE'
$silent = '/VERYSILENT /NORESTART'

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
