$id     = "goggalaxy"
$url    = "http://cdn.gog.com/open/galaxy/client/installers/setup_galaxy_1.0.2.958.exe"
$kind   = "EXE"
$silent = "/VERYSILENT /NORESTART"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
