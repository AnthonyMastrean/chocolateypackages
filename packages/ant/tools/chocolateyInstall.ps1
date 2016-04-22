$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$ant_home = Join-Path $package 'apache-ant-1.9.7'
$ant_bat = Join-Path $ant_home 'bin/ant.bat'

Install-ChocolateyZipPackage `
    -PackageName 'ant' `
    -Url 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.9.7-bin.zip' `
    -Checksum '28c89951fa4752b7f0c0126fb6d6fffb9d7cc63cde822f2b8adafa45e96abaf1ff153ffe49be68f9235b8419a1d2fea468dadc19c331cdd4bdbf44354a3ef48a' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'ANT_HOME' `
    -VariableValue $ant_home `
    -VariableType 'Machine'

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
