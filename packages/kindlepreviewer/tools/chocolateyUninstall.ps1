$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'kindlepreviewer' `
    -FileType 'EXE' `
    -Silent '/S' `
    -File (Get-Uninstaller -Name 'Kindle Previewer')
