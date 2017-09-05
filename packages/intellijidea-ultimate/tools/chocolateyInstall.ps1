$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.1.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.1.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.1*'

  checksum       = '47B8A3A2F610FE793D4712BE99A6A821BEFDB89EBD4F98778451253CDF44FD71'
  checksumType   = 'sha256'
  checksum64     = '47B8A3A2F610FE793D4712BE99A6A821BEFDB89EBD4F98778451253CDF44FD71'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs