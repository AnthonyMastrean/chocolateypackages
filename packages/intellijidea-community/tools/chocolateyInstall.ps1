$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2018.2.7.exe'
$sha256sum   = 'bb19bf8346025e4049cff2e729a356dba62efbe319990393a26078f24f95b019'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url

  softwareName   = 'IntelliJ IDEA Community Edition 2018.2*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs