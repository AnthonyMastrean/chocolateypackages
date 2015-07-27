$name   = "apachedirectorystudio"
$url    = "https://archive.apache.org/dist/directory/studio/dist/2.0.0.v20130628/ApacheDirectoryStudio-win32-x86-2.0.0.v20130628.exe"
$url64  = "https://archive.apache.org/dist/directory/studio/dist/2.0.0.v20130628/ApacheDirectoryStudio-win32-x86_64-2.0.0.v20130628.exe"
$kind   = "EXE"
$silent = "/S"
$hash   = "d6dcb0537fbd9d8a301eab22a542a193"
$hash64 = "f0758eb31062e6842e5bfea77447a4cc"

Install-ChocolateyPackage -PackageName $name -FileType $kind -Silent $silent -Url $url -Url64 $url64 -Checksum $hash -Checksum64 $hash64
