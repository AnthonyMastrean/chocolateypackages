$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'findbugs-3.0.1'
$findbugs = Join-Path $content 'bin/findbugs.bat'
$icon = Join-Path $content 'bin/findbugs.ico'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'FindBugs.lnk'

Install-ChocolateyZipPackage `
    -PackageName 'findbugs' `
    -Url 'http://downloads.sourceforge.net/project/findbugs/findbugs/3.0.1/findbugs-3.0.1.zip' `
    -Checksum '61EE01904E05A7A5FA2F1A84D8C40EF6F875C19FE2E3CCDAAFB75ACD13918904' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'FINDBUGS_HOME' `
    -VariableValue $content `
    -VariableType 'Machine'

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $findbugs `
    -WorkingDirectory $content `
    -IconLocation $icon `

Update-SessionEnvironment
