$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$package = Split-Path -Path $tools
$workdir = Join-Path -Path $package -ChildPath 'ghidra_9.0.1'
$target = Join-Path -Path $workdir -ChildPath 'ghidraRun.bat'
$icon = Join-Path -Path $workdir -ChildPath 'support/ghidra.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Ghidra.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'ghidra' `
    -Url 'https://ghidra-sre.org/ghidra_9.0.1_PUBLIC_20190325.zip' `
    -Checksum '58ffa488e6dc57e2c023670c1dfac0469bdb6f4e7da98f70610d9f561b65c774' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
