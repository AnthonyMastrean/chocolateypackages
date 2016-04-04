$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$classic = Join-Path $content 'NetHack.exe'
$tiles = Join-Path $content 'NetHackW.exe'

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'nethack' `
    -Url 'https://sourceforge.net/projects/nethack/files/nethack/3.6.0/nethack-360-win-x86-2.zip/download' `
    -Checksum 'da1dcadb67ccdbe4fa7ffda096565c14' `
    -UnzipLocation $content

Install-GuiBin -Path $tiles

Install-Shortcut `
    -Link 'NetHack for Windows (Tiles)' `
    -Target $tiles `
    -SpecialFolder 'CommonPrograms'

Install-Shortcut `
    -Link 'NetHack for Windows (Classic)' `
    -Target $classic `
    -SpecialFolder 'CommonPrograms'
