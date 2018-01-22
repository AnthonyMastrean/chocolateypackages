$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.3.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.3.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.3*'

  checksum       = '2083bf6be659b50e7f7672193c659bb83efa8011536e915c5159e6255ce5f9b6'
  checksumType   = 'sha256'
  checksum64     = '2083bf6be659b50e7f7672193c659bb83efa8011536e915c5159e6255ce5f9b6'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs