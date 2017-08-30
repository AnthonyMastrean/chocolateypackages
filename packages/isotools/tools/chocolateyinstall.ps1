$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content '3k3y/IsoTools.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'ISO Tools.lnk'

Install-ChocolateyZipPackage `
  -PackageName 'isotools' `
  -Url 'https://rpcs3.net/cdn/tools/3k3y.zip' `
  -UnzipLocation $content `
  -Checksum '380DD8E5A9577DEF5397C2A25260AD63EB33E5E097CDF604009600FFE40DAFC5' `
  -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target

New-Item -Path "$target.ignore" -Type 'File' -Force | Out-Null
