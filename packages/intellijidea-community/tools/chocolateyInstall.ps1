$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2018.2.6.exe'
$sha256sum   = 'eafe9f9434729fb101aaeb09a3d6957e8bc1842c156baf40f5f378bb36e2bcbb'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url

  softwareName   = 'IntelliJ IDEA Community Edition 2018.2*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs