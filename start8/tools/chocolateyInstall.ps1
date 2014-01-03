$name   = "start8"
$url    = "http://stardock.cachefly.net/Start8_setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
