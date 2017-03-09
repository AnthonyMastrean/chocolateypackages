$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bellavista32 = Join-Path $content 'Win32\BellaVista.exe'
$bellavista64 = Join-Path $content 'x64\BellaVista.exe'
$bellavista = @{32=$bellavista32;64=$bellavista64}[(Get-ProcessorBits)]
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'BellaVista.lnk'

Install-ChocolateyZipPackage `
  -PackageName 'bellavista' `
  -Url 'http://www.zezula.net/download/bellavista_en.zip' `
  -Checksum '1C6B2CB57DDB2B3582F443C2F1CC49E86AEF2FD9B44F446BA9225FF811A2E366' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

New-Item -Type 'File' -Path "$bellavista32.ignore" -Force | Out-Null
New-Item -Type 'File' -Path "$bellavista64.ignore" -Force | Out-Null

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $bellavista
