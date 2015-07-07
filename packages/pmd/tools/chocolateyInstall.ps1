$id  = "pmd"
$url = "http://downloads.sourceforge.net/project/pmd/pmd/5.3.2/pmd-bin-5.3.2.zip"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$pmd_home = Join-path $content "pmd-bin-5.3.2"
$pmd_bin  = Join-Path $pmd_home "bin/pmd.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
Install-ChocolateyEnvironmentVariable -VariableName "PMD_HOME" -VariableValue $pmd_home -VariableType "Machine"

Install-BinFile -Name "pmd" -Path $pmd_bin

Update-SessionEnvironment
