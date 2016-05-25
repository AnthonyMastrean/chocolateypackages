$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'flyinglogicpro' `
    -FileType 'EXE' `
    -Silent '-q' `
    -File (Get-Uninstaller -Name 'Flying Logic Pro 2.2.12')
