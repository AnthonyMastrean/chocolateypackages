$id  = "cobertura"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "cobertura-2.1.1"
$check   = Join-Path $pkg_home "cobertura-check.bat"
$instr   = Join-Path $pkg_home "cobertura-instrument.bat"
$merge   = Join-Path $pkg_home "cobertura-merge.bat"
$report  = Join-Path $pkg_home "cobertura-report.bat"

Uninstall-BinFile -Name "cobertura-check" -Path $check
Uninstall-BinFile -Name "cobertura-instrument" -Path $instr
Uninstall-BinFile -Name "cobertura-merge" -Path $merge
Uninstall-BinFile -Name "cobertura-report" -Path $report
