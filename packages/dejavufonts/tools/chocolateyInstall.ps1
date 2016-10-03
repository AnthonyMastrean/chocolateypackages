$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$fonts = Join-Path $package 'dejavu-fonts-ttf-2.37\ttf'

function Install-Fonts($path) {
  $FONT_FOLDER = 0x14

  $shell = New-Object -ComObject 'Shell.Application'
  $source = $shell.Namespace($path)
  $target = $shell.Namespace($FONT_FOLDER)
  $target.CopyHere($source.Items())
}

Install-ChocolateyZipPackage `
  -PackageName 'dejavufonts' `
  -Url 'https://github.com/dejavu-fonts/dejavu-fonts/releases/download/version_2_37/dejavu-fonts-ttf-2.37.zip' `
  -Checksum '7576310B219E04159D35FF61DD4A4EC4CDBA4F35C00E002A136F00E96A908B0A' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $package

Install-Fonts `
  -Path $fonts
