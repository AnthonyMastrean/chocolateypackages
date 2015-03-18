$id     = "kindlepreviewer"
$url    = "http://kindlepreviewer.s3.amazonaws.com/KindlePreviewerInstall.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
