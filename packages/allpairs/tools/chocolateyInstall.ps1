$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'allpairs' `
    -Url 'http://www.satisfice.com/tools/pairs.zip' `
    -Checksum 'A50999058F73AE75CFD32BDDC3169B300C8210F8547FFF0B93332F738737CAC7' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
