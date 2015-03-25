$id   = "darksoulsmapviewer"
$name = "Dark Souls Map Viewer"
$url  = "http://kayin.pyoko.org/darksoulsmapviewer.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$main    = Join-Path $content "dksmv-0.2\main.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-IgnoreBin -Name $main

New-Shortcut -Link $name -Target $main -SpecialFolder "CommonDesktop"
New-Shortcut -Link $name -Target $main -SpecialFolder "CommonPrograms"
