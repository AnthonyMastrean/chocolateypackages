$name   = "windows7-sdk-net40"
$url    = "http://download.microsoft.com/download/2/E/9/2E911956-F90F-4BFB-8231-E292A7B6F287/GRMSDK_EN_DVD.iso"
$kind   = "EXE"
$silent = "-q -params:ADDLOCAL=ALL"

Install-ChocolateyPackage $name $kind $silent $url
