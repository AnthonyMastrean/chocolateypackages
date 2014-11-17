$name = "intellijidea-ultimate"
$url = "http://download.jetbrains.com/idea/ideaIU-14.0.1.exe"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url
