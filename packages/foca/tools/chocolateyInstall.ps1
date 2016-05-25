$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content (Join-Path 'bin' 'FOCA.exe')

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'foca' `
    -UnzipLocation $content `
    -Url 'https://www.elevenpaths.com/downloads/FocaPro.zip?agree=on' `
    -Checksum '9D0759F21AFB6E45834BA070CBA4541624E8E8042E85CA8CA5ACCD737CDE770D' `
    -ChecksumType 'SHA256'

Install-Shortcut `
    -Link 'FOCA' `
    -Target $bin `
    -SpecialFolder 'CommonPrograms'

Install-IgnoreBin `
    -Path $bin
