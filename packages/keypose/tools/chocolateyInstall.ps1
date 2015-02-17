$id = "keypose"
$url = "http://katastrophos.net/magnus/blog/wp-content/uploads/2008/09/keypose.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage $id $url $content
