$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$exe     = Join-Path $content 'underscore.exe'

. $tools\shortcut.ps1

Get-ChocolateyWebFile `
  -PackageName  'underscore' `
  -Url          'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/underscore.exe' `
  -Checksum     '48e961d2350cc4cdb28ab4dfe4af29be' `
  -FileFullPath $exe

Install-Shortcut `
  -Link          'Underscore Mode' `
  -Target        $exe `
  -SpecialFolder 'CommonStartup' `
  -Launch
