$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'patcher/test_patcher.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'PS3 ISO Patcher.lnk'

Install-ChocolateyZipPackage `
  -PackageName 'ps3isopatcher' `
  -Url 'https://rpcs3.net/cdn/tools/patcher.zip' `
  -UnzipLocation $content `
  -SpecificFolder 'patcher/test_patcher.exe' `
  -Checksum 'C96BD5AD31D4CC81E82CCC2B0570FD67C7C2267772F6D2C1D2C1612CC12DE7D0' `
  -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
