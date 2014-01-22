$name   = "diffmerge"
$url    = "http://download-us.sourcegear.com/DiffMerge/4.2.0/DiffMerge_4.2.0.697.stable_x86.msi"
$url64  = "http://download-us.sourcegear.com/DiffMerge/4.2.0/DiffMerge_4.2.0.697.stable_x64.msi"
$kind   = "MSI"
$silent = "/quiet"

Install-ChocolateyPackage $name $kind $silent $url $url64
