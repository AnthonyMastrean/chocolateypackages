$id     = "ultramon"
$kind   = "MSI"
$silent = "/Q"
$url    = "http://www.realtimesoft.com/files/UltraMon_3.3.0_en_x32.msi"
$url64  = "http://www.realtimesoft.com/files/UltraMon_3.3.0_en_x64.msi"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -Url64 $url64
