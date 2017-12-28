$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.3.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.3.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.3*'

  checksum       = '1ee317af85773d51ae7c4259736a48debc7e34b265e5881643ae472b27b43cd2'
  checksumType   = 'sha256'
  checksum64     = '1ee317af85773d51ae7c4259736a48debc7e34b265e5881643ae472b27b43cd2'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs