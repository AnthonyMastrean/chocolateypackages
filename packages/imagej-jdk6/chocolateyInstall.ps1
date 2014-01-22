$name   = "imagej-jdk6"
$url    = "http://rsbweb.nih.gov/ij/download/win32/ij145-jdk6-setup.exe"
$url64  = "http://rsbweb.nih.gov/ij/download/win32/ij145-jdk6-64bit-setup.exe"
$kind   = "EXE"
$silent = "/SILENT"
$target = "C:\Program Files (x86)\ImageJ\ImageJ.exe"

Install-ChocolateyPackage $name $kind $silent $url $url64
Install-ChocolateyDesktopLink $target
