$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$ant_home = Join-Path $package 'apache-ant-1.10.1'
$ant_bat = Join-Path $ant_home 'bin/ant.bat'

Install-ChocolateyZipPackage `
    -PackageName 'ant' `
    -Url 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.1-bin.zip' `
    -Checksum 'cf85d2b52ac379eaf83ae98544fd0317833a57811764cb1f5082f1ef046ba4f069bddf980f594ca00a93e1b37b4e646fdc8885a37651c5c9e8fc5d2b595256f6' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'ANT_HOME' `
    -VariableValue $ant_home `
    -VariableType 'Machine'

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
