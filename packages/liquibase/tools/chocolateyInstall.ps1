$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.6.2/liquibase-3.6.2-bin.zip' `
  -Checksum '1773e867c649010f1d8c3a18bfdcde0b2e1fdb2fe205878dcf517a766d58f6bc2fef741588c9e2cdc863731d068c48a8874d3a0add2015394009ff7fd00c70ab' `
  -ChecksumType 'SHA512' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
