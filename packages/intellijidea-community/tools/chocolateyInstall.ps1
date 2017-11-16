$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.6.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.6.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = 'F6DDCAF451FB260A43A2427B82D056080A71CBA1708DFC4AB123BE01EA210C22'
  checksumType   = 'sha256'
  checksum64     = 'F6DDCAF451FB260A43A2427B82D056080A71CBA1708DFC4AB123BE01EA210C22'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs