$name   = 'ultramon'
$type   = 'MSI'
$silent = '/quiet'
$url_32 = 'http://www.realtimesoft.com/files/UltraMon_3.2.2_en_x32.msi'
$url_64 = 'http://www.realtimesoft.com/files/UltraMon_3.2.2_en_x64.msi'

Install-ChocolateyPackage $name $type $silent $url_32 $url_64
