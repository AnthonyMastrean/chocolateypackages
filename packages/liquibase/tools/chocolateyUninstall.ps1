$id = 'liquibase'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$shim    = Join-Path $ENV:chocolateyInstall 'bin\liquibase.exe'

Remove-Item $shim -Force | Out-Null
