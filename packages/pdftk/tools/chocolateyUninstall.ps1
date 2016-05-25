$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

Uninstall-ChocolateyPackage `
  -PackageName 'pdftk' `
  -File (Get-Uninstaller -Name 'PDFtk - The PDF Toolkit version 2.02') `
  -FileType 'EXE' `
  -SilentArgs '/VERYSILENT'
