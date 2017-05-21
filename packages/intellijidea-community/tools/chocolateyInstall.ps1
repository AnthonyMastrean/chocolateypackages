$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2017.1.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2017.1.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2017.1*'

  checksum       = 'b5a9aae89f922d5ad547af306ad14a1b54d56243aee372381b0cc7e140f523f6'
  checksumType   = 'sha256'
  checksum64     = 'b5a9aae89f922d5ad547af306ad14a1b54d56243aee372381b0cc7e140f523f6'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs