$name = 'notepad2-mod'
$url  = 'https://github.com/XhmikosR/notepad2-mod/releases/download/4.2.25.955/Notepad2-mod.4.2.25.955.exe'
$args = '/VERYSILENT'
Install-ChocolateyPackage $name 'EXE' $args $url