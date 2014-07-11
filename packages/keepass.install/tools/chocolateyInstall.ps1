$name   = "keepass.install"
$url    = "http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.27/KeePass-2.27-Setup.exe"
$kind   = "EXE"
$silent = "/VERYSILENT"

Install-ChocolateyPackage $name $kind $silent $url
