$name   = "handbrake.install"
$url    = "https://handbrake.fr/rotation.php?file=HandBrake-0.10.0-i686-Win_GUI.exe"
$url64  = "https://handbrake.fr/rotation.php?file=HandBrake-0.10.0-x86_64-Win_GUI.exe"
$kind   = "EXE"
$silent = "/S"

Install-ChocolateyPackage $name $kind $silent $url $url64
