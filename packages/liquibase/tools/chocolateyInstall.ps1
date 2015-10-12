$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.4.1/liquibase-3.4.1-bin.zip' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
