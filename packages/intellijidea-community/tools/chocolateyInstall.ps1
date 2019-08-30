$ErrorActionPreference = 'Stop';

$url = 'https://download.jetbrains.com/idea/ideaIC-2019.2.1.exe'
$sha256sum = 'd2db342cf3530380146b910bcf0c03d0616e8c97d7f747e762e9676ceac3d1f4'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
if ([System.Environment]::Is64BitOperatingSystem) {
    $programFiles = $env:ProgramFiles
}
else {
    $programFiles = ${env:ProgramFiles(x86)}
}
$installDir = "$programFiles\JetBrains\IntelliJ IDEA Community Edition $env:ChocolateyPackageVersion"

$pp = Get-PackageParameters
if ($pp.InstallDir) {
    $installDir = $pp.InstallDir
}

$silentArgs = "/S /CONFIG=$toolsDir\silent.config "
$silentArgs += "/D=`"$installDir`""

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
