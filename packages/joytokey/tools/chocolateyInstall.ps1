$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'Joy to Key.lnk'
$target = Join-Path $content 'JoyToKey_en\JoyToKey.exe'

Install-ChocolateyZipPackage `
    -PackageName 'joytokey' `
    -Url 'http://joytokey.net/download/JoyToKey_en.zip' `
    -Checksum 'C2CCA97814225D22A0B144B4AC2CCAD8B9CE6F2ED71EB25D643ED6B89C846F4B' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
