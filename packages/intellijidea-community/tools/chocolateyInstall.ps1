$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = '5A6104300AB90D56EFC3DD1304AC95FFF5E2558A3663A8CF1B24945593294759'
  checksumType   = 'sha256'
  checksum64     = '5A6104300AB90D56EFC3DD1304AC95FFF5E2558A3663A8CF1B24945593294759'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs