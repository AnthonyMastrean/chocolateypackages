$id     = "sendtokindle"
$url    = "http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe"
$kind   = "EXE"
$silent = "/S"
$exits  = @(0, 1223)

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -ValidExitCodes $exits
