$name = "intellijidea-community"
$url = "http://download.jetbrains.com/idea/ideaIC-14.0.3.exe"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url
