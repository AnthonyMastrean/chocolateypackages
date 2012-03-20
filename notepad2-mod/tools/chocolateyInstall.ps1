$name = 'notepad2-mod'
$url  = 'http://code.google.com/p/notepad2-mod/downloads/detail?name=Notepad2-mod.4.2.25.720.exe'
$args = '/VERYSILENT'
Install-ChocolateyPackage $name 'EXE' $args $url