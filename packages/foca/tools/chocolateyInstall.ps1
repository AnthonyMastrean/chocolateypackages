$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$foca = Join-Path $content (Join-Path 'bin' 'FOCA.exe')
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'FOCA.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'foca' `
    -UnzipLocation $content `
    -Url 'https://www.elevenpaths.com/downloads/FocaPro.zip?agree=on' `
    -Checksum '9D0759F21AFB6E45834BA070CBA4541624E8E8042E85CA8CA5ACCD737CDE770D' `
    -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $foca

New-Item -Type 'File' -Path "$foca.ignore" -Force | Out-Null
