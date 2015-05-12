$id      = "visioviewer2010"
$kind    = "MSI"
$silent  = "/QN"
$product = "{95140000-0052-0409-0000-0000000FF1CE}"

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent "$product $silent"
