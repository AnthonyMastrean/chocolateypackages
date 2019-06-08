$ErrorActionPreference = 'Stop';

$url = 'https://download.jetbrains.com/idea/ideaIC-2019.1.3.exe'
$sha256sum = '7398b3e580c11ec7289b8cc86761a446007a7027a50fcc2a13206abb2a6e0bf7'

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