$name = 'keepass'
$url  = 'http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.18/KeePass-2.18-Setup.exe?r=&ts=1325968281&use_mirror=voxel'
Install-ChocolateyPackage $name 'EXE' '/VERYSILENT' $url