$id  = "ant"
$url = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.6-bin.zip"
$md5 = "a2ab149c0ef45ac6bdcb59cba46efac8"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$ant_home = Join-Path $content "apache-ant-1.9.6"
$ant_bat  = Join-Path $ant_home "bin/ant.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content -Checksum $md5 -ChecksumType "md5"
Install-ChocolateyEnvironmentVariable -VariableName "ANT_HOME" -VariableValue $ant_home -VariableType "Machine"

Install-BinFile -Name "ant" -Path $ant_bat

Update-SessionEnvironment
