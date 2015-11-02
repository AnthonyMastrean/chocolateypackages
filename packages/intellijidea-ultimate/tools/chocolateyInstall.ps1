$id     = "intellijidea-ultimate"
$url    = "https://download.jetbrains.com/idea/ideaIU-15.0.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
