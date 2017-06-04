$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = '13b353c542beb128c3b6012c7c9f691be64868dcfa9895297c27052a77525d75'
  checksumType   = 'sha256'
  checksum64     = '13b353c542beb128c3b6012c7c9f691be64868dcfa9895297c27052a77525d75'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs