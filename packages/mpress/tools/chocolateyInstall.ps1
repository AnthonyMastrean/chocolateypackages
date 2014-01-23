$name    = "mpress"
$url     = "http://www.matcode.com/mpress.219.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Path
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage -PackageName $name -Url $url -UnzipLocation $content
