$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = '2D8D5765BB6052FF1A10D27E3640ED2BFAAF31CBC70A8F58DCCF2AF255A9A9C6'
  checksumType   = 'sha256'
  checksum64     = '2D8D5765BB6052FF1A10D27E3640ED2BFAAF31CBC70A8F58DCCF2AF255A9A9C6'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs