$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.3*'

  checksum       = '31c061e36838b5cc549a552813777a8abca84eb850a555a5d826e2302e97b0cd'
  checksumType   = 'sha256'
  checksum64     = '31c061e36838b5cc549a552813777a8abca84eb850a555a5d826e2302e97b0cd'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs