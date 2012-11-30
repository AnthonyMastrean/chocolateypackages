$name   = 'mousewithoutborders'
$url    = 'http://download.microsoft.com/download/6/5/8/658AFC4C-DC02-4CB8-839D-10253E89FFF7/MouseWithoutBordersSetup.msi'
$type   = 'MSI'
$silent = '/quiet'

Install-ChocolateyPackage $name $type $silent $url
