$tools    = Split-Path $MyInvocation.MyCommand.Definition
$package  = Split-Path $tools
$imagej   = Join-Path $package 'ImageJ'
$target   = Join-Path $imagej 'ImageJ.exe'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ImageJ.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'imagej' `
    -Url 'http://wsr.imagej.net/distros/win/ij150-win-nojre.zip' `
    -Checksum '44E2C83E9E877B075AAB83DDEDFDAF28' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
