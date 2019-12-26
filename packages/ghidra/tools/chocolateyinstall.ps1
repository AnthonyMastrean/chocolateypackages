$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$package = Split-Path -Path $tools
$workdir = Join-Path -Path $package -ChildPath 'ghidra_9.1.1_PUBLIC'
$target = Join-Path -Path $workdir -ChildPath 'ghidraRun.bat'
$icon = Join-Path -Path $workdir -ChildPath 'support/ghidra.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Ghidra.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'ghidra' `
    -Url 'https://ghidra-sre.org/ghidra_9.1.1_PUBLIC_20191218.zip' `
    -Checksum 'b0d40a4497c66011084e4a639d61ac76da4b4c5cabd62ab63adadb7293b0e506' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
