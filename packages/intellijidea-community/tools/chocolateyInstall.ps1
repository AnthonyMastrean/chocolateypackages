$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.3.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.3.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.3*'

  checksum       = '57DF5BF1A78CBF94F1ED09A6D31122B80E7C470C7771B92712DD14CCB65E3519'
  checksumType   = 'sha256'
  checksum64     = '57DF5BF1A78CBF94F1ED09A6D31122B80E7C470C7771B92712DD14CCB65E3519'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs