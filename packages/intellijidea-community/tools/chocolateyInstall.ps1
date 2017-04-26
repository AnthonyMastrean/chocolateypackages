$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = 'D84101ED0A4A7978099AD4B6D5DCCAFAB5E60C30D1E0A50423626A8B62FEE692'
  checksumType   = 'sha256'
  checksum64     = 'D84101ED0A4A7978099AD4B6D5DCCAFAB5E60C30D1E0A50423626A8B62FEE692'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs