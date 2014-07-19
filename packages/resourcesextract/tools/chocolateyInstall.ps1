$id = "resourcesextract"
$url = "http://www.nirsoft.net/utils/resourcesextract.zip"
$url64 = "http://www.nirsoft.net/utils/resourcesextract-x64.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$gui = Join-Path $content "ResourcesExtract.exe.gui"

Install-ChocolateyZipPackage $id $url $content $url64

New-Item $gui -Type File -Force | Out-Null
