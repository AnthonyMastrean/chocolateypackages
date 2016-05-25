$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'kindle' `
  -FileType 'EXE' `
  -SilentArgs '/S' `
  -File (Get-Uninstaller -Name 'Amazon Kindle')
