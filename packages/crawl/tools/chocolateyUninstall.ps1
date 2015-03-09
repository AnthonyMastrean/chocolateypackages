$id = "crawl"
$kind = "EXE"
$silent = "/S"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\nullsoft.ps1

$target = Get-NullsoftUninstaller -Name "Crawl"

Uninstall-ChocolateyPackage $id $kind $silent $target
