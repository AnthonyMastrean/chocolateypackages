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
  -Url 'https://ci.appveyor.com/api/buildjobs/eubw9x42h5f36h5v/artifacts/rpcs3-v0.0.3-2017-08-29-da3f3fd1_win64.zip' `
  -Checksum 'D446AA6D797889F71C494FB734596D07CF212061EAF1AB4A2486659E134443DD' `
  -ChecksumType 'SHA256' `

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target `
  -WorkingDirectory $content

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
