$id     = "<%= id %>"
$url    = "<%= url %>"
$url64  = "<%= url64 %>"
$kind   = "<%= kind %>"
$silent = "<%= silent %>"

#$tools   = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -Url64 $url64
#Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
