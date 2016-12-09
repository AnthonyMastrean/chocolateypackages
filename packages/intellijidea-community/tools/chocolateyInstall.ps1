$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-community'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIC-2016.3.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIC-2016.3.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA Community Edition 2016.3*'

  checksum       = 'BDF1A24B56F143AE5C680A2F40349219635C2140A600D15CEF80A49BCDB4C717'
  checksumType   = 'sha256'
  checksum64     = 'BDF1A24B56F143AE5C680A2F40349219635C2140A600D15CEF80A49BCDB4C717'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs