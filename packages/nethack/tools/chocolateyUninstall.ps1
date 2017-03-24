$classic_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Classic).lnk'
$tiles_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'NetHack for Windows (Tiles).lnk'

Remove-Item -Path $classic_shortcut -Force | Out-Null
Remove-Item -Path $tiles_shortcut -Force | Out-Null
