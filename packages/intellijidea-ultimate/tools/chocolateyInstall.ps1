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

  checksum       = '0B81EE8103E20FA950D33AB460AA245A260C14FFCDCBB2E6BB35A86C28610DEB'
  checksumType   = 'sha256'
  checksum64     = '0B81EE8103E20FA950D33AB460AA245A260C14FFCDCBB2E6BB35A86C28610DEB'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs