$ErrorActionPreference = 'Stop'

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\version.ps1

$package_args = @{
  packageName    = 'notepad2-mod'
  url            = "https://github.com/XhmikosR/notepad2-mod/releases/download/${version}/Notepad2-mod.${version}.exe"
  checksum       = '45F58D793308F88B19AAEE1B09C352862185DC14'
  checksumType   = 'SHA1'
  fileType       = 'EXE'
  silentArgs     = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @package_args
