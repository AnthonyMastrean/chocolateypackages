$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$package_args = @{
  packageName = 'notepad2-mod'
  fileType    = 'EXE'
  silentArgs  = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
  file        = Get-Uninstaller -Name 'Notepad2-mod 4.2.25.964'
}

Uninstall-ChocolateyPackage @package_args
