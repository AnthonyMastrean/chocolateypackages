$id  = "checkstyle"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Split-Path $tools
$pkg_home = Join-Path $content "checkstyle-6.8.1"
$bat     = Join-Path $tools "checkstyle.bat"

Uninstall-BinFile -Name "checkstyle" -Path $bat
