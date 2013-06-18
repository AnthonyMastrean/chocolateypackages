$name = 'imagej'
$url  = 'http://rsbweb.nih.gov/ij/download/win32/ij145-nojre-setup.exe'
Install-ChocolateyPackage $name 'EXE' '/SILENT' $url

$target = 'C:\Program Files (x86)\ImageJ\ImageJ.exe'
Install-ChocolateyDesktopLink $target