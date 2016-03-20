$ErrorActionPreference = 'Stop'

$tools = Split-Path $MyInvocation.MyCommand.Definition
. $tools\version.ps1

$url = "https://github.com/XhmikosR/notepad2-mod/releases/download/${version}/Notepad2-mod.${version}.exe"
$checksumType = 'sha1'
$package_args = @{
  packageName    = 'notepad2-mod'
  url            = $url
  url64          = $url
  checksum       = $checksum
  checksum64     = $checksum
  checksumType   = $checksumType
  checksumType64 = $checksumType
  fileType       = 'EXE'
  silentArgs     = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @package_args
