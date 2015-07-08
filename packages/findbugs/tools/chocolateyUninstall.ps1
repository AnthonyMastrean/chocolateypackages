$id  = "findbugs"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "findbugs-3.0.1"
$bat     = Join-Path $pkg_home "bin/findbugs.bat"

Uninstall-BinFile -Name "findbugs" -Path $bat
