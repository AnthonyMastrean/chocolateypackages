$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$package = Split-Path -Path $tools
$workdir = Join-Path -Path $package -ChildPath 'ghidra_9.1.2_PUBLIC'
$target = Join-Path -Path $workdir -ChildPath 'ghidraRun.bat'
$icon = Join-Path -Path $workdir -ChildPath 'support/ghidra.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Ghidra.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'ghidra' `
    -Url 'https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip' `
    -Checksum 'ebe3fa4e1afd7d97650990b27777bb78bd0427e8e70c1d0ee042aeb52decac61' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
