$id     = "wudt"
$kind   = "MSI"
$silent = "{CCF298AF-9CE1-4B26-B251-486E98A34789} /QN"

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent
