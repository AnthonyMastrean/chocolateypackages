$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'adobedigitaleditions' `
  -File (Get-Uninstaller -Name 'Adobe Digital Editions 4.5') `
  -FileType 'EXE' `
  -SilentArgs '/S'
