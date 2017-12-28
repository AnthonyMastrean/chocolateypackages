$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.3.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.3.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.3*'

  checksum       = '41bcc993b945d7b9654c37b2325f83a6f1befe4ae1e172907ef0d6308109ce07'
  checksumType   = 'sha256'
  checksum64     = '41bcc993b945d7b9654c37b2325f83a6f1befe4ae1e172907ef0d6308109ce07'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs