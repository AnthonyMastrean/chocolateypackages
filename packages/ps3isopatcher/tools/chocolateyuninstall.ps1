$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'PS3 ISO Patcher.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
