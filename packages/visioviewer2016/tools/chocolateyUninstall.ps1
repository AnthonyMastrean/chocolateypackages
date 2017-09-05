$product32 = "{95160000-0052-0409-0000-0000000FF1CE}"
$product64 = "{95160000-0052-0409-1000-0000000FF1CE}"
$product = @{32=$product32;64=$product64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage `
    -PackageName 'visioviewer2016' `
    -FileType 'MSI' `
    -Silent "$product /QN"
