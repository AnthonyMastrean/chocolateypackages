$id = "angband"
$url = "http://rephial.org/downloads/3.5/angband-v3.5.1-win.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$link = "Angband"
$target = Join-Path $content "angband-3.5.1\angband.exe"
$folder = "CommonPrograms"
$description = "Angband"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

New-GuiBin -Name $target

New-Shortcut -Link $link -Target $target -SpecialFolder $folder -Description $description
