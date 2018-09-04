$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Parent $tools) -ChildPath 'content'
$target = Join-Path -Path $content 'Flashback SAGE 2018/Super Mario Flashback.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path -Path ([System.Environment]::GetFolderPath($shortcutdir)) -ChildPath 'Super Mario Flashback.lnk'

Install-ChocolateyZipPackage `
  -PackageName 'supermarioflashback' `
  -UnzipLocation $content `
  -Url 'https://drive.google.com/uc?id=1LcjPNnDhJjVyV6hcvF8q6od1tApMQUKw&export=download' `
  -Checksum 'FBABBBC4D3CEC8A1D8C634FF13C6009A5DB417A942213CD89A79394089DAE0D5' `
  -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
  -ShortcutFilePath $shortcut `
  -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
