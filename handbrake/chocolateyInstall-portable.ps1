$name   = "handbrake.portable"
$url    = "http://handbrake.fr/rotation.php?file=HandBrake-0.9.9-i686-Win_CLI.zip"
$url64  = "http://handbrake.fr/rotation.php?file=HandBrake-0.9.9-x86_64-Win_CLI.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage -packageName $name -url $url -url64bit $url64 -unzipLocation $content
