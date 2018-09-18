$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the old-style "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -Url 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-ed8aa774bb59e7d155af95b52e9e7894c8777780/rpcs3-v0.0.5-7345-ed8aa774_win64.7z' `
  -Checksum '94D64C77299DD2A96F4066E2EE538D4EEA686D05D9E153DE05BD15802E89C59A' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
