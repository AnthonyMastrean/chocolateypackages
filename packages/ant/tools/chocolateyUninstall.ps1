$id = "ant"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$ant_home = Join-Path $content "apache-ant-1.9.6"
$ant_bat  = Join-Path $ant_home "bin/ant.bat"

Uninstall-BinFile -Name "ant" -Path $ant_bat
