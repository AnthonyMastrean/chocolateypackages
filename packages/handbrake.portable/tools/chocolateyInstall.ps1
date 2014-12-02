$name   = "handbrake.portable"
$url    = "https://handbrake.fr/rotation.php?file=HandBrake-0.10.0-x86_64-Win_CLI.zip"
$url64  = "https://handbrake.fr/rotation.php?file=HandBrake-0.10.0-i686-Win_CLI.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage -packageName $name -url $url -url64bit $url64 -unzipLocation $content
