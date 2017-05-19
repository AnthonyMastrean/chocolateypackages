$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = '8263080FCDB6F356E8CE31F722B09CD411E1142E7301B2551D1A847653C6B595'
  checksumType   = 'sha256'
  checksum64     = '8263080FCDB6F356E8CE31F722B09CD411E1142E7301B2551D1A847653C6B595'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs