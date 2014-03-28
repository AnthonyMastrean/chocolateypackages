$name   = "openide"
$url    = "https://github.com/continuoustests/OpenIDE.binaries/archive/v0.9.2.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage $name $url $content
