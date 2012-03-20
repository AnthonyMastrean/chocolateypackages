$name = 'notepad2-mod'
$url  = 'http://notepad2-mod.googlecode.com/files/Notepad2-mod.4.2.25.720.exe'
$args = '/VERYSILENT'
Install-ChocolateyPackage $name 'EXE' $args $url