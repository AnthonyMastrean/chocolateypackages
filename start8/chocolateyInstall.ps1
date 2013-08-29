$name   = "start8"
$url    = "http://software-files-a.cnet.com/s/software/13/30/16/85/Start8-cnet-setup.exe?lop=link&ptype=3001&ontid=2072&siteId=4&edId=3&pid=13301685&psid=75732532&token=1377848307_7390ecf1ce98bcb3d31b1429e0df38e2&fileName=Start8-cnet-setup.exe"
$kind   = "EXE"
$silent = "/SILENT /NOREBOOT"

Install-ChocolateyPackage $name $kind $silent $url
