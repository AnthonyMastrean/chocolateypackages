$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the old-style "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -UnzipLocation $content `
  -Url 'https://ci.appveyor.com/api/buildjobs/w36ohxu26bm9dq2q/artifacts/rpcs3-v0.0.3-2017-09-29-81b3e7e4_win64.zip' `
  -Checksum '089C2862F63F9DC94E0EF3A71386C0D5C9BFF43BF73C82AB7FAC41D4F7326059' `
  -ChecksumType 'SHA256' `

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
