$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'bzdownloader.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Backblaze Downloader.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'backblazedownloader' `
    -Url 'https://secure.backblaze.com/api/restore_downloader' `
    -Checksum '3B1DC5A6D228BBDF0D84E396A410DC1E87C41E2ECBDC03C5D1C8633BA9C8B35E' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
