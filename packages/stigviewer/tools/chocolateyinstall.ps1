$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Parent $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath "STIGViewer.bat"

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'STIG Viewer.lnk'

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -UnzipLocation $content `
    -Url 'https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer_2-13_Win64.zip' `
    -Checksum '0F5B1A23BBAAAF68E50079DA366EDF50C30B68A8E0E427B19D8AABD55E5099D9' `
    -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
