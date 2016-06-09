$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage `
  -PackageName 'liquibase' `
  -Url 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.0/liquibase-3.5.0-bin.zip' `
  -Checksum '4C065A0CDADCA05F9599F40A1B28FB43CBA9E63B89BF8D2F56DA10BF30933DA3' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-BinFile `
  -Name 'liquibase' `
  -Path $bat
