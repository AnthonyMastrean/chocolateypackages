$id     = "sendtokindle"
$url    = "http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
