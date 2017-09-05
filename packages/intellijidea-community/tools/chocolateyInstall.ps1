$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = 'B78963FC199B0BA8D167753AC68E1B024548C189476F8F8F50525F6F7FCAFC03'
  checksumType   = 'sha256'
  checksum64     = 'B78963FC199B0BA8D167753AC68E1B024548C189476F8F8F50525F6F7FCAFC03'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs