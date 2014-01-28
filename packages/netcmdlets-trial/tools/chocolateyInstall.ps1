$name   = "netcmdlets-trial"
$url    = "__URL__"
$kind   = "MSI"
$silent = "/Q"

#$tools = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyPackage $name $kind $silent $url $url64
#Install-ChocolateyZipPackage $name $url $content
