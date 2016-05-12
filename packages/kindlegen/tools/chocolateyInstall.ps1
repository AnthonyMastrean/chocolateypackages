$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'kindlegen' `
    -Url 'http://kindlegen.s3.amazonaws.com/kindlegen_win32_v2_9.zip' `
    -Checksum '70B8401736684A1C390D4A95BA918283FCB3A36405C9A9895732DEB50274540B' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
