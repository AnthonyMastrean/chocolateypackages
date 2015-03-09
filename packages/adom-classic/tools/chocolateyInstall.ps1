$id = "adom-classic"
$url = "http://www.ancardia.com/download/adom_windows_1.2.0_pre23.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$link = "Adom"
$folder = "CommonPrograms"
$target = Join-Path $content "adom\Adom.exe"
$description = "Ancient Domains of Mystery"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

New-GuiBin -Name $target

New-Shortcut -Link $link -Target $target -SpecialFolder $folder -Description $description
