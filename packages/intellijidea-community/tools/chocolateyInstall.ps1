$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = '520C8DD9321266FA2BAF9FB052EF803FF6DBCFD2C11E541A84A92602B5B3C2C9'
  checksumType   = 'sha256'
  checksum64     = '520C8DD9321266FA2BAF9FB052EF803FF6DBCFD2C11E541A84A92602B5B3C2C9'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs