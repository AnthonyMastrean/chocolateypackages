$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$prime = Join-Path $content 'prime95.exe'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'prime95.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'prime95' `
    -Url 'http://www.mersenne.org/ftp_root/gimps/p95v289.win32.zip' `
    -Url64 'http://www.mersenne.org/ftp_root/gimps/p95v289.win64.zip' `
    -Checksum 'F8C58AB55A2578B243711D3CB1640F62C501AC515E9DC076009AF7E6525D66A4' `
    -Checksum64 '6DEAA2C6C07FBF0E4259A66ABF56A5E7A69A7623D5AA0803D567D7A75CD513E8' `
    -ChecksumType 'SHA256' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $prime

New-Item -Type 'File' -Path "$prime.ignore" -Force | Out-Null
