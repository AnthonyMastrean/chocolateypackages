$name   = "modernmix"
$url    = "http://download1us.softpedia.com/dl/e159d9e2881e127d64db650fd32bcd18/5220ee5d/100231460/software/system/ModernMix_setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
