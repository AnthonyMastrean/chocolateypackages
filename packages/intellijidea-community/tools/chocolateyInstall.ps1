$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2016.3.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2016.3.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2016.3*'

  checksum       = 'D7C04FFECB94441C135FE1A5227B786BF00EA7AD3D9DBE80AEDF86B4E1D91A3E'
  checksumType   = 'sha256'
  checksum64     = 'D7C04FFECB94441C135FE1A5227B786BF00EA7AD3D9DBE80AEDF86B4E1D91A3E'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs