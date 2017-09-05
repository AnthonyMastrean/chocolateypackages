$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = 'E1B73E7F43FA9A5A200ED0D61EDCECE537B81CBDD541ABBC4835AFBE110A3DF4'
  checksumType   = 'sha256'
  checksum64     = 'E1B73E7F43FA9A5A200ED0D61EDCECE537B81CBDD541ABBC4835AFBE110A3DF4'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs