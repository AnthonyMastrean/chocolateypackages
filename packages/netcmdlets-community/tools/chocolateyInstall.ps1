$name   = "__NAME__"
$url    = "__URL__"
$url64  = "__URL64__"
$kind   = "MSI"
$silent = "/Q"

#$tools = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyPackage $name $kind $silent $url $url64
#Install-ChocolateyZipPackage $name $url $content
