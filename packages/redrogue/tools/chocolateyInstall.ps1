$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'redrogue.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Red Rogue.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'redrogue' `
    -Url 'https://s3.amazonaws.com/redrogue/redrogue.exe.zip' `
    -Checksum '9442784664EA52EFA4954ACA46A6B9EAB7DCFC943FEBCE1AC17F6B62A9D49A16' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
