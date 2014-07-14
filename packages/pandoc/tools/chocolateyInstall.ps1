$id = "pandoc"
$url = "https://github.com/jgm/pandoc/releases/download/1.12.4.2/pandoc-1.12.4.2-1-windows.msi"
$kind = "MSI"
$silent = "/Q ALLUSERS=1"

Install-ChocolateyPackage $id $kind $silent $url
