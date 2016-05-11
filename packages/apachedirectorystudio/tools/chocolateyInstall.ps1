$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$bin = Join-Path $package (Join-Path 'ApacheDirectoryStudio' 'ApacheDirectoryStudio.exe')

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'apachedirectorystudio' `
    -UnzipLocation $package `
    -Url 'http://archive.apache.org/dist/directory/studio/2.0.0.v20151221-M10/ApacheDirectoryStudio-2.0.0.v20151221-M10-win32.win32.x86.zip' `
    -Url64 'http://archive.apache.org/dist/directory/studio/2.0.0.v20151221-M10/ApacheDirectoryStudio-2.0.0.v20151221-M10-win32.win32.x86_64.zip' `
    -Checksum 'd89794897b9de46af33a113551f2c0f8' `
    -Checksum64 '4f45ccfe6abf6bf265f385f972a48123'

Install-Shortcut `
    -Link 'Apache Directory Studio' `
    -Target $bin `
    -SpecialFolder 'CommonPrograms'

Install-IgnoreBin `
    -Path $bin
