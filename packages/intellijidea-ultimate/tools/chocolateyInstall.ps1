$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.3.5.exe'
$sha256sum   = 'fb784e6eb210705b25e65abe31e3d14aaa6ad76e2ca226e1529ffa504d589e35'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url

  softwareName   = 'IntelliJ IDEA 2017.3*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs