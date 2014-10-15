$id = "multimc"
$url = "http://files.multimc.org/downloads/mmc-stable-win32.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$multimc = Join-Path $content "MultiMC"
$gui = Join-Path $multimc "MultiMC.exe.gui"
$updater = Join-Path $multimc "updater.exe.ignore"

Install-ChocolateyZipPackage $id $url $content

New-Item $gui -Type File | Out-Null
New-Item $updater -Type File | Out-Null
