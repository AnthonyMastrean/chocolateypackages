$id     = 'cheatengine'
$url    = 'http://mirror3.cheatengine.org/download/d1/CheatEngine64.exe'
$kind   = 'EXE'
$silent = '/VERYSILENT /NORESTART'
$hash   = '006c015012735e402aea1ee29da9a5fb'

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -Checksum $hash
