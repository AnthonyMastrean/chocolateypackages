$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the old-style "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -Url 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-d8424a1f355dd39d0edb356889bcc333815e9d17/rpcs3-v0.0.5-7433-d8424a1f_win64.7z' `
  -Checksum '64E17FFF79E5E9E210CE14759D538D7F9E13BB32A0916B17A16F0403A8746FDD' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
