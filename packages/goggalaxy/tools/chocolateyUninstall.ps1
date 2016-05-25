$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -FileType 'EXE' `
    -Silent '/VERYSILENT /NORESTART' `
    -File (Get-Uninstaller -Name 'GOG Galaxy')
