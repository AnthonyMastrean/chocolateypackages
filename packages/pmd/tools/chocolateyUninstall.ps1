$id  = "pmd"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$pmd_home = Join-Path $content "pmd-bin-5.3.2"
$pmd_bin  = Join-Path $pmd_home "bin/pmd.bat"

Uninstall-BinFile -Name "pmd" -Path $pmd_bin
