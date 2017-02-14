$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'FindBugs.lnk'

Remove-Item -Path $shortcut -Force | Out-Null
