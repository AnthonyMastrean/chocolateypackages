$id     = "cheatengine"
$url    = "http://mirror3.cheatengine.org/download/d1/CheatEngine64.exe"
$kind   = "EXE"
$silent = "/VERYSILENT /NORESTART"
$check  = "MD5"
$hash   = "5040fb12f24c6593dd98926706425dfb"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -ChecksumType $check -Checksum $hash
