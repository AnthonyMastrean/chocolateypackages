$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2016.3.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2016.3.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2016.3*'

  checksum       = '3BBB5B20197B26B16E623AD919E34C7022C6F89EF290447822B1259619266640'
  checksumType   = 'sha256'
  checksum64     = '3BBB5B20197B26B16E623AD919E34C7022C6F89EF290447822B1259619266640'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs