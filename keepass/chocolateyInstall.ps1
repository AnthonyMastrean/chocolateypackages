$name   = 'keepass'
$url    = 'http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.21/KeePass-2.21-Setup.exe?r=http%3A%2F%2Fkeepass.info%2Fdownload.html&ts=1361221558'
$kind   = 'EXE'
$silent = '/VERYSILENT'

Install-ChocolateyPackage $name $kind $silent $url
