$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$main = Join-Path $content 'dksmv-0.2\main.exe'

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'darksoulsmapviewer' `
    -Url 'http://kayin.pyoko.org/darksoulsmapviewer.zip' `
    -Checksum '2004205a4bd94f190a62d7e01c3bea7c' `
    -UnzipLocation $content

Install-IgnoreBin `
    -Path $main

Install-Shortcut `
    -Link 'Dark Souls Map Viewer' `
    -Target $main `
    -SpecialFolder 'CommonPrograms'
