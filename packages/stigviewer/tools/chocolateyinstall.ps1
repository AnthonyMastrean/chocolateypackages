$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Parent $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath "STIGViewer-2.8.jar"

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'STIG Viewer.lnk'

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -UnzipLocation $content `
    -Url 'http://iasecontent.disa.mil/stigs/zip/U_STIGViewer_2-8.zip' `
    -Checksum '66D4A6EFC863774929D84F4FAAF2F3484BA57607ECFFAA39731FF6547A117B7E' `
    -ChecksumType 'SHA256'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
