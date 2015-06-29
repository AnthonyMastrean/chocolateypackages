$id  = "ant"
$url = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.4-bin.zip"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$ant_home = Join-Path $content "apache-ant-1.9.4"
$ant_bin  = Join-Path $ant_home "bin"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
Install-ChocolateyEnvironmentVariable -VariableName "ANT_HOME" -VariableValue $ant_home -VariableType "Machine"

Update-SessionEnvironment
