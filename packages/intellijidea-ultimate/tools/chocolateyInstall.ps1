$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.6.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.6.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = 'E62EB788C7DF38E4033A97DD12C8B385ACC79DF2CD47B2B3B849FFD96BA7A749'
  checksumType   = 'sha256'
  checksum64     = 'E62EB788C7DF38E4033A97DD12C8B385ACC79DF2CD47B2B3B849FFD96BA7A749'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs