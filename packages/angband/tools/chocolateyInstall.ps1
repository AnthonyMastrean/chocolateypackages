$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$target = Join-Path $package 'angband-4.1.0\angband.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Angband.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'angband' `
    -Url 'http://rephial.org/downloads/4.1/angband-4.1.0-win.zip' `
    -Checksum 'D6706B61B40F7C12E7B061DBB0AD8773ED2FFCCC9F6197A53EA23628F475964A' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package `

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Path "$target.gui" -Type 'File' -Force | Out-Null
