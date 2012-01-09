$name  = 'imagej.jdk6'
$url   = 'http://rsbweb.nih.gov/ij/download/win32/ij145-jdk6-setup.exe'
$url64 = 'http://rsbweb.nih.gov/ij/download/win32/ij145-jdk6-64bit-setup.exe'
Install-ChocolateyPackage $name 'EXE' '/SILENT' $url $url64

$target = 'C:\Program Files (x86)\ImageJ\ImageJ.exe'
Install-ChocolateyDesktopLink $target