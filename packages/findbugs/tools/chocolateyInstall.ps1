$id  = "findbugs"
$url = "http://downloads.sourceforge.net/project/findbugs/findbugs/3.0.1/findbugs-3.0.1.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "findbugs-3.0.1"
$bat     = Join-Path $pkg_home "bin/findbugs.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
Install-ChocolateyEnvironmentVariable -VariableName "FINDBUGS_HOME" -VariableValue $pkg_home -VariableType "Machine"

Install-BinFile -Name "findbugs" -Path $bat

Update-SessionEnvironment
