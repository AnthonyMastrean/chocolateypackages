$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.3.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.3.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.3*'

  checksum       = '555215a1844e1f39d857abb5b84d3368b06e90165cc0d7a666fc875492bfa557'
  checksumType   = 'sha256'
  checksum64     = '555215a1844e1f39d857abb5b84d3368b06e90165cc0d7a666fc875492bfa557'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs