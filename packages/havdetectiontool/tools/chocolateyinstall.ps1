$ErrorActionPreference = 'Stop'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$exe     = Join-Path $content 'havdetectiontool.exe'

Get-ChocolateyWebFile `
  -PackageName  'havdetectiontool' `
  -Url          'http://download.microsoft.com/download/1/9/F/19FD407F-A7E9-4393-A845-D0B1F539678E/havdetectiontool.exe' `
  -Checksum     'ed10ff694ceeb71c24af25d9f3c2b964' `
  -FileFullPath $exe
