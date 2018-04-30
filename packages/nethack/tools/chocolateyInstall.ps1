$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$classic = Join-Path $content 'NetHack.exe'
$classic_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Classic).lnk'
$tiles = Join-Path $content 'NetHackW.exe'
$tiles_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Tiles).lnk'

Install-ChocolateyZipPackage `
    -PackageName 'nethack' `
    -Url 'https://nethack.org/download/3.6.1/nethack-361-win-x86.zip' `
    -Checksum 'da35664aaed22b19e440a080ee43b49e' `
    -UnzipLocation $content

New-Item -Type File -Path "$classic.ignore" -Force | Out-Null
New-Item -Type File -Path "$tiles.ignore" -Force | Out-Null

Install-ChocolateyShortcut `
    -ShortcutFilePath $classic_shortcut `
    -WorkingDirectory $content `
    -TargetPath $classic

Install-ChocolateyShortcut `
    -ShortcutFilePath $tiles_shortcut `
    -WorkingDirectory $content `
    -TargetPath $tiles
