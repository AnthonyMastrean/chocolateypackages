$id  = "cobertura"
$url = "http://downloads.sourceforge.net/project/cobertura/cobertura/2.1.1/cobertura-2.1.1-bin.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "cobertura-2.1.1"
$check   = Join-Path $pkg_home "cobertura-check.bat"
$instr   = Join-Path $pkg_home "cobertura-instrument.bat"
$merge   = Join-Path $pkg_home "cobertura-merge.bat"
$report  = Join-Path $pkg_home "cobertura-report.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content
Install-ChocolateyEnvironmentVariable -VariableName "COBERTURA_HOME" -VariableValue $pkg_home -VariableType "Machine"

Install-BinFile -Name "cobertura-check" -Path $check
Install-BinFile -Name "cobertura-instrument" -Path $instr
Install-BinFile -Name "cobertura-merge" -Path $merge
Install-BinFile -Name "cobertura-report" -Path $report

Update-SessionEnvironment
