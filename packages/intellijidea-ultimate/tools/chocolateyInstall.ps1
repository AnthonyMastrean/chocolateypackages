$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.2.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.2.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = '1F3634DCD805B67E29A479FD4BAF4310D2A19F0E40136853F2BF64DC9ADBA3C6'
  checksumType   = 'sha256'
  checksum64     = '1F3634DCD805B67E29A479FD4BAF4310D2A19F0E40136853F2BF64DC9ADBA3C6'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs