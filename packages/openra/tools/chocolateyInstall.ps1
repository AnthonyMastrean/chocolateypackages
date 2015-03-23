$id     = "openra"
$url    = "https://github.com/OpenRA/OpenRA/releases/download/release-20141029/OpenRA-release-20141029.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -SilentArgs $silent -Url $url
