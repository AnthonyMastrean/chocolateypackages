$id     = "openra"
$url    = "https://github.com/OpenRA/OpenRA/releases/download/release-20140608/OpenRA-release-20140608.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -SilentArgs $silent -Url $url
