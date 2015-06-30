$id  = "ant"
$url = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.5-bin.zip"
$md5 = "a12331d16ba75edf64dbcb3232e5a41d"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$ant_home = Join-Path $content "apache-ant-1.9.5"
$ant_bat  = Join-Path $ant_home "bin/ant.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content -Checksum $md5 -ChecksumType "md5"
Install-ChocolateyEnvironmentVariable -VariableName "ANT_HOME" -VariableValue $ant_home -VariableType "Machine"

Install-BinFile -Name "ant" -Path $ant_bat

Update-SessionEnvironment
