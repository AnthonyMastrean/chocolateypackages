$name   = "cmake.install"
$kind   = "EXE"
$silent = "/S"
$url    = "http://www.cmake.org/files/v2.8/cmake-2.8.12.1-win32-x86.exe"

Install-ChocolateyPackage $name $kind $silent $url
