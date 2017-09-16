$ErrorActionPreference = 'Stop';

$packageName = 'intellijidea-ultimate'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://download.jetbrains.com/idea/ideaIU-2017.2.4.exe'
$url64       = 'https://download.jetbrains.com/idea/ideaIU-2017.2.4.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'IntelliJ IDEA 2017.2*'

  checksum       = '57258ED15D4925E6D403A0692CF8B85EB2093BDD254D2663A861B74A308DA616'
  checksumType   = 'sha256'
  checksum64     = '57258ED15D4925E6D403A0692CF8B85EB2093BDD254D2663A861B74A308DA616'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs