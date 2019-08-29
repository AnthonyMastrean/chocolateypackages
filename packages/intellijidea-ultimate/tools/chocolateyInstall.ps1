$ErrorActionPreference = 'Stop';

$url = 'https://download.jetbrains.com/idea/ideaIU-2019.2.1.exe'
$sha256sum = '8187bb108e5afea78b3fea0fe4f61d61078deaddbff3d06a9a8784b7b050aa61'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
if ([System.Environment]::Is64BitOperatingSystem) {
    $programFiles = $env:ProgramFiles
} else {
    $programFiles = ${env:ProgramFiles(x86)}
}

$installDir = "$programFiles\JetBrains\IntelliJ IDEA $env:ChocolateyPackageVersion"

$pp = Get-PackageParameters
if ($pp.InstallDir) {
    $installDir = $pp.InstallDir
}



$silentArgs = "/S /CONFIG=$toolsDir\silent.config "
$silentArgs += "/D=$installDir"

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
