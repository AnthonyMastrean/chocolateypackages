$name   = 'autohotkey_l'
$url    = 'http://l.autohotkey.net/v/AutoHotkey110801_Install.exe'
$silent = '/S'

$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64  
if($is64bit) { $silent += ' /x64' }
 
Install-ChocolateyPackage $name 'EXE' $silent $url
