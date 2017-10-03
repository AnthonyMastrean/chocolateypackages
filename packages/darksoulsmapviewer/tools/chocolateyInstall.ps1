$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'main.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Dark Souls Map Viewer.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'darksoulsmapviewer' `
    -Url 'https://drive.google.com/uc?id=0B0tCARwy-xAJWHB5ajBVTk9NRGc&export=download' `
    -Checksum '6D80FDD0B5006ED97D1243AC7F626F4C5D31EB3A88B58DF3366E07C6C4B04E8E' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
