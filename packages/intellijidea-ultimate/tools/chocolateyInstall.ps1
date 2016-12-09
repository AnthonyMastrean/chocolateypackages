$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2016.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2016.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2016.3*'

  checksum       = '3F12AAAD21D0E56581EA5EC6B5B405D83236345C0994287FD4CB0D255669639F'
  checksumType   = 'sha256'
  checksum64     = '3F12AAAD21D0E56581EA5EC6B5B405D83236345C0994287FD4CB0D255669639F'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs