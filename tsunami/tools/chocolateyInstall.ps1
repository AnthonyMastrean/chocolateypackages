$name   = "tsunami"
$url    = "http://tsunami.io.s3.amazonaws.com/installers/tsunami/Tsunami_With_x86_Excel.msi"
$url64  = "http://tsunami.io.s3.amazonaws.com/installers/tsunami/Tsunami_With_x64_Excel.msi"
$kind   = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $name $kind $silent $url $url64
