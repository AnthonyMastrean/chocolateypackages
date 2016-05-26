$tools = Split-Path $MyInvocation.MyCommand.Definition
$bat = Join-Path $tools 'checkstyle.bat'

Uninstall-BinFile `
    -Name 'checkstyle' `
    -Path $bat
