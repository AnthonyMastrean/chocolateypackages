$name   = 'scite4autohotkey'
$url    = 'http://www.autohotkey.net/~fincs/SciTE4AutoHotkey_3/SciTE4AutoHotkey3000_Install.exe'
$silent = '/SILENT'

Install-ChocolateyPackage $name 'EXE' $silent $url
