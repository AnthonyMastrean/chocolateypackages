$name   = 'zoomit'
$url    = 'http://download.sysinternals.com/files/ZoomIt.zip'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage $name $url $content
