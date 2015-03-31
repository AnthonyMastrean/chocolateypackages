$id     = "<%= id %>"
$name   = "<%= title %>"
$kind   = "<%= kind %>"
$silent = "<%= silent %>"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$uninstaller = Get-Uninstaller -Name $name

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -File $uninstaller
