$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = 'D764EBFE7ED256FBE2796F11024C85D6B34E2E658A2262D6126A0B005A661EF9'
  checksumType   = 'sha256'
  checksum64     = 'D764EBFE7ED256FBE2796F11024C85D6B34E2E658A2262D6126A0B005A661EF9'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs