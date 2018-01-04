$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content '1password-desktoplauncher.exe'

$shortcutdir = @{$true='CommonStartup';$false='Startup'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) '1Password Desktop Launcher.lnk'

Get-ChocolateyWebFile `
  -PackageName '1password-desktoplauncher' `
  -Url 'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/1password-desktoplauncher.exe' `
  -Checksum '0C03B0EB04AC71652BC8B002A1240E74E48730A9F4D82D55BF3A9F8B197C9B07' `
  -ChecksumType 'SHA256' `
  -FileFullPath $target

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
