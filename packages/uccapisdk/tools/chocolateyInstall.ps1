$name   = "uccapisdk"
$url    = "http://download.microsoft.com/download/D/1/6/D1658355-2C30-4921-9BFC-0C889B2898E1/UccApiSdk.msi"
$kind   = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $name $kind $silent $url
