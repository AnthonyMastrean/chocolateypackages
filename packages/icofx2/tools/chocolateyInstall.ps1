$id = "icofx2"
$url = "http://icofx.ro/files/icofxsetup.exe"
$kind = "EXE"
$silent = "/VERYSILENT"

Install-ChocolateyPackage $id $kind $silent $url
