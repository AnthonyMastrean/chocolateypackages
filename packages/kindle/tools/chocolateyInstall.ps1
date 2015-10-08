$id     = "kindle"
$url    = "http://kindleforpc.amazon.com/40996/KindleForPC-installer-1.12.40996.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -InstallerType $kind -SilentArgs $silent -Url $url
