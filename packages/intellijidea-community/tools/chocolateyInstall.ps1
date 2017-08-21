$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.2.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.2.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.2*'

  checksum       = '1c166f8851db93a6d79a0dd7f857b275044847771c5bf4af646c23a5374995d5'
  checksumType   = 'sha256'
  checksum64     = '1c166f8851db93a6d79a0dd7f857b275044847771c5bf4af646c23a5374995d5'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs