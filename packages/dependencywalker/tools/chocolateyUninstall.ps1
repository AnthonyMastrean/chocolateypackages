$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'Dependency Walker.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
