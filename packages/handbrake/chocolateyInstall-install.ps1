$name   = "handbrake.install"
$url    = "http://handbrake.fr/rotation.php?file=HandBrake-0.9.9-1_i686-Win_GUI.exe"
$url64  = "http://handbrake.fr/rotation.php?file=HandBrake-0.9.9-1_x86_64-Win_GUI.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url $url64
