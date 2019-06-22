$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$package = Split-Path -Path $tools
$workdir = Join-Path -Path $package -ChildPath 'bin'
$target = Join-Path -Path $workdir -ChildPath 'filelight.exe'
$icon = Join-Path -Path $package -ChildPath 'filelight.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Filelight.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'filelight' `
    -Url 'https://download.kde.org/stable/filelight/17.12.0/filelight-17.12.0-win32.exe' `
    -Checksum '6222e29d21b0a5f9c759aea26bce3e7f04c14e0e0a0a968e7ad267b44d509c20' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
