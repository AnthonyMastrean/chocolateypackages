$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$ant_home = Join-Path $package 'apache-ant-1.10.5'
$ant_bat = Join-Path $ant_home 'bin/ant.bat'

Uninstall-BinFile -Name 'ant' -Path $ant_bat
