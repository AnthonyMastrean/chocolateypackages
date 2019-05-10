$ErrorActionPreference = 'Stop';

$url         = 'https://download.jetbrains.com/idea/ideaIU-2019.1.2.exe'
$sha256sum   = '00d2ed7ff6e3eff1116724fa9f81527ac74d329fe544c8bc444cbbd62955f5d1'

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$programFiles = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
$pp = Get-PackageParameters
$installDir = "$programFiles\JetBrains\IntelliJ IDEA $env:ChocolateyPackageVersion"
if ($pp.InstallDir) {
    $installDir = $pp.InstallDir
}

$silentArgs   = "/S /CONFIG=$toolsDir\silent.config "
$silentArgs   += "/D=`"$installDir`""

New-Item -ItemType Directory -Force -Path $installDir

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url
  url64bit       = $url

  softwareName   = 'IntelliJ IDEA*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = $silentArgs
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs