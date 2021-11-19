$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://github.com/koalaman/shellcheck/releases/download/v0.9.0/shellcheck-v0.9.0.zip' `
    -Checksum '31f415a995864d238e4c286cfd0227dae3c9bcc6c327b925e182a390c9258a1783f815ba4389d85bea504cfe62b1babdc862303f2ef014af66d4189a42797bd0' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content
