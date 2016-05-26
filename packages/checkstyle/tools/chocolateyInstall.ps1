$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'checkstyle-6.18'
$bat = Join-Path $tools 'checkstyle.bat'

Install-ChocolateyZipPackage `
    -PackageName 'checkstyle' `
    -Url 'https://sourceforge.net/projects/checkstyle/files/checkstyle/6.18/checkstyle-6.18-bin.zip/download' `
    -Checksum '2034571567DC973E3B30D7CBB45B005A628D2C1877FC0E0F058D61DD2F0BC841' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'CHECKSTYLE_HOME' `
    -VariableValue $content `
    -VariableType 'Machine'

Install-BinFile `
    -Name 'checkstyle' `
    -Path $bat

Update-SessionEnvironment
