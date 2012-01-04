$name = 'dependencywalker'

$url = 'http://www.dependencywalker.com/depends22_x86.zip'

$tools = Split-Path -parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage $name $url $content