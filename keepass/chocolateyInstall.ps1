$name   = 'keepass'
$url    = 'http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.20/KeePass-2.20-Setup.exe?r=&ts=1348533391'
$kind   = 'EXE'
$silent = '/VERYSILENT'

Install-ChocolateyPackage $name $kind $silent $url
