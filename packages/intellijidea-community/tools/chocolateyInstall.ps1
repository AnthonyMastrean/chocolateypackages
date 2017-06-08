$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = 'A61DA671441CD59227B19B723A90138CB23A0CF3B7ADCC640548FBAE4CCD52AD'
  checksumType   = 'sha256'
  checksum64     = 'A61DA671441CD59227B19B723A90138CB23A0CF3B7ADCC640548FBAE4CCD52AD'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs