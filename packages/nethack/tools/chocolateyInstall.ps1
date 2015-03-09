$id = "nethack"
$url = "http://sourceforge.net/projects/nethack/files/nethack/3.4.3/nethack-343-win.zip/download"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$classic = Join-Path $content "NetHack.exe"
$tiles = Join-Path $content "NetHackW.exe"

$link = "NetHack"
$folder = "CommonPrograms"
$description = "NetHack for Windows"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

New-GuiBin $tiles

New-Shortcut -Link "$link (Tiles)" -Target $tiles -SpecialFolder $folder -Description "$description (Tiles)"
New-Shortcut -Link $link -Target $classic -SpecialFolder $folder -Description "$description (Classic)"
