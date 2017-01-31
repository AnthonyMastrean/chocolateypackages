$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2016.3.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2016.3.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2016.3*'

  checksum       = 'F2B860EF5618EA11A1510AC64D9EEACF8D3D3627C34B00D43682A5BEF0E12B75'
  checksumType   = 'sha256'
  checksum64     = 'F2B860EF5618EA11A1510AC64D9EEACF8D3D3627C34B00D43682A5BEF0E12B75'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs