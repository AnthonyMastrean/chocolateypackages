$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content 'codecity.exe'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'CodeCity.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'codecity' `
    -Url 'http://wettel.github.io/download/codecity-win.zip' `
    -Checksum '98CB19CE685B5271E7167F424B4FBE6E786256E5844674054A2925B8FA018992' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

New-Item -Type 'File' -Path "$bin.ignore" -Force | Out-Null

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $bin
