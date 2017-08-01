$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.1.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.1.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = '9E644D6D4B8266036A17A7F4B04C34A85F7A75E4C6661B72682CFBFC121E68DB'
  checksumType   = 'sha256'
  checksum64     = '9E644D6D4B8266036A17A7F4B04C34A85F7A75E4C6661B72682CFBFC121E68DB'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs