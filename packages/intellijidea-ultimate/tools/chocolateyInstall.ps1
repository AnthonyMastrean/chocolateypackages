$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = '1B1CBE3E58034782479AB715A49DCA42DF76DF345518B77280FCEBAB5BB14D08'
  checksumType   = 'sha256'
  checksum64     = '1B1CBE3E58034782479AB715A49DCA42DF76DF345518B77280FCEBAB5BB14D08'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs