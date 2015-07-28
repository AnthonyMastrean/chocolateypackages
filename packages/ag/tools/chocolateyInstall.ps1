$id  = "ag"
$url = "https://kjkpub.s3.amazonaws.com/software/the_silver_searcher/rel/0.29.1-1641/ag.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
