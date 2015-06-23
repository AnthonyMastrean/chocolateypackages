$id   = 'prime95'
$name = 'Prime95'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

. $tools\shortcut.ps1

Remove-Shortcut -Link $name -SpecialFolder "CommonPrograms"
