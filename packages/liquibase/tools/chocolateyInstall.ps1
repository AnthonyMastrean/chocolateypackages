$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.6.1/liquibase-3.6.1-bin.zip' `
  -Checksum 'EF9A08D10979A1149386AFEEA6E7B1539EB70C6D97B5BE28B57494057A6F2633' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
