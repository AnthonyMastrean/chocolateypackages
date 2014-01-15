$name   = "modernmix"
$url    = "http://stardock.cachefly.net/ModernMix_setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
