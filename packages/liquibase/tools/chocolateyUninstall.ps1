$id  = 'liquibase'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Uninstall-BinFile -Name $id -Path $bat
