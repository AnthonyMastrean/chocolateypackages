$id = "clink.install"
$url = "https://github.com/mridgers/clink/releases/download/0.4.3/clink_0.4.3_setup.exe"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $id $kind $silent $url
