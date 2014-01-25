$name   = "keepass"
$url    = "http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.24/KeePass-2.24-Setup.exe?r=&ts=1325968281&use_mirror=voxel"
$kind   = "EXE"
$silent = "/VERYSILENT"

Install-ChocolateyPackage $name $kind $silent $url
