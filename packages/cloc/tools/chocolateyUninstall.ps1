$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content 'cloc-1.66.exe'

Uninstall-BinFile `
    -Name 'cloc' `
    -Path $bin
