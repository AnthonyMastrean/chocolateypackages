$id     = "kindle"
$url    = "http://kindleforpc.amazon.com/40666/KindleForPC-installer.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -InstallerType $kind -SilentArgs $silent -Url $url
