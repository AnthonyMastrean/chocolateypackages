$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = '47F03C4D71D16D90E3239DCA2B51325DCEE917AB53CB56B311ED83C19F9224BD'
  checksumType   = 'sha256'
  checksum64     = '47F03C4D71D16D90E3239DCA2B51325DCEE917AB53CB56B311ED83C19F9224BD'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs