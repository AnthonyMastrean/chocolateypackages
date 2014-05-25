$name = "ultramon"
$kind = "MSI"
$silent = "/Q"
$url = "http://www.realtimesoft.com/files/UltraMon_3.2.2_en_x32.msi"
$url64 = "http://www.realtimesoft.com/files/UltraMon_3.2.2_en_x64.msi"

Install-ChocolateyPackage $name $kind $silent $url $url64
