$tools    = Split-Path $MyInvocation.MyCommand.Definition
$package  = Split-Path $tools
$imagej   = Join-Path $package 'ImageJ'
$target   = Join-Path $imagej 'ImageJ.exe'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'ImageJ.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'imagej' `
    -Url 'http://rsbweb.nih.gov/ij/download/win32/ij149-nojre.zip' `
    -Checksum '7c9fcbf8851f788e0e704ec05461a442' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
