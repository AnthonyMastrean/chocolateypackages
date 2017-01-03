$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2016.3.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2016.3.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2016.3*'

  checksum       = '7498D17DA49B71C6CF40F99288F5383DDC918BB79F4539D7E900507AAFE89F1A'
  checksumType   = 'sha256'
  checksum64     = '7498D17DA49B71C6CF40F99288F5383DDC918BB79F4539D7E900507AAFE89F1A'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs