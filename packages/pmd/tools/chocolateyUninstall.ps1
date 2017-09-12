$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$pmd_home = Join-path $package 'pmd-bin-5.8.1'
$pmd_bin = Join-Path $pmd_home 'bin/pmd.bat'
$cpd_bin = Join-Path $pmd_home 'bin/cpd.bat'

Uninstall-BinFile -Name 'pmd' -Path $pmd_bin
Uninstall-BinFile -Name 'cpd' -Path $cpd_bin
