$ErrorActionPreference = 'Stop'

$id      = 'sil'
$name    = 'Sil'
$url     = 'http://www.amirrorclear.net/flowers/game/sil/Sil-121-Win.zip'
$hash    = 'c6f5237fed3a8264806afbeba675a3ac'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'Sil'
$exe     = Join-Path $content 'sil.exe'

. $tools\shortcut.ps1
. $tools\bins.ps1

$zip_args = @{
  packageName   = $id
  unzipLocation = $package
  url           = $url
  checksum      = $hash
}

$shortcut_args = @{
  link          = $name
  target        = $exe
  specialFolder = 'CommonPrograms'
}

$bin_args = @{
  path = $exe
}

Install-ChocolateyZipPackage @zip_args
Install-Shortcut @shortcut_args
Install-IgnoreBin @bin_args
