$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = '55402454D4EBDB3B60688BAE35225B72345680178136197CDF81C29E39EDC506'
  checksumType   = 'sha256'
  checksum64     = '55402454D4EBDB3B60688BAE35225B72345680178136197CDF81C29E39EDC506'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs