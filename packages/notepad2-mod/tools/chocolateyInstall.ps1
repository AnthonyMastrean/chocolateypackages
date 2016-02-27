$ErrorActionPreference = 'Stop'

$url = 'https://github.com/XhmikosR/notepad2-mod/releases/download/4.2.25.970/Notepad2-mod.4.2.25.970.exe'
$checksum = '944DB5741E9759BAD75505016B0FCD7257F26BEA'
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
