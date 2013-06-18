$name   = 'zoomit'
$url    = 'http://download.sysinternals.com/files/ZoomIt.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$nogui   = Join-Path $content 'ZoomIt.exe.gui'

New-Item $nogui -Type 'File' -Force

Install-ChocolateyZipPackage $name $url $content
