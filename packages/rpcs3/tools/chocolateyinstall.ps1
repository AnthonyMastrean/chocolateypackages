$ErrorActionPreference = 'Stop'
$content = Join-Path (Get-ToolsLocation) 'rpcs3'
$target = Join-Path $content 'rpcs3.exe'
$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'RPCS3.lnk'
$url64 = 'https://github.com/RPCS3/rpcs3-binaries-win/releases/download/build-db5d03c3407f272966411ae97342f26ed60a648f/rpcs3-v0.0.8-9355-db5d03c3_win64.7z'
$checksum64 = 'fc84caa1a16ea355ae549f88876542b96976aae6cf3b37b43fc1d9b6dc61682c'

# This package must be installed in a low-privilege location. I could not get
# it to run in the default %PROGRAMDATA%\Chocolatey\lib location. I was forced
# to use the "tools" location.
Install-ChocolateyZipPackage `
  -PackageName 'rpcs3' `
  -Url64bit $url64 `
  -Checksum64 $checksum64 `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
