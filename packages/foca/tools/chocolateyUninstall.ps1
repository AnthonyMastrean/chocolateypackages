$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'FOCA.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
