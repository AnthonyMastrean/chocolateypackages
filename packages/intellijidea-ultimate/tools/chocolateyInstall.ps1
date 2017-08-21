$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = '7b1db262378870c862a8bfe33ff5c0238dfe5918018d7fd2691ea995d59dbaea'
  checksumType   = 'sha256'
  checksum64     = '7b1db262378870c862a8bfe33ff5c0238dfe5918018d7fd2691ea995d59dbaea'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs