$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'CodeCity.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
