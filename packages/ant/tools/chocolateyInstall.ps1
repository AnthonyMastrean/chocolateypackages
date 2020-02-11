$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$ant_home = Join-Path $package 'apache-ant-1.10.7'
$ant_bat = Join-Path $ant_home 'bin/ant.bat'

Install-ChocolateyZipPackage `
    -PackageName 'ant' `
    -Url 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.7-bin.zip' `
    -Checksum '4afbf7d474b38da07992e820f22f2979e28fa8db71997ccb8ee63fe5cb32478fe26e1675feabb70321af24f25a37747c0f6d198a9e43ba747b65e3f8076f3dff' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'ANT_HOME' `
    -VariableValue $ant_home `
    -VariableType 'Machine'

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
