$id        = "visioviewer2013"
$kind      = "MSI"
$silent    = "/QN"
$product64 = "{95150000-0052-0409-1000-0000000FF1CE}"
$product32 = "{95150000-0052-0409-0000-0000000FF1CE}"
$product   = @{32=$product32;64=$product64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent "$product $silent"
