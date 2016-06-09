$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.1/liquibase-3.5.1-bin.zip' `
  -Checksum '10B309095D5B9E18EAFB30C6E3D6DD5FCE0D35B32BEA1C64AA2CA9EBD843F0B8' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
