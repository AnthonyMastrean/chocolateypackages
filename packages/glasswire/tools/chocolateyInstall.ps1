$id = "glasswire"
$url = "https://www.glasswire.com/download/GlassWireSetup.exe"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $id $kind $silent $url
