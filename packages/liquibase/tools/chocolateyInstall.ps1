$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.4.2/liquibase-3.4.2-bin.zip' `
  -Checksum 'a9dd3b92b2a24fcd4e1ac6cd53991b33' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
