$id = "allpairs"
$url = "http://www.satisfice.com/tools/pairs.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage $id $url $content
