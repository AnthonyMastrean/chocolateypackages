$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'adobedigitaleditions' `
  -FileType 'EXE' `
  -SilentArgs '/S' `
  -File (Get-Uninstaller -Name 'Adobe Digital Editions 4.5')
