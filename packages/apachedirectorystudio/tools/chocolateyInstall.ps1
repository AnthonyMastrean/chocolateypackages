$name   = "apachedirectorystudio"
$url    = "http://psg.mtu.edu/pub/apache//directory/studio/dist/2.0.0.v20130628/ApacheDirectoryStudio-win32-x86-2.0.0.v20130628.exe"
$url64  = "http://psg.mtu.edu/pub/apache//directory/studio/dist/2.0.0.v20130628/ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url $url64
