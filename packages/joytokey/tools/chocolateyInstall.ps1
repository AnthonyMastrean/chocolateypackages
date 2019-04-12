$content = Join-Path (Get-ToolsLocation) 'joytokey'
$target = Join-Path $content 'JoyToKey.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Joy to Key.lnk'

# Joy to Key writes to its installation directory, so it can't be in %PROGRAMDATA%
Install-ChocolateyZipPackage `
    -PackageName 'joytokey' `
    -Url 'https://joytokey.net/download/JoyToKey_en.zip' `
    -Checksum '38A3DC7829AD6A9DEEFCF163D23E31F2056A75EC18B56DE6D27DE6D198548BDD' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
