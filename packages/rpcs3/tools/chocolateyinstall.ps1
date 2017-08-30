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
  -Url 'https://ci.appveyor.com/api/buildjobs/0ke37r4pvilnqp02/artifacts/rpcs3-v0.0.3-2017-08-27-64a6fbe3_win64.zip' `
  -Checksum 'A1F6B37335559A59B91CD374B1A9E9DA76CFF48AA10E80E67D2F33B735BF717A' `
  -ChecksumType 'SHA256' `

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
