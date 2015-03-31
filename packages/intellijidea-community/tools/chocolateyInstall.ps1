$id     = "intellijidea-community"
$url    = "https://download.jetbrains.com/idea/ideaIC-14.1.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
