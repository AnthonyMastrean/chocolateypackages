$id = "adom-classic"
$url = "http://www.ancardia.com/download/old/1.1.1/adom_windows_1.1.1_beta4.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$link = "adom"
$folder = "CommonPrograms"
$target = Join-Path $content "Adom_winbeta4.exe"
$description = "Ancient Domains of Mystery"

. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

New-Shortcut -Link $link -Target $target -SpecialFolder $folder -Description $description
