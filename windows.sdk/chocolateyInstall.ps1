$name   = 'windows.sdk'
$url    = 'http://download.microsoft.com/download/7/A/B/7ABD2203-C472-4036-8BA0-E505528CCCB7/winsdk_web.exe'
$kind   = 'EXE'
$silent = '-q -params:ADDLOCAL=ALL'

Install-ChocolateyPackage $name $kind $silent $url
