$id = "codecity"
$url = "http://www.inf.usi.ch/phd/wettel/download.php?f=codecity-win.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$nogui = Join-Path $content "codecity.exe.gui"

Install-ChocolateyZipPackage $id $url $content

New-Item $nogui -Type File -Force
