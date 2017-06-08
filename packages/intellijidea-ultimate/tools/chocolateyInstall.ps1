$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = '099CCB0455352A8F591B02A4C3F77BA977747D0E2519991A35885CD322E5A7C2'
  checksumType   = 'sha256'
  checksum64     = '099CCB0455352A8F591B02A4C3F77BA977747D0E2519991A35885CD322E5A7C2'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs