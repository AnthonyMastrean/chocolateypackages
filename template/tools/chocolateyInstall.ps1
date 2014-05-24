$id = "<%= id %>"
$url = "<%= url %>"
$url64 = "<%= url64 %>"
$kind = "<%= kind %>"
$silent = "<%= silent %>"

#$tools = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyPackage $id $kind $silent $url $url64
#Install-ChocolateyZipPackage $id $url $content
