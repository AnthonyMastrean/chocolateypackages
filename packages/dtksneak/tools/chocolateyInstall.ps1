$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$exe     = Join-Path $content 'dtksneak.exe'

. $tools\shortcut.ps1

Get-ChocolateyWebFile `
  -PackageName  'dtksneak' `
  -Url          'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/dtksneak.exe' `
  -Checksum     '0a22c21ba7caf5347587ed168a598a1e' `
  -FileFullPath $exe

Install-Shortcut `
  -Link          'DTK Sneak' `
  -Target        $exe `
  -SpecialFolder 'CommonStartup' `
  -Launch
