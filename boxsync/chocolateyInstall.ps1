$name = "boxsync"
$url = "https://sync.box.com/static/sync/release/BoxSyncInstaller_Win32.msi"
$url64 = "https://sync.box.com/static/sync/release/BoxSyncInstaller_Win64.msi"
$kind = "MSI"
$silent = "/QUIET"

Install-ChocolateyPackage $name $kind $silent $url $url64
