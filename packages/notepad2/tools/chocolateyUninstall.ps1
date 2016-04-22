$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$items = (Get-Uninstaller -Name 'Notepad2 (Notepad Replacement)') -split ' '

$uninstaller = $items[0]
$silent = $items[1..$items.Length] -join ' '

Uninstall-ChocolateyPackage `
    -PackageName 'notepad2' `
    -FileType 'EXE' `
    -SilentArgs $silent `
    -File $uninstaller
