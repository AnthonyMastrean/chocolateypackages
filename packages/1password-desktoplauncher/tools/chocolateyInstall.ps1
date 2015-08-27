$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$exe     = Join-Path $content '1password-desktoplauncher.exe'

. $tools\shortcut.ps1

Get-ChocolateyWebFile `
  -PackageName  '1password-desktoplauncher' `
  -Url          'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/1password-desktoplauncher.exe' `
  -Checksum     '70664d89885869d294b1c5b2801a7601' `
  -FileFullPath $exe

Install-Shortcut `
  -Link          '1Password Desktop Launcher' `
  -Target        $exe `
  -SpecialFolder 'CommonStartup' `
  -Launch
