$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'sendtokindle' `
    -FileType 'EXE' `
    -Silent '/S' `
    -File (Get-Uninstaller -Name 'Amazon Send to Kindle')
