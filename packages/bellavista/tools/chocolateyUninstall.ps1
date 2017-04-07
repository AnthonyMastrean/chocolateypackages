$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'BellaVista.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
