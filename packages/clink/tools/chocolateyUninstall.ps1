$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'clink' `
  -File (Get-Uninstaller -Name 'Clink v0.4.7') `
  -FileType 'EXE' `
  -SilentArgs '/S'
