$id = "dvdshrink"
$url = "http://fs40.filehippo.com/7497/86c4c175ec984d718dcde80f4f2cc4cc/dvdshrink32setup.exe"
$kind = "EXE"
$silent = "/VERYSILENT"

Install-ChocolateyPackage $id $kind $silent $url
