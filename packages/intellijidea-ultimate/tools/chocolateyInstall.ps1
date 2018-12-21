$ErrorActionPreference = 'Stop';

$url         = 'https://download.jetbrains.com/idea/ideaIU-2018.3.2.exe'
$sha256sum   = '983c072797b4be23b0e9ae43e74ef232e7b7747d145ac2b51c853dce6e50c93b'

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