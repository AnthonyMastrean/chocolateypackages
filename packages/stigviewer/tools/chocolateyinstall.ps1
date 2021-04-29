$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Parent $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath "STIGViewer.bat"

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'STIG Viewer.lnk'

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -UnzipLocation $content `
    -Url 'https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_STIGViewer_2-14_Win64.zip' `
    -Checksum '4D22B3B11533F67A4890D5D81536086180C0D42D8025709569C0036255BF1ABF' `
    -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
