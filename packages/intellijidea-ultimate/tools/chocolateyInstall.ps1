$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.3.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.3.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.3*'

  checksum       = '286BCDBBCE01E0E12E70655C7E8BC087BA3215284032B0C4C380D3BCF0D09413'
  checksumType   = 'sha256'
  checksum64     = '286BCDBBCE01E0E12E70655C7E8BC087BA3215284032B0C4C380D3BCF0D09413'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs