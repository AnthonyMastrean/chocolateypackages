$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'prime95.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'prime95.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'prime95' `
    -Url 'http://www.mersenne.org/ftp_root/gimps/p95v294b7.win32.zip' `
    -Checksum '896A2F90D198AA4A6D1FFC912FCE10F30A0BBC127F711BE64871E2887A48B283' `
    -ChecksumType 'SHA256' `
    -Url64 'http://www.mersenne.org/ftp_root/gimps/p95v294b8.win64.zip' `
    -Checksum64 '00C24E7D131529A08D0C0C268CC8DC1349F69C3B46D04B7FCAA391B373B184D6' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -WorkingDirectory $content `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
