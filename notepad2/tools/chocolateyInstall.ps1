$name  = 'notepad2'
$url   = 'http://www.flos-freeware.ch/zip/Notepad2_4.2.25_x86.exe'
$url64 = 'http://www.flos-freeware.ch/zip/Notepad2_4.2.25_x64.exe' 

Install-ChocolateyPackage $name 'EXE' '/SILENT' $url $url64