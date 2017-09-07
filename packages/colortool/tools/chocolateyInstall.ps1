$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'colortool' `
    -Url 'https://github.com/Microsoft/console/releases/download/1708.14008/colortool.zip' `
    -Checksum 'EF317660A8CACA83C708B2915274B2B4D611A3AB90C4DE128D21B58461FCDDFA' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
