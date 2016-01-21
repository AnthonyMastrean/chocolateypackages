$ErrorActionPreference = 'Stop'

$url = 'https://github.com/XhmikosR/notepad2-mod/releases/download/4.2.25.964/Notepad2-mod.4.2.25.964.exe'
$package_args = @{
  packageName  = 'notepad2-mod'
  url          = $url
  url64        = $url
  checksum     = 'b9c150d3ae4f09264a7a5b736072becb'
  checksumType = 'md5'
  fileType     = 'EXE'
  silentArgs   = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @package_args
