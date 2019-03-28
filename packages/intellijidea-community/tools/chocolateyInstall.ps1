$ErrorActionPreference = 'Stop';

$url         = 'https://download.jetbrains.com/idea/ideaIC-2018.3.6.exe'
$sha256sum   = 'aca713295b626e58e968708c0ee54af185bf816d20a7ef4582ee60ff5aa6dd82'

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$programFiles = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
$pp = Get-PackageParameters
$installDir = "$programFiles\JetBrains\IntelliJ IDEA Community Edition $env:ChocolateyPackageVersion"
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

  softwareName   = 'IntelliJ IDEA Community Edition*'

  checksum       = $sha256sum
  checksumType   = 'sha256'
  checksum64     = $sha256sum
  checksumType64 = 'sha256'

  silentArgs     = $silentArgs
  validExitCodes = @(0, 1641, 3010)
}

Install-ChocolateyPackage @packageArgs