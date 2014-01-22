$name   = 'usbview'
$url    = 'http://www.ftdichip.com/Support/Utilities/usbview.zip'
$tools  = Split-Path $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $name $url $tools
