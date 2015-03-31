$id     = "ultramon"
$kind   = "MSI"
$silent = "{9069EE0A-7615-4D86-AD80-CA263E936DA6} /Q"

Uninstall-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent
