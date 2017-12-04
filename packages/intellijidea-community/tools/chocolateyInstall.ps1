$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.3*'

  checksum       = '5e1342cf1ccf93e5f0b86a9e8ea57b33f1b641d257ce647988781af14a785f70'
  checksumType   = 'sha256'
  checksum64     = '5e1342cf1ccf93e5f0b86a9e8ea57b33f1b641d257ce647988781af14a785f70'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs