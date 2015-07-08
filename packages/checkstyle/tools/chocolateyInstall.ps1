$id  = "checkstyle"
$url = "http://downloads.sourceforge.net/project/checkstyle/checkstyle/6.8.1/checkstyle-6.8.1-bin.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "checkstyle-6.8.1"
$bat     = Join-Path $tools "checkstyle.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
Install-ChocolateyEnvironmentVariable -VariableName "CHECKSTYLE_HOME" -VariableValue $pkg_home -VariableType "Machine"

@"
@ECHO OFF
java -jar "$pkg_home\checkstyle-6.8.1-all.jar" %*
"@ | Out-File $bat -Encoding 'ASCII' -Force

Install-BinFile -Name "checkstyle" -Path $bat

Update-SessionEnvironment
