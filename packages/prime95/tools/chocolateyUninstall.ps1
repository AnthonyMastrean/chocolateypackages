$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'prime95.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
