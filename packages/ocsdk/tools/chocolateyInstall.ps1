$name   = "ocsdk"
$url    = "http://download.microsoft.com/download/6/e/0/6e0ed968-9371-4dad-9c05-5066d9e0c585/OCSDK.msi"
$kind   = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $name $kind $silent $url
