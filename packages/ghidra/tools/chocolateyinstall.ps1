$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$package = Split-Path -Path $tools
$workdir = Join-Path -Path $package -ChildPath 'ghidra_9.0.2'
$target = Join-Path -Path $workdir -ChildPath 'ghidraRun.bat'
$icon = Join-Path -Path $workdir -ChildPath 'support/ghidra.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Ghidra.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'ghidra' `
    -Url 'https://ghidra-sre.org/ghidra_9.0.2_PUBLIC_20190403.zip' `
    -Checksum '10ffd65c266e9f5b631c8ed96786c41ef30e2de939c3c42770573bb3548f8e9f' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
