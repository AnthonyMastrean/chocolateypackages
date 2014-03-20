$name   = "microsoftbuildtools"
$url    = "http://download.microsoft.com/download/9/B/B/9BB1309E-1A8F-4A47-A6C5-ECF76672A3B3/BuildTools_Full.exe"
$kind   = "EXE"
$silent = "/S /NoRestart"

Install-ChocolateyPackage $name $kind $silent $url
