$name = 'dependencywalker'

$url = 'http://www.dependencywalker.com/depends22_x86.zip'

$tools = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $name $url $tools