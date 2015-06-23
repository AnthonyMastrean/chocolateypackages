$name   = 'prime95'
$url    = 'ftp://mersenne.org/gimps/p95v285.win32.zip'
$url64  = 'ftp://mersenne.org/gimps/p95v285.win64.zip'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage $name $url $content $url64
