$name   = "start8"
$url    = "http://download1us.softpedia.com/dl/446ca52a82d2543d80e1eacc755e69aa/5220edc5/100209499/software/os_enhance/Start8_setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
