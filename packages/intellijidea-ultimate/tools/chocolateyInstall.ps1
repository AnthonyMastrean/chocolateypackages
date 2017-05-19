$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2016.3.5.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2016.3.5.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2016.3*'

  checksum       = '3D657662526E427E1FC472DB06C1ED223BCF8C3434C0BA90DFA4554465B2D376'
  checksumType   = 'sha256'
  checksum64     = '3D657662526E427E1FC472DB06C1ED223BCF8C3434C0BA90DFA4554465B2D376'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs