$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'pdftk-server' `
  -File (Get-Uninstaller -Name 'PDFtk Server version 2.02') `
  -FileType 'EXE' `
  -SilentArgs '/VERYSILENT'
