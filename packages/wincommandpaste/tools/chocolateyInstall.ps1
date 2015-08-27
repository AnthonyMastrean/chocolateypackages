$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$exe     = Join-Path $content 'wincommandpaste.exe'

. $tools\shortcut.ps1

Get-ChocolateyWebFile `
  -PackageName  'wincommandpaste' `
  -Url          'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/wincommandpaste.exe' `
  -Checksum     '363e650edf5307ab00101c072d8972a4' `
  -FileFullPath $exe

Install-Shortcut `
  -Link          'Windows Command Paste' `
  -Target        $exe `
  -SpecialFolder 'CommonStartup' `
  -Launch
