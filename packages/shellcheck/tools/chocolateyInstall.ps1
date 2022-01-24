$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://github.com/koalaman/shellcheck/releases/download/v0.8.0/shellcheck-v0.8.0.zip' `
    -Checksum 'cc5208d9f8799d792122204196fafb700801b4bae9bbb0a8f8a999f0a13cca1bfad440b96a3746740d85da55901e1d652592490bc196afc8bc0ebd0ae20b9aa1' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content
