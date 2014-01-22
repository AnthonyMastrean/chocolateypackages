$name   = 'scite4autohotkey'
$url    = 'http://www.autohotkey.net/~fincs/SciTE4AutoHotkey_3/SciTE4AHK3002_Install.exe'
$silent = '/SILENT'
$kind   = 'EXE'

Install-ChocolateyPackage $name $kind $silent $url
