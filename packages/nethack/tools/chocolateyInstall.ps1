$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$classic = Join-Path $content 'NetHack.exe'
$classic_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Classic).lnk'
$tiles = Join-Path $content 'NetHackW.exe'
$tiles_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Tiles).lnk'

Install-ChocolateyZipPackage `
    -PackageName 'nethack' `
    -Url 'https://sourceforge.net/projects/nethack/files/nethack/3.6.0/nethack-360-win-x86-2.zip/download' `
    -Checksum 'da1dcadb67ccdbe4fa7ffda096565c14' `
    -UnzipLocation $content

New-Item -Type File -Path "$tiles.gui" -Force | Out-Null

Install-ChocolateyShortcut `
    -ShortcutFilePath $classic_shortcut `
    -TargetPath $classic

Install-ChocolateyShortcut `
    -ShortcutFilePath $tiles_shortcut `
    -TargetPath $tiles
