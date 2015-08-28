$tools   = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$fonts   = Join-Path $package 'dejavu-fonts-ttf-2.35\ttf'

function Install-Fonts {
  param([string] $path)

  $FONT_FOLDER = 0x14

  $shell = New-Object -ComObject 'Shell.Application'
  $source = $shell.Namespace($path)
  $target = $shell.Namespace($FONT_FOLDER)
  $target.CopyHere($source.Items())
}

Install-ChocolateyZipPackage `
  -PackageName   'dejavufonts' `
  -Url           'http://sourceforge.net/projects/dejavu/files/dejavu/2.35/dejavu-fonts-ttf-2.35.zip' `
  -Checksum      'd8b5214d35bcd2bfcb2cffa7795b351d' `
  -UnzipLocation $package

Install-Fonts `
  -Path $fonts
