$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'scansnapmanager' `
    -FileType 'EXE' `
    -SilentArgs '/S' `
    -File (Get-Uninstaller -Name 'ScanSnap Manager')
