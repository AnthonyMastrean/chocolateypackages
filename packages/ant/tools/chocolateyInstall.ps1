$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$ant_home = Join-Path $package 'apache-ant-1.10.5'
$ant_bat = Join-Path $ant_home 'bin/ant.bat'

Install-ChocolateyZipPackage `
    -PackageName 'ant' `
    -Url 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.5-bin.zip' `
    -Checksum '2E48F9E429D67708F5690BC307232F08440D01EBE414059292B6543971DA9C7CD259C21533B9163B4DD753321C17BD917ADF8407D03245A0945FC30A4E633163' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'ANT_HOME' `
    -VariableValue $ant_home `
    -VariableType 'Machine'

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
