$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$target = Join-Path $package 'adom\adom.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'ADOM (Classic).lnk'

Install-ChocolateyZipPackage `
    -PackageName 'adom-classic' `
    -Url 'http://www.ancardia.com/download/adom_windows_r60_pub.zip' `
    -Checksum '4E7A513F6B8CFFC0D63A35F51117FC95F951BE7C82CFDD7B0DB79C719D018DBE' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
