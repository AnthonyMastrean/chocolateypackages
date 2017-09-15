$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'bzdownloader.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Backblaze Downloader.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'backblazedownloader' `
    -Url 'https://secure.backblaze.com/api/restore_downloader' `
    -Checksum 'D8FF4E3EE638F445379BD885B84A85CCB90794F1F5268735D78A64D054C66134' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
