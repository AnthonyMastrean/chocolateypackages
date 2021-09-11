$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Parent $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath "STIG Viewer\STIG Viewer.exe"

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'STIG Viewer.lnk'

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -UnzipLocation $content `
    -Url 'https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer_2-15_Win64.zip' `
    -Checksum 'AC8CF9E2E0BF73BA0FBD82D151DBC49F387E596ECD060BE84AE5A9C4631D6EF5' `
    -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
