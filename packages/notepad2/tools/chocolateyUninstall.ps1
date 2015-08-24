$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\uninstall.ps1

$package_args = @{
  packageName = 'notepad2'
  fileType    = 'EXE'
  silentArgs  = '/SILENT'
  file        = Get-Uninstaller -Name 'Notepad2 (Notepad Replacement)'
}

Uninstall-ChocolateyPackage @package_args
