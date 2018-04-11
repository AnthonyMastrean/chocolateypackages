$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2018.1.1.exe'
$sha256sum   = '65ee56cae871026313fc168a736d8565de6fe2519768458310da16c8ff297af8'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url

  softwareName   = 'IntelliJ IDEA 2018.1*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs