$ErrorActionPreference = 'Stop'

$url = 'https://github.com/XhmikosR/notepad2-mod/releases/download/4.2.25.964/Notepad2-mod.4.2.25.964.exe'
$checksum = '83c1e8e3d57cbb5d5be94cf851df680fa7d2f9de'
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
