$name   = "collabnetsvn.install"
$url    = "https://downloads-members.open.collab.net/files/documents/60/8156/CDMSWE_4.1.4.zip"
$kind   = "MSI"
$silent = "/Q"

$tools  = Split-Path $MyCommand.MyInvocation.Definition
$target = Join-Path $tools "CDMSWE_4.1.4\CollabNet Desktop - Microsoft Windows Setup.msi"

Install-ChocolateyZipPackage $name $url $tools
Install-ChocolateyInstallPackage $name $kind $silent $target
