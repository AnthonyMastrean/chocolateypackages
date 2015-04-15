$id    = "ksp-demo"
$name  = "Kerbal Space Program (Demo)"
$zip   = "ksp-demoInstall.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonDesktop"
Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"

Uninstall-ChocolateyZipPackage -PackageName $id -ZipFileName $zip
