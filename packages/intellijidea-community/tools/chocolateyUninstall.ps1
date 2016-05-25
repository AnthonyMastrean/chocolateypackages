$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'intellijidea-community' `
  -FileType 'EXE' `
  -Silent '/S' `
  -File (Get-Uninstaller -Name 'IntelliJ IDEA Community Edition 2016.1.1')
