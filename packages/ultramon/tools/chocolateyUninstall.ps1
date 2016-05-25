$id     = "ultramon"
$kind   = "MSI"
$silent = "{D4E62D29-31A1-4938-8CB7-7D275C1AEAC6} /Q /NORESTART"

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent
