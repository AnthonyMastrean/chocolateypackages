$name   = 'scite4autohotkey'
$url    = 'http://www.autohotkey.net/~fincs/SciTE4AutoHotkey_3/SciTE4AHK3002_Install.exe'
$silent = '/SILENT'

Install-ChocolateyPackage $name 'EXE' $silent $url
