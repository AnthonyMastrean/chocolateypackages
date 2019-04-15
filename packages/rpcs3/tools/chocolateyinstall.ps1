$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -Url 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-f99577114327d59d583119b5ef8c2b30f7cd0f4c/rpcs3-v0.0.6-7981-f9957711_win64.7z' `
  -Checksum 'F90BAD4979A5B90C8BBE65FB88E1159B3BC43720442CF2C2B2CD4CA2DACC09C2' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
