$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\version.ps1

$package_args = @{
  packageName = 'notepad2-mod'
  fileType    = 'EXE'
  silentArgs  = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
  file        = (Get-UninstallRegistryKey -SoftwareName "Notepad2-mod ${version}").UninstallString
}

Uninstall-ChocolateyPackage @package_args
