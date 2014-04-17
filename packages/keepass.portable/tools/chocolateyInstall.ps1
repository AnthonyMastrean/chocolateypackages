$name    = "keepass.portable"
$url     = "http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.26/KeePass-2.26.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$gui     = Join-Path $content "KeePass.exe.gui"

New-Item $content -Type Directory -Force
New-Item $gui -Type File -Force

Install-ChocolateyZipPackage $name $url $content
