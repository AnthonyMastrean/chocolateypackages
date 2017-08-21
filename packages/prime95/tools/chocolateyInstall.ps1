$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'prime95.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'prime95.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'prime95' `
    -Url 'http://www.mersenne.org/ftp_root/gimps/p95v2810.win32.zip' `
    -Url64 'http://www.mersenne.org/ftp_root/gimps/p95v2810.win64.zip' `
    -Checksum 'CFC3E7C172AE321C8F99D6DE41CB019DFF9BF3A94FADF6B8F888FE3922FDDBE8' `
    -Checksum64 '25D7C9C8BA632410B964AF14106FCD017F8B10D48C37F81671C2D6FC951D8A57' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -WorkingDirectory $content `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
