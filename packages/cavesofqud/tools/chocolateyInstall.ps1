$id     = "cavesofqud"
$url    = "https://s3.amazonaws.com/CoQ/setup.exe"
$kind   = "EXE"
$silent = "/S /V/QN"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
