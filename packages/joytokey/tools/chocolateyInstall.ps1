$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'Joy to Key.lnk'
$target = Join-Path $content 'JoyToKey_en\JoyToKey.exe'

Install-ChocolateyZipPackage `
    -PackageName 'joytokey' `
    -Url 'http://joytokey.net/download/JoyToKey_en.zip' `
    -Checksum '549DCE0CADC972C2AA407135E41D2368C4415EB63B0E9FE5E84BA01E12A725C0' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
