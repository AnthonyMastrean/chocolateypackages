$name    = 'pdftk'
$url     = 'http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-1.44-win.zip'
$tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage $name $url $content