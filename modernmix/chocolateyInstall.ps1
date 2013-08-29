$name   = "modernmix"
$url    = "http://software-files-a.cnet.com/s/software/13/30/16/87/ModernMix-cnet-setup.exe?lop=link&ptype=3001&ontid=2072&siteId=4&edId=3&pid=13301687&psid=75886833&token=1377849023_7a0341c192a68d1409b3a2a5aa17f6e4&fileName=ModernMix-cnet-setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
