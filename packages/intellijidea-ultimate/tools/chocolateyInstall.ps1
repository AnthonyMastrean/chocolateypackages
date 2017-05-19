$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = 'AD031F11D786A7A353140A348AA53170A9C040036E0ABD22D5FB1980443FD1FA'
  checksumType   = 'sha256'
  checksum64     = 'AD031F11D786A7A353140A348AA53170A9C040036E0ABD22D5FB1980443FD1FA'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs