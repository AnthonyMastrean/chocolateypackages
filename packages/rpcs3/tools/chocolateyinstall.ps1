$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the old-style "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -Url 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-225310e04bf54efb92dbe424b2dd222248fb07bc/rpcs3-v0.0.5-7499-225310e0_win64.7z' `
  -Checksum '5CCC86F4B9D3D88E2728D6772B47B345D7730ACA8124F9143616C23534979253' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
