$name   = "divvy"
$url    = "https://mizage.com/downloads/InstallDivvy.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url
