$id = "dvdshrink"
$url = "http://download1us.softpedia.com/dl/543e64fecbd49a63cb63ccd0b348dc7d/53cab72f/100004128/software/cd_dvd_tools/dvdshrink32setup.zip"
$kind = "EXE"
$silent = "/VERYSILENT"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$setup = Join-Path $tools "dvdshrink32setup.exe"

Install-ChocolateyZipPackage $id $url $tools
Install-ChocolateyInstallPackage $id $kind $silent $setup
