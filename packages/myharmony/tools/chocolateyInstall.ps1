$id = "myharmony"
$url = "http://app.myharmony.com/prod/win/1.0/win8/MyHarmony-App.exe"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $id $kind $silent $url
