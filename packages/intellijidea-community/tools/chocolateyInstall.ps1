$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2016.3.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2016.3.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2016.3*'

  checksum       = '74B3C292A93DBA703B6C37D8C368AA35D51DECEE3CB57292962691F0ACCBB13D'
  checksumType   = 'sha256'
  checksum64     = '74B3C292A93DBA703B6C37D8C368AA35D51DECEE3CB57292962691F0ACCBB13D'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs