$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'apm.exe'

$shortcutdir = @{$true='CommonStartup';$false='Startup'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Advanced Process Manipulation.lnk'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
