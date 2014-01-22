$name = 'isowriter'

$tools   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage "$name" 'http://alexfeinman.com/download/ISORecorder/ISOWriter.0.5.1.zip' "$content"