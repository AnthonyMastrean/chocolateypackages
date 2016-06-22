$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'Joy to Key.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
