$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'Sil/sil.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Sil.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'sil' `
    -Url 'http://www.amirrorclear.net/flowers/game/sil/Sil-130-Win.zip' `
    -Checksum '613A9BBD6DC9869FE6FD352F6E3AF21060421AB5C56CF27DB3F1C2CE49B5A908' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
