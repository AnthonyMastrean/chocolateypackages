$shortcutdir = @{$true='CommonStartup';$false='Startup'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Advanced Process Manipulation.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
