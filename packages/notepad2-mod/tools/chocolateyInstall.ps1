$ErrorActionPreference = 'Stop'

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\version.ps1

$package_args = @{
  packageName    = 'notepad2-mod'
  url            = $url
  url64          = $url
  checksum       = $checksum
  checksum64     = $checksum
  checksumType   = $checksumType
  checksumType64 = $checksumType
  fileType       = 'EXE'
  silentArgs     = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @package_args
