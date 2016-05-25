$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'flyinglogicreader' `
    -FileType 'EXE' `
    -Silent '-q' `
    -File (Get-Uninstaller -Name 'Flying Logic Reader 2.2.12')
