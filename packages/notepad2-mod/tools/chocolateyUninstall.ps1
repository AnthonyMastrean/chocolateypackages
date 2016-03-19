$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1
. $tools\version.ps1

$package_args = @{
  packageName = 'notepad2-mod'
  fileType    = 'EXE'
  silentArgs  = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
  file        = Get-Uninstaller -Name "Notepad2-mod ${version}"
}

Uninstall-ChocolateyPackage @package_args
