$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2016.3.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2016.3.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2016.3*'

  checksum       = '207DBC84F6769EB0E675DD6DB6D4D66F042F87E91B10CEF83679848595C0CA8E'
  checksumType   = 'sha256'
  checksum64     = '207DBC84F6769EB0E675DD6DB6D4D66F042F87E91B10CEF83679848595C0CA8E'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs