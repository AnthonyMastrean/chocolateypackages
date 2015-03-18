$id  = "kindlegen"
$url = "http://kindlegen.s3.amazonaws.com/kindlegen_win32_v2_9.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
